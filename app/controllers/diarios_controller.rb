class DiariosController < ApplicationController
  before_action :set_diario, only: [:edit, :update, :destroy]
  before_action :set_administracao, only: [:new, :edit, :create]
  
  def index
    
    @diarios = Diario.where("acompanhamento_id =:acompanhamento_id",{acompanhamento_id:params[:acompanhamento_id]}).all
  end

  def new
    @diario = Diario.new
  end
 
  def edit
  end

  def show
    @diario = Diario.find(params[:id])
    @acompanhamento = Acompanhamento.where("acompanhamento_id =:acompanhamento_id",{acompanhamento_id: @diario.acompanhamento_id}).all
    add_breadcrumb "Meus Acompanhamentos", "/acompanhamentos/"+@diario.acompanhamento_id.to_s, :title => "Voltar para a Página principal"
    add_breadcrumb "Exibindo Diario"
  end

  def create
        @diario = Diario.new(diario_params)
        @tagselect =  params[:tags]
      
        respond_to do |format|
          if @diario.save
            if  not @tagselect.nil?  then
              @tagselect.each do |tagselect|
                @efeitodiario = Efeitodiario.new
                @efeitodiario.efeitocolateral_id = tagselect
                @efeitodiario.diario_id = @diario.id
                @efeitodiario.save
              end  
            end
        
            format.html { redirect_to "/acompanhamentos/"+@diario.acompanhamento_id.to_s, notice:'Diário Incluido!'}
            format.json { head :no_content }
          else
            format.json { render json: @diario.errors.full_messages, status: :unprocessable_entity }
            format.js { render :new }
          end
        end
  end

  def update
    respond_to do |format|
      if @diario.update(diario_params)
        format.html { redirect_to acompanhamento_url }
        format.json { head :no_content }
      else
        format.json { render json: @diario.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    acompanhamento_id = @diario.acompanhamento_id
    @diario.destroy
    respond_to do |format|
      format.html { redirect_to "/acompanhamentos/"+acompanhamento_id.to_s, notice:'Diario excluído!'}
      format.js
    end
  end

  def relatorio

  end  

  private 
    def diario_params
      params.require(:diario).permit(:acompanhamento_id, :dosagem, :administracao_id, :efeitodiario_id, :anotacoes)
    end
    def set_diario
      @diario = Diario.find(params[:id])
    end
    def set_administracao
      @administracaos = Administracao.all
    end

  
 

end

