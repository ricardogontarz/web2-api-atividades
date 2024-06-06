class ArtefatosController < ApplicationController
  before_action :set_artefato, only: [:show, :update, :destroy]

  # GET /artefatos
  def index
    @artefatos = Artefato.all

    render json: @artefatos
  end

  # GET /artefatos/1
  def show
    render json: @artefato
  end

  # POST /artefatos
  def create
    @artefato = Artefato.new(artefato_params)

    if @artefato.save
      render json: @artefato, status: :created, location: @artefato
    else
      render json: @artefato.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artefatos/1
  def update
    if @artefato.update(artefato_params)
      render json: @artefato
    else
      render json: @artefato.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artefatos/1
  def destroy
    @artefato.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artefato
      @artefato = Artefato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artefato_params
      params.require(:artefato).permit(:name)
    end
end
