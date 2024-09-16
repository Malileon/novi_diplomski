class QuizSessionsController < ApplicationController
  before_action :set_user
  before_action :set_quiz
  before_action :set_topic

  def show
  end

  def new
    @questions = @quiz.get_questions(@quiz)
    @choices = []
    @questions.each do |question|
      if question.get_type == "ChoiceQuestion"
        @choices += question.choice
      end
    end
  end

  def create
    @quiz_session = @quiz.quiz_sessions.build(quiz_session_params)
    points = @quiz_session.evaluate(params[:quiz_session][:answers], @quiz)
    @quiz_session.points = points

    unless @quiz.user_id == current_user.id
      if @quiz_session.save
        respond_to do |format|
          format.html { redirect_to topic_quiz_path(@topic, @quiz), notice: "Quiz successfully submitted." }
          format.turbo_stream { flash.now[:notice] = "Quiz successfully submitted." }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private
  def quiz_session_params
    if current_user
      params.require(:quiz_session).permit(:answers).merge(user_id: current_user.id, user_type: "user", quiz_id: @quiz.id)
    else
      #todo guest
    end
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_user
    #TODO: guest
    @user = current_user
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
end