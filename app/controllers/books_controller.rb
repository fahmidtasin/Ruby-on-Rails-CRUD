class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @subjects = Subject.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @subjects = Subject.all
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = 'Book created successfully.'
	  redirect_to books_path
    else
      @subjects = Subject.all
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    @subjects = Subject.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
	flash[:notice] = 'Book deleted successfully.'
    redirect_to books_path
  end

  #def show_subjects
   # @subjects = Subject.find(params[:id])
  #end
  
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
	  flash[:notice] = 'Book has been update successfully!'
      redirect_to action: 'edit'
    else
      @subjects = Subject.all
      render :edit
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :price, :subject_id, :description)
  end

end
