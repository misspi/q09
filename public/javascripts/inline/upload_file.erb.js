(function($) {
    Array.remove = function(array, from, to) {
        var rest = array.slice((to || from) + 1 || array.length);
        array.length = from < 0 ? array.length + from : from;
        return array.push.apply(array, rest);
    };

    var id = "#<%= id %>";

    var addThumbnail = function(bucket_id, src) {
        $(id +"_ajax .thumbnails").append(tag("div", ['class', 'bucket', 'id', 'bucket_' + bucket_id],
            tag("img", ['src', src], "") +
            tag("a", ['href', '#', 'id',"destroy_" +bucket_id, 'class', 'destroy_bucket']  , "borrar")));
                
        $("#destroy_" + bucket_id).click(function() {
            if (confirm("¿Estás segura segura?")) {
                var url = "/buckets/"+ bucket_id + ".js";
                console.log(url);
                $.post(url, {
                    _method: "delete",
                    authenticity_token : '<%= token %>'
                }, null, "json")
                $("#bucket_" + bucket_id).remove();
                removeBucketID(bucket_id);
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

    var removeBucketID = function(id) {
        var current = $.trim($(id).val()).split(',');
        var index = current.indexOf(id);
        if (index >= 0)
            Array.remove(current, index)
        $(id).val(current.join(','));
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
       // $("#<%= id %>").hide();
        var extra = tag("div", ["class", "thumbnails"], "") +
        tag("a", ["id", "<%= id %>_link", "href", "#"], "<%= label %>") +
        tag("img", ["src", "/images/spinner.gif", "style", "display: none"], "");
        $("#<%= id %>").wrap(tag('div', ['id', "<%= id %>_ajax", 'class', 'uploader'], '')).
        after(extra);

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
            onSubmit: function() {
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