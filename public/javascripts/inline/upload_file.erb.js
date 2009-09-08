(function($) {
    var id = "#<%= id %>";

    var addThumbnail = function(bucket_id, src) {
        $(id +"_ajax .thumbnails").append(tag("div", ['class', 'bucket', 'id', 'bucket_' + bucket_id],
            tag("img", ['src', src], "") +
            tag("a", ['href', '#', 'id',"destroy_" +bucket_id, 'class', 'destroy_bucket']  , "borrar")));
                
        $("#destroy_" + bucket_id).click(function() {
            if (confirm("¿Estás segura segura?")) {
                $("#bucket_" + bucket_id).remove();
            }
            return false;
        });
    }

    var tag = function(name, extra, content) {
        result = "<" + name;
        for (var index = 0; index < extra.length; index += 2) {
            result += " " + extra[index] + '="' + extra[index + 1] + '"'
        }
        result += ">" + content + "</" + name + ">";
        return result;
    }

    var addBucketID = function(id) {
        var current = $.trim($(id).val());
        var value = (current.length == 0) ? id : current + "," + id
        $(id).val(value);
    }

    var setWorking = function(isWorking) {
        if (isWorking) {
            $(id + "_ajax img").show();
            $(id + "_ajax a").hide();
        }else{
            $(id + "_ajax img").hide();
            $(".thumbnails img").show();
            $(id + "_ajax a").show();
        }
    }

    var parseJSON = function(response) {
        var begin = response.indexOf('{');
        var end = response.lastIndexOf('}');
        response = response.substring(begin, end + 1);
        response = "(" + response + ")";
        return eval(response);
    }

    jQuery(function() {
        $("#<%= id %>").hide();
        var uno = tag("div", ["class", "thumbnails"], "") + tag("a", ["id", "<%= id %>_link", "href", "#"], "<%= label %>") +
        tag("img", ["src", "/images/spinner.gif", "style", "display: none"], "");
        $("#<%= id %>").wrap(tag('div', ['id', "<%= id %>_ajax", 'class', 'uploader'], '')).
        after(uno);

        $.getJSON("<%= load_path %>", function(data) {
            $.each(data, function(val, key) {
                addThumbnail(key['bucket_id'], key['thumbnail']);
            });
        });

        new AjaxUpload("#<%= id %>_link",
        {
            action: '<%= save_path %>',
            name: 'bucket[media]',
            data: {
                authenticity_token : '<%= token %>',
                response: 'all'
            },
            onSubmit: function(file, extension) {
                setWorking(true);
            },
            onComplete: function(file, response) {
                var data = parseJSON(response);
                addThumbnail(data['thumbnail']);
                addBucketID(data['bucket_id']);
                setWorking(false);
            }
        });
    });
}
)(jQuery);