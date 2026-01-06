class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  def initialize(book_repository = Book)
    @repository = book_repository
    @create_use_case = CreateUseCase.new(@repository)
    @find_all_use_case = FindAllUseCase.new(@repository)
    @find_one_use_case = FindOneUseCase.new(@repository)
    @update_use_case = UpdateUseCase.new(@repository)
    @delete_use_case = DeleteUseCase.new(book_repository: @repository)
  end

  # GET /books
  def index
    books = @find_all_use_case.execute

    render json: books
  end

  # GET /books/1
  def show
    book = @find_one_use_case.execute(params[:id])

    render json: book
  end

  # POST /books
  def create
    book = @create_use_case.execute(book_params)

    render json: book, status: :created, location: book
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /books/1
  def update
    book_data = book_params.merge(id: params[:id])
    @update_use_case.execute(book_data)

    head :no_content
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # DELETE /books/1
  def destroy
    @delete_use_case.execute(book_id: params[:id])

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = @find_one_use_case.execute(params[:id])
    rescue
      head :not_found
    end

    # Only allow a list of trusted parameters through.
    def book_params
      if params.respond_to?(:require)
        p = params.require(:book).permit(:title, :rating, :comment, :bookcase_id, :author_id)
        { title: p[:title], rating: p[:rating], comment: p[:comment], bookcase_id: p[:bookcase_id], author_id: p[:author_id] }
      else
        params.fetch(:book, {}).symbolize_keys
      end
    end
end
