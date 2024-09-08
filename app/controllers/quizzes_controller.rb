class QuizzesController < ApplicationController
  before_action :set_user
  before_action :set_topic, only:[:show, :new, :create]
  before_action :set_quiz, only:[:destroy, :show]
  
  def show
    @questions = @quiz.get_questions(@quiz, params[:id])
    @choices = []
    @questions.each do |question|
      if question.get_type == "ChoiceQuestion"
        @choices += question.choice
      end
    end
  end

  def new
    @quiz = @topic.quizzes.build
  end

  def create
    @quiz = @topic.quizzes.build(quiz_params)

    if @quiz.save
      #TODO Ovo nece biti topic_path
      redirect_to topic_path(@topic), notice: "Quiz was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @quiz.destroy
    
    redirect_to topic_path(@topic), notice: "Quiz successfully destroyed."
  end

  private
  def quiz_params
    params.require(:quiz).permit(:name).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_user
    @user = current_user
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end