(function($) {

    var id = "#<%= id %>";

    var addThumbnail = function(src) {
        $(id +"_ajax .thumbnail").append('<img src="' + src + '" />');
    }

    var setBucketID = function(id) { 
        $(id).val(id);
    }
    var getBucketID = function() { 
        return 
    }

    var addBucketID = function(id) {
        var current = $(id).val();
    }

    var setWorking = function(isWorking) {
        if (isWorking) {
            $("#<%= id %>_ajax img").show();
            $("#<%= id %>_ajax a").hide();
        }else{
            $("#<%= id %>_ajax img").hide();
            $(".thumbnail img").show();
            $("#<%= id %>_ajax a").show();
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
        $("#<%= id %>").wrap('<div id="<%= id %>_ajax" class="uploader"></div>').
        after('<div class="thumbnail"></div><a id="<%= id %>_link" href="#">' +
            '<%= label %></a><img src="/images/spinner.gif" style="display: none" />');

        $.getJSON("<%= load_path %>", function(data) {
            addThumbnail(data['thumbnail']);
        });

        new AjaxUpload("#<%= id %>_link",
        {
            action: '<%= save_path %>',
            name: 'bucket[media]',
            data: {
                authenticity_token : '<%= token %>',
                response: 'all',
                replace: getBucketID()
            },
            onSubmit: function(file, extension) {
                setWorking(true);
            },
            onComplete: function(file, response) {
                var data = parseJSON(response);
                addThumbnail(data['thumbnail']);
                setBucketID(data['bucket_id']);
                setWorking(false);
            }
        });
    });
}
)(jQuery);