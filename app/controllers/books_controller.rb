class BooksController < ApplicationController

	def index
		@book = Book.new
		@books = Book.all
	end

	def create
		book = Book.new(book_params)
		if book.save
			flash[:notice] = "successfully 投稿したよ"
			redirect_to book_path(book)
		end
	end

	def new
  		@book = Book.new
	end

	def edit
		@book = Book.find(params[:id])
	end

   def update
   	book = Book.find(params[:id])
   	if book.update(book_params)
   		flash[:notice] = "successfully"
   	redirect_to book_path(book)
   	end
	end

	def destroy
   	book = Book.find(params[:id])
	   	if book.destroy
	   		flash[:notice] = "successfully"
	   		redirect_to books_path
	   	end
	end

	def show
		@book = Book.find(params[:id])
	end

	 private
   def book_params
      params.require(:book).permit(:title, :body)
    end
end
