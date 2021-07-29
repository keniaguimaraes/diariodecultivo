class ProfilesController < ApplicationController
  before_action :set_profile

  def show
    add_breadcrumb "Pagina Principal", root_path, :title => "Voltar para a Página principal"
    add_breadcrumb "Perfil"
  end

  def edit
    add_breadcrumb "Pagina Principal", root_path, :title => "Voltar para a Página principal"
    add_breadcrumb "Perfil", profile_path, :title => "Voltar para a Perfil"
    add_breadcrumb "Editando Perfil"
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html  { redirect_to(@profile,
                    :notice => 'El perfil ha sido actualizado.') }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @profile.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

  private
  def set_profile
    @profile = (current_user.profile ||= Profile.create)
  end

  def profile_params 
    params.require(:profile).permit(:foto, :nombre, :apellido, :direccion, :ciudad, :estado, :zip)
  end
end