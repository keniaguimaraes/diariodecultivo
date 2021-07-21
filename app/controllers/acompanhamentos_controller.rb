class AcompanhamentosController < ApplicationController
  before_action :set_acompanhamento, only: [:edit, :update, :destroy]
  before_action :set_genero, only: [:new, :edit, :create]
  before_action :set_tipo, only: [:new, :edit, :create]


  def index
    @acompanhamentos = Acompanhamento.where("user_id =:user_id",{user_id:current_user.id}).all
  end

  def new
    @acompanhamento = Acompanhamento.new
  end

  def edit
  end

  def create
    @acompanhamento = Acompanhamento.new(acompanhamento_params)
    @acompanhamento.user_id = current_user.id
    respond_to do |format|
      if @acompanhamento.save
        format.html { redirect_to tipos_url }
        format.json { head :no_content }
      else
        format.json { render json: @acompanhamento.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @acompanhamento.update(category_params)
        format.html { redirect_to tipos_url }
        format.json { head :no_content }
      else
        format.json { render json: @acompanhamento.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @acompanhamento.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private 
    def set_acompanhamento
      @acompanhamento = Acompanhamento.find(params[:id])
    end

    def acompanhamento_params
      params.require(:tipo).permit(:medicamento, :tipo_id, :inicio_tratamento, :fim_tratamento, :paciente, :idade, :genero_id, :medico, :crm, :finalidade, :user_id)
    end
    def set_genero
      @generos = Genero.all
    end
  
    def set_tipo
      @tipos = Tipo.all
    end

end

