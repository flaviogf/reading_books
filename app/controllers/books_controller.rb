class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end

  def new
    @book = Book.new
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
    @book = Book.find params[:id]

    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]

    if @book.update(books_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find params[:id]

    @book.destroy

    redirect_to books_url
  end

  private
  def books_params
    params.require(:book).permit(:title, :author, :cover, :status)
  end
end
