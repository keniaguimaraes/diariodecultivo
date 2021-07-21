class TiposController < ApplicationController
  before_action :set_tipo, only: [:edit, :update, :destroy]

  def index
    @tipos = Tipo.where("user_id =:user_id",{user_id:current_user.id}).all
  end

  def new
    @tipo = Tipo.new
  end

  def edit
  end

  def create
    @tipo = Tipo.new(tipo_params)
    @tipo.user_id = current_user.id
    respond_to do |format|
      if @tipo.save
        format.html { redirect_to tipos_url }
        format.json { head :no_content }
      else
        format.json { render json: @tipo.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tipo.update(category_params)
        format.html { redirect_to tipos_url }
        format.json { head :no_content }
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

    def tipo_params
      params.require(:tipo).permit(:descricao,:user_id)
    end

end
