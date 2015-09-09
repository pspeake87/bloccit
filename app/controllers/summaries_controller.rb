class SummariesController < ApplicationController
  

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
    authorize @post
  end

  def show
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
  end

  def create
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @summary = Summary.new(params.require(:summary).permit(:description))
     @post.user = current_user
     @post.topic = @topic
     authorize @post
     if @summary.save
       flash[:notice] = "Summary was saved."
       redirect_to [@topic, @post, @summary]
     else
       flash[:error] = "There was an error saving the summary. Please try again."
       render :new
     end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @post
  end

  def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @summary = Summary.find(params[:id])
     authorize @post
     if @summary.update_attributes(params.require(:summary).permit(:description))
       flash[:notice] = "Summary was updated."
       redirect_to [@topic, @post, @summary]
     else
       flash[:error] = "There was an error saving the summary. Please try again."
       render :edit
     end
   end
end
