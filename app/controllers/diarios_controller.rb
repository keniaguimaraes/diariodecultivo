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
  end

  def create
    @diario = Diario.new(diario_params)
    @kenia= 7#params[:acompanha]
    @diario.acompanhamento_id =7

    @tagselect =  params[:tags]
       
        @ult_diario = Diario.last
        if @ult_diario .nil? 
          proximo = 1
        else proximo = @ult_diario .id + 1
        end 
        
        if  not @tagselect.nil?  then
          @tagselect.each do |tagselect|
            @efeitodiario = Efeitodiario.new
            @efeitodiario.efeitocolateral_id = tagselect
            @efeitodiario.diario_id = proximo
            @efeitodiario.save
          end  
        end
    


    respond_to do |format|
      if @diario.save
        format.html { redirect_to acompanhamento_url(@kenia), notice: 'A Avaliação foi Realizada com Sucesso!' }
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
    @diario.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
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

