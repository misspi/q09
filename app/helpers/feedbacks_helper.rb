module FeedbacksHelper
  def author_of(feedback)
    if feedback.user
      "#{feedback.user.username} (#{feedback.user.email})"
    elsif !feedback.email.blank?
      "alguien en #{feedback.email}"
    else
      'alguien anónimamente'
    end
  end
end
