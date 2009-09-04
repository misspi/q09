require 'test_helper'

class UserSurveyTest < ActiveSupport::TestCase

  context "Some answers in different groups" do
    setup do
      @user = Factory(:user)
      Factory( :answer, :user => @user, :question => Factory(:question, :group => 'one') )
      Factory( :answer, :user => @user, :question => Factory(:question, :group => 'two') )
    end

    context "a UserSurvey instance" do
      setup do
        @survey = UserSurvey.find('one', @user.id)
      end

      should "have on question" do
        assert_equal 1, @survey.questions.size
      end
    end
  end

  context "Some answers and questions" do
    setup do
      @user = Factory(:user)
      3.times do |index|
        q = Factory(:question, :group => 'simple', :name => "question_#{index}")
        Factory(:answer, :question => q, :user => @user)
        Factory(:answer, :question => q, :user_id => 100)
      end
      Factory(:question, :group => 'outside')
    end

    context "A UserSurvey instance" do
      setup do
        @survey = UserSurvey.find('simple', @user.id)
      end

      should "have 3 questions" do
        assert_equal 3, @survey.questions.size
      end

      should "have 3 answers" do
        assert_equal 3, @survey.answers.size
      end

      should "have question 1" do
        assert_equal "question_1",  @survey.question("question_1").name
      end

      should "have answer 1" do
        assert_equal "question_1", @survey.answer("question_1").question.name
      end
    end
  end
end
