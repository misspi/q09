jQuery(function($) {
  $("#<%= id %>").hide();
  $("#<%= id %>").wrap('<div id="<%= id %>_ajax"></div>').
	after('<div class="thumbnail"></div><a id="<%= id %>_link" href="#">' + 
	'<%= label %></a><img src="/images/spinner.gif" style="display: none" />');

  new AjaxUpload("#<%= id %>_link",
  {action: '<%= path %>',
    name: 'bucket[media]',
    data: {authenticity_token : '<%= token %>', response: 'all'},
    onSubmit: function(file, extension) {
      $("#<%= id %>_ajax a").hide();
      $("#<%= id %>_ajax img").show();
    },
    onComplete: function(file, response) {
      $("#<%= id %>_ajax img").hide();
      $("#<%= id %>_ajax .thumbnail").html(response).show();
      var begin = response.indexOf('{');
      var end = response.lastIndexOf('}');
      response = response.substring(begin, end + 1);
      response = "(" + response + ")";
      var res = eval(response);
      $("#<%= id %>_ajax .thumbnail").html('<img src="' + res['thumbnail'] + '" />');
      $("#<%= id %>_ajax a").show();
    }
  });
});