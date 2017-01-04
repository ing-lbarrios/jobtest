class AuthorsController < ApplicationController
  def index
    @authors = Author.all.to_a

    render json: @authors
  end

  def create
    attributes = params.require(:author).permit(:name, :city, :birth_date)
    @author = Author.create! attributes
    render json: @author
  end

  def update
  end

  def destroy
  end
end
