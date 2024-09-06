class ChoicesController < ApplicationController
  before_action :set_quiz
  before_action :set_topic
  before_action :set_choice_question

  def new
    @choice = @choice_question.choice.build
  end

  def create
    @choice = @choice_question.choice.build(choice_params)

    if @choice.save
      redirect_to topic_quiz_path(@topic, @quiz)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def choice_params
    params.require(:choice).permit(:value, :is_correct)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_choice_question
    @choice_question = ChoiceQuestion.find(params[:choice_question_id])
  end
end