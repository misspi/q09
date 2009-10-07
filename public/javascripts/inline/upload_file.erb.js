(function($) {
    Array.remove = function(array, from, to) {
        var rest = array.slice((to || from) + 1 || array.length);
        array.length = from < 0 ? array.length + from : from;
        return array.push.apply(array, rest);
    };

    var id = "#<%= id %>";

    var addThumbnail = function(key) {
        var bucket_id = key['bucket_id'];
        var src = key['thumbnail'];
        var url = key['url'];

        $(id +"_ajax .thumbnails").append(tag("div", ['class', 'bucket', 'id', 'bucket_' + bucket_id],
            tag("a", ['href', url], tag("img", ['src', src], "")) +
            tag("a", ['href', '#', 'id',"destroy_" +bucket_id, 'class', 'destroy_bucket']  , "borrar")));
                
        $("#destroy_" + bucket_id).click(function() {
            if (confirm("¿Estás segura segura?")) {
                var url = "/buckets/"+ bucket_id + ".js";
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

    var addBucketID = function(bucket_id) {
        var current = getCurrentValue();
        setCurrentValue((current.length == 0) ? bucket_id : current + "," + bucket_id);
    }

    var removeBucketID = function(bucket_id) {
        var current = getCurrentValue().split(',');
        var index = current.indexOf(bucket_id.toString());
        if (index >= 0)
            Array.remove(current, index)
        setCurrentValue(current.join(','));
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

    var getCurrentValue = function() {
        return $.trim($(id).val());
    }

    var setCurrentValue = function(value) {
        $(id).val(value);
    }

    var getCurrentThumbnails = function() {
        if (getCurrentValue().length > 0) {
            setWorking(true);
            $.getJSON("<%= load_path %>", function(data) {
                $.each(data, function(val, key) {
                    addThumbnail(key);
                });
                setWorking(false);
            });
        }
    }

    jQuery(function() {
        $("#<%= id %>").hide();
        var extra = tag("div", ["class", "thumbnails"], "") +
        tag("a", ["id", "<%= id %>_link", "href", "#"], "<%= label %>") +
        tag("img", ["src", "/images/spinner-gray.gif", "style", "display: none"], "");
        $("#<%= id %>").wrap(tag('div', ['id', "<%= id %>_ajax", 'class', 'uploader'], '')).
        after(extra);

        getCurrentThumbnails();

        new AjaxUpload("#<%= id %>_link",
        {
            action: '<%= save_path %>',
            name: 'bucket[media]',
            data: {
                authenticity_token : '<%= token %>',
                response: 'all'
            },
            responseType: 'json',
            onSubmit: function() {
                setWorking(true);
            },
            onComplete: function(file, response) {
                //var data = parseJSON(response);
                var data = response;
                addThumbnail(data);
                addBucketID(data['bucket_id']);
                setWorking(false);
            }
        });
    });
}
)(jQuery);