class ChoicesController < ApplicationController
  before_action :set_quiz
  before_action :set_topic
  before_action :set_choice_question
  before_action :set_choice, only:[:edit, :update, :destroy]

  def new
    @choice = @choice_question.choice.build
  end

  def create
    @choice = @choice_question.choice.build(choice_params)

    if @choice.save
      respond_to do |format|
        format.html { redirect_to topic_quiz_path(@topic, @quiz), notice: "Choice successfully saved." }
        format.turbo_stream { flash.now[:notice] = "Choice successfully saved." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @choice.update(choice_params)
      respond_to do |format|
        format.html { redirect_to topic_quiz_path(@topic, @quiz), notice: "Choice successfully updated."; puts "html" }
        format.turbo_stream { flash.now[:notice] = "Choice successfully updated."; puts "turbostream" }
      end
    end
  end

  def destroy
    @choice.destroy

    respond_to do |format|
      format.html { redirect_to topic_quiz_path(@topic, @quiz), notice: "Choice successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Choice successfully destroyed." }
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

  def set_choice
    @choice = Choice.find(params[:id])
  end

  def set_choice_question
    @choice_question = ChoiceQuestion.find(params[:choice_question_id])
  end
end