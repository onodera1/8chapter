class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all

  end

  def top
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
  	book = Book.new(book_params)
  	if book.save
  	   flash[:notice] = "Book was successfully created."
  	   redirect_to book_path(book)
  	else
       render action: :index
  	end
    #詳細
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    # @book.update(book_params)
     if @book.update(book_params)
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book)
    
  	else
       render action: :show
  end
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
