class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show update destroy ]

  def initialize(author_repository = Author)
    @repository = author_repository
    @create_use_case = CreateUseCase.new(@repository)
    @find_all_use_case = FindAllUseCase.new(@repository)
    @find_one_use_case = FindOneUseCase.new(@repository)
    @update_use_case = UpdateUseCase.new(@repository)
    @delete_use_case = DeleteUseCase.new(author_repository: @repository)
  end

  # GET /authors
  def index
    authors = @find_all_use_case.execute

    render json: authors
  end

  # GET /authors/1
  def show
    author = @find_one_use_case.execute(params[:id])

    render json: author
  end

  # POST /authors
  def create
    dto = Dto::Authors::CreateAuthorDto.new(author_params)
    author = @create_use_case.execute(dto.to_h)

    render json: author, status: :created, location: author
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /authors/1
  def update
    author_data = author_params.merge(id: params[:id])
    @update_use_case.execute(author_data)

    head :no_content
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # DELETE /authors/1
  def destroy
    @delete_use_case.execute(author_id: params[:id])

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = @find_one_use_case.execute(params[:id])
    rescue
      head :not_found
    end

    # Only allow a list of trusted parameters through.
    def author_params
      # Keep compatible with existing calls; return a Hash with symbolized keys
      if params.respond_to?(:require)
        p = params.require(:author).permit(:name, :birth)
        { name: p[:name], birth: p[:birth] }
      else
        params.fetch(:author, {}).symbolize_keys
      end
    end
end
