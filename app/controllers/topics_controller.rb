class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.ordered
  end

  def show
    @quizzes = @topic.quizzes.ordered
  end

  def new 
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      respond_to do |format|
        format.html { redirect_to topics_path, notice: "Topic was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Topic was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      respond_to do |format|
        format.html { redirect_to topics_path, notice: "Topic was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Topic was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_path, notice: "Topic was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Topic was successfully destroyed." }
    end
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name)
  end
end
