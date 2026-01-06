class BookcasesController < ApplicationController
  before_action :set_bookcase, only: %i[ show update destroy ]

  def initialize(bookcase_repository = Bookcase)
    @repository = bookcase_repository
    @create_use_case = CreateUseCase.new(@repository)
    @find_all_use_case = FindAllUseCase.new(@repository)
    @find_one_use_case = FindOneUseCase.new(@repository)
    @update_use_case = UpdateUseCase.new(@repository)
    @delete_use_case = DeleteUseCase.new(bookcase_repository: @repository)
  end

  # GET /bookcases
  def index
    bookcases = @find_all_use_case.execute

    render json: bookcases
  end

  # GET /bookcases/1
  def show
    bookcase = @find_one_use_case.execute(params[:id])

    render json: bookcase
  end

  # POST /bookcases
  def create
    bookcase = @create_use_case.execute(bookcase_params)

    render json: bookcase, status: :created, location: bookcase
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /bookcases/1
  def update
    bookcase_data = bookcase_params.merge(id: params[:id])
    @update_use_case.execute(bookcase_data)

    head :no_content
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # DELETE /bookcases/1
  def destroy
    @delete_use_case.execute(bookcase_id: params[:id])

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookcase
      @bookcase = @find_one_use_case.execute(params[:id])
    rescue
      head :not_found
    end

    # Only allow a list of trusted parameters through.
    def bookcase_params
      if params.respond_to?(:require)
        p = params.require(:bookcase).permit(:limit, :name)
        { limit: p[:limit], name: p[:name] }
      else
        params.fetch(:bookcase, {}).symbolize_keys
      end
    end
end
