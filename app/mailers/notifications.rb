class Notifications < ActionMailer::Base

  default :from => "support@calmecac.me"

  def new_message(message)
    @message = message
    mail(:to => "aktestcontact@gmail.com", #Admin.all.map(&:email),
         :subject => "Calmecac: Alguien contacto por #{message.subject}")
  end

  def welcome_message(usuario)
    @usuario = usuario
    mail(:to => @usuario.email, #Admin.all.map(&:email),
         :subject => "Bienvenido a Calmecac")
  end

end
