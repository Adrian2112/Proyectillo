class RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:omniauth] = nil unless @usuario.new_record?
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @usuario.apply_omniauth(session[:omniauth])
      @usuario.valid?
    end
  end
  
  def edit
    @universidad = @usuario.universidad
    @universidad_data = @universidad.nil? ? "" : [{:id => @universidad.id, :nombre => @universidad.nombre}].to_json
    @campus_url = @universidad ? "/universidades/#{@universidad.id}/campus" : ""
    
    @campus = @usuario.campus
    @campus_data = @campus.nil? ? "" : [{:id => @campus.id, :nombre => @campus.nombre }].to_json
  end
  
end
