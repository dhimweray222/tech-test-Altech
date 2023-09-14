class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.includes(:author).all.page(params[:page])
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    if params[:book][:author_id].blank? && params[:book][:new_author_name].present?
      # Create a new author
      @author = Author.create(name: params[:book][:new_author_name])
      # Assign the newly created author to the book
      @book = Book.new(book_params.merge(author: @author))
      SendWelcomeEmailJob.perform_later(current_user)

    else
      @book = Book.new(book_params)
    end

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to @book, notice: 'Book was successfully destroyed.'
  end
  def respons_json
    @books = Book.includes(:author).all

    render json: @books.to_json(include: { author: { only: :name } })
  end
  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description,:publication_year, :author_id, )
  end
end
