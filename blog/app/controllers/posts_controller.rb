class PostsController < ApplicationController
  def index
    puts SuperAgent.retrieve_posts
    @posts = SuperAgent.retrieve_posts[:posts][:posts]
  end

  def show
    @post = SuperAgent.find_post(params[:id].to_i)[:post]
  end

  def new
    @authors = SuperAgent.retrieve_authors
  end
  
  def create
    SuperAgent.create_post(params)
  end
end
