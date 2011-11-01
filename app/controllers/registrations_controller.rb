class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
    # Mantiene los datos de omniauth activos en caso de que el usuario cometa errores
    session[:omniauth] = nil unless @usuario.new_record?
  end

  def create
    super
    
    # Manda mail con cualquier usuario que se genera en nuestra BD
    # Notifications.welcome_message(@usuario).deliver
  end
  
  def edit
    @universidad = @usuario.universidad
    @universidad_data = @universidad.nil? ? "" : [{:id => @universidad.id, :nombre => @universidad.nombre}].to_json
    @campus_url = @universidad ? "/universidades/#{@universidad.id}/campus" : ""
    
    @campus = @usuario.campus
    @campus_data = @campus.nil? ? "" : [{:id => @campus.id, :nombre => @campus.nombre }].to_json
  end

  def update
    super
    
    @universidad = @usuario.universidad
    @universidad_data = @universidad.nil? ? "" : [{:id => @universidad.id, :nombre => @universidad.nombre}].to_json
    @campus_url = @universidad ? "/universidades/#{@universidad.id}/campus" : ""
    
    @campus = @usuario.campus
    @campus_data = @campus.nil? ? "" : [{:id => @campus.id, :nombre => @campus.nombre }].to_json 
    debugger 
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @usuario.apply_omniauth(session[:omniauth])
    end
  end
  
end
