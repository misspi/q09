require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  context "An Answer instance" do
    setup do
      @user = Factory(:user)
      @question = Factory(:question)
      @answer = Factory(:answer, :user => @user, :question => @question, :value => "theValue")
    end

    should "have a user" do
      assert_same @user, @answer.user
    end

    should "have a question" do
      assert_same @question, @answer.question
    end

    should "have a value" do
      assert_equal "theValue", @answer.value
    end

  end
end
