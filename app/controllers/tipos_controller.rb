class TiposController < ApplicationController
  before_action :set_tipo, only: [:edit, :update, :destroy]

  def index
    @tipos = Tipo.all
  end

  def new
    @tipo = Tipo.new
  end

  def edit
  end

  def create
    @tipo = Tipo.new(tipo_params)

    respond_to do |format|
      if @tipo.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @tipo.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tipo.update(category_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @tipo.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @tipo.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private 
    def set_tipo
      @tipo = Tipo.find(params[:id])
    end

    def category_params
      params.require(:tipo).permit(:descricao)
    end

end
