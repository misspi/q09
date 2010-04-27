class AdminFeedbacksController < AdminController
  inherit_resources
  defaults :resource_class => Feedback, :collection_name => 'feedbacks', :instance_name => 'feedback'

end
