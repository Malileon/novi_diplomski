class TextInputQuestionsController < ApplicationController
  before_action :set_topic, :set_quiz
  before_action :set_text_input_question, only: [:edit, :update, :destroy]

  def new
    @text_input_question = @quiz.text_input_question.build
  end

  def create
    @text_input_question = @quiz.text_input_question.build(text_input_question_params)

    if @text_input_question.save
      respond_to do |format|
        format.html { redirect_to topic_quiz_path(@topic, @quiz), notice: "Question successfully created." }
        format.turbo_stream { flash.now[:notice] = "Question successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @text_input_question.update(text_input_question_params)
      redirect_to topic_quiz_path(@topic, @quiz), notice: "Question successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @text_input_question.destroy

    redirect_to topic_quiz_path(@topic, @quiz), notice: "Question successfully destroyed."
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_text_input_question
    @text_input_question = TextInputQuestion.find(params[:id])
  end

  def text_input_question_params
    params.require(:text_input_question).permit(:question_text, :answer)
  end
end 