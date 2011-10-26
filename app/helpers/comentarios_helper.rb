module ComentariosHelper
  
  def despliega_fecha(fecha)
    if (Time.now - fecha) < 2.days
      distance_of_time_in_words(Time.now, fecha)
    else
      l fecha, :format => :mes_dia_ano
    end
  end
  
end
