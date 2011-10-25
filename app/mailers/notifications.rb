class Notifications < ActionMailer::Base

  default :from => "support@calmecac.me"

  def new_message(message)
    @message = message
    mail(:to => "aktestcontact@gmail.com", #Admin.all.map(&:email),
         :subject => "Calmecac: Alguien contacto por #{message.subject}")
  end

  def welcome_message(usuario)
    @usuario = usuario
    mail(:to => @usuario.email, #Contacts.all.map(&:email), #User.all.each do |user| # Send your email
         :subject => "Bienvenido a Calmecac")
  end

  def invitation_message(usuario, contacts)
    @usuario = usuario
    mail(:to => contacts.map {|name, mail| "#{mail}"},
         :subject => "Ping")
  end
end
