class FeedbacksController < ApplicationController
  inherit_resources
  actions :new, :create

  def create
    create!(:notice => t('feedbacks.created')) { root_path }
  end
end
