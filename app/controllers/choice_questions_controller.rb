class ChoiceQuestionsController < ApplicationController
  before_action :set_topic, :set_quiz
  before_action :set_choice_question, only: [:show, :edit, :update, :destroy]
  # before_action :set_choices, only: [:show, :edit, :update, :destroy]

  def new
    @choice_question = @quiz.choice_question.build
  end

  def create
    @choice_question = @quiz.choice_question.build(choice_question_params)

    if @choice_question.save
      respond_to do |format|
        format.html { redirect_to topic_quiz_path(@topic, @quiz), notice: "Question successfully created." }
        format.turbo_stream { flash.now[:notice] = "Question was successfully created." }        
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @choice_question = @quiz.question.where(question_id: params[:id])
  end

  def edit
  end

  def update
    if @choice_question.update(choice_question_params)
      respond_to do |format|
        format.html { redirect_to topic_quiz_path(@topic, @quiz), notice: "Question successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Question successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @choice_question.destroy

    respond_to do |format|
      format.html { redirect_to topic_quiz_path(@topic, @quiz), notice: "Question successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quesiton successfully destroyed." }
    end
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_choice_question
    @choice_question = ChoiceQuestion.find(params[:id])
  end

  def choice_question_params
    params.require(:choice_question).permit(:question_text)
  end
end 