class RegistrationsController < Devise::RegistrationsController
  
  def edit
    @universidad = @usuario.universidad
    @universidad_data = @universidad.nil? ? "" : [{:id => @universidad.id, :nombre => @universidad.nombre}].to_json
    @campus_url = @universidad ? "/universidades/#{@universidad.id}/campus" : ""
    
    @campus = @usuario.campus
    @campus_data = @campus.nil? ? "" : [{:id => @campus.id, :nombre => @campus.nombre }].to_json
  end
  
end