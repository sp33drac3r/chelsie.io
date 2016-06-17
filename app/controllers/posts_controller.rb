class PostsController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @posts = @school.posts.reverse

    render :json => {
      :school => @school,
      :posts => @posts
    }
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @flags = @post.flags

    render :json => {
      :post => @post,
      :comments => @comments,
      :flags => @flags
    }
  end

  def create
    @post = Post.new(post_params)
    @post.school_id = params[:school_id]

    if @post.save
      render :json => @post
    end
  end

  def edit
    @post = Post.find(params[:id])

    render :json => @post
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      render :json => @post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render :json => {response: "Post successfully deleted"}
    else
      render :json => {response: "Server error: Post cannot be deleted"}
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end
