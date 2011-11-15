class Notifications < ActionMailer::Base

  default :from => "no-reply@calmecac.me"

  def new_message(message)
    @message = message
    mail(:to => "contacto@calmecac.me", #Admin.all.map(&:email),
         :subject => "Calmecac: Alguien contacto por #{message.subject}")
  end

  def welcome_message(usuario)
    @usuario = usuario
    mail(:to => @usuario.email,
         :subject => "Bienvenido a Calmecac")
  end

  def invitation_message(invitation, mail)
    @invitation = invitation
    mail(:to => mail,
         :subject => "Ping")
  end
end
