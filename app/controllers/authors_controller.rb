class AuthorsController < ApplicationController
  def index
    @authors = Author.all.includes(:images, :books).map { |author| AuthorPresenter.new(author) }
  end
end
