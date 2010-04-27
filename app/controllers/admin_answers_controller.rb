class AdminAnswersController < AdminController
  inherit_resources
  defaults :resource_class => Answer, :collection_name => 'answers', :instance_name => 'answer'
end
