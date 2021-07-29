class AcompanhamentosController < ApplicationController
  before_action :set_acompanhamento, only: [:edit, :update, :destroy]
  before_action :set_genero, only: [:new, :edit, :create]
  before_action :set_tipo, only: [:new, :edit, :create]
  before_action :set_cid, only: [:new, :edit, :create]

  def index
    add_breadcrumb "Pagina Principal", root_path, :title => "Voltar para a Página principal"
    add_breadcrumb "Meus acompanhamentos"
    @acompanhamentos = Acompanhamento.where("user_id =:user_id",{user_id:current_user.id}).all
  end

  def new
    @acompanhamento = Acompanhamento.new
  end

  def edit
  end

  def show
   
    add_breadcrumb "Meus acompanhamentos", acompanhamentos_path, :title => "Voltar para a Página principal"
    add_breadcrumb "Exibindo acompanhamento"
    @acompanhamento = Acompanhamento.find(params[:id])
    @diarios = Diario.where("acompanhamento_id =:acompanhamento_id",{acompanhamento_id:params[:id]}).all.paginate(:page => params[:page], :per_page => 6)
  end

  def create
    @acompanhamento = Acompanhamento.new(acompanhamento_params)
    @acompanhamento.user_id = current_user.id

    respond_to do |format|
      if @acompanhamento.save
        format.html { redirect_to "/acompanhamentos/"+ @acompanhamento.id.to_s , notice: 'O acompanhamento foi incluído com sucesso!'}
        format.json { head :no_content }
      else
        format.json { render json: @acompanhamento.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @acompanhamento.update(acompanhamento_params)
        format.html { redirect_to acompanhamentos_url }
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

  def finalizar

    @acompanhamento  = Acompanhamento.find(params[:id])
    respond_to do |format|
      data_de_hoje =  Date.today
      if @acompanhamento.update(fim_tratamento:data_de_hoje)
        format.html { redirect_to acompanhamentos_url, notice: 'O acompanhamento foi finalizado com sucesso!'}
        format.json { head :no_content }
      else
        format.json { render json: @acompanhamento.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end


  private 
    def set_acompanhamento
      @acompanhamento = Acompanhamento.find(params[:id])
    end

    def acompanhamento_params
      params.require(:acompanhamento).permit(:medicamento, :tipo_id, :inicio_tratamento, :fim_tratamento, :paciente, :idade, :genero_id, :medico, :crm, :finalidade, :user_id,:cid_id)
    end
    def set_genero
      @generos = Genero.all
    end
  
    def set_tipo
      @tipos = Tipo.all
    end

    def set_cid
      @cids = Cid.all
    end

end

