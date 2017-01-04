class PostsController < ApplicationController
  def index
    @posts = Post.all
    @authors = @posts.map do |post|
      Author.where("id = #{post.author_id}").first
    end

    render json: { posts: @posts, authors: @authors }
  end

  def show
    @post = Post.where("id IN(#{params[:id]})").first
    render json: @post
  end

  def create
    attributes = params.require(:post).permit(:author_id, :content)
    @post = Post.create! attributes

    render json: @post
  end

  def update
  end

  def destroy
  end
end
