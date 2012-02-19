class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
    # Mantiene los datos de omniauth activos en caso de que el usuario cometa errores
    session[:omniauth] = nil unless @usuario.new_record?
  end

  def create
    # variables para mostrar la universidad y el campus seleccionados en la forma de registro
    universidad = Universidad.find(params[:usuario][:universidad_id]) if params[:usuario][:universidad_id].present?
    campus = universidad.campus.find(params[:usuario][:campus_id]) if universidad and params[:usuario][:campus_id].present?
    @universidad_data = universidad.nil? ? "" : [{:id => universidad.id, :nombre => universidad.nombre}].to_json
    @campus_data = campus.nil? ? "" : [{:id => campus.id, :nombre => campus.nombre }].to_json
    @campus_url = universidad ? "/universidades/#{universidad.id}/campus" : ""

    super
    
    # Manda mail con cualquier usuario que se genera en nuestra BD
    Notifications.welcome_message(@usuario).deliver unless @usuario.new_record?
  end
  
  def edit
    @universidad = @usuario.universidad
    @universidad_data = @universidad.nil? ? "" : [{:id => @universidad.id, :nombre => @universidad.nombre}].to_json
    @campus_url = @universidad ? "/universidades/#{@universidad.id}/campus" : ""
    
    @campus = @usuario.campus
    @campus_data = @campus.nil? ? "" : [{:id => @campus.id, :nombre => @campus.nombre }].to_json
  end

  def update
    @universidad = Universidad.find(params[:usuario][:universidad_id]) unless params[:usuario][:universidad_id].blank?
    @universidad_data = @universidad.nil? ? "" : [{:id => @universidad.id, :nombre => @universidad.nombre}].to_json
    @campus_url = @universidad ? "/universidades/#{@universidad.id}/campus" : ""
    
    @campus = Campus.find(params[:usuario][:campus_id]) unless params[:usuario][:campus_id].blank?
    @campus_data = @campus.nil? ? "" : [{:id => @campus.id, :nombre => @campus.nombre }].to_json    
    super
    
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @usuario.apply_omniauth(session[:omniauth])
    end
  end
  
end
