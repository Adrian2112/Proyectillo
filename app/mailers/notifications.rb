class Notifications < ActionMailer::Base

  default :from => "support@calmecac.me"
  default :to => "elopez.deleon@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Calmecac: Alguien contacto por #{message.subject}")
  end

end
