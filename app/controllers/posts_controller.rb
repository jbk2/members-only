class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post.id), notice: "yay, saved successfully"
    else
      render new_post_path, notice: "nope, wasn't saved"
    end
  end

  def index
    @posts = Post.order("updated_at DESC")
  end

  def show
    @post = Post.find_by(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :id, :user_id)
  end
end
