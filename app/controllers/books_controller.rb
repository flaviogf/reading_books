class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  def index
    @books = Book.all
  end

  def create
    @book = Book.new books_params

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(books_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private
  def books_params
    params.require(:book).permit(:title, :author, :cover, :status)
  end

  def set_book
    @book = Book.find params[:id]
  end
end
