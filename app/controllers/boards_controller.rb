class BoardsController < ApplicationController
  def index
    books = Book.all

    @books_to_read = books.filter { |it| it.to_read? }

    @reading_books = books.filter { |it| it.reading? }

    @read_books = books.filter { |it| it.read? }
  end
end
