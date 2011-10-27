require 'mail_job'
class InvitationController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    today = Time.now
    delay = 86400
    @invitation = Invitation.new(params[:invitation])
    begin
      @contacts = Contacts.new(params[:invitation][:account], @invitation.email.to_s, @invitation.password.to_s).contacts
    rescue
      flash.now.alert = "Por favor revisa tu correo o password"
      render :new
    else
      if @invitation.valid?
        @contacts.map {|name, mail| "#{mail}"}.each do |c|
          #if index == 100 #each_with_index
          Notifications.delay({:run_at => today + delay}).invitation_message(@invitation, c)
          #Delayed::Job.enqueue(MailJob.new(@invitation,c), 0, today)
        end
      redirect_to('/invitar', :notice => "Tu invitacion ha sido enviada! Gracias por tu apoyo.")
      else
        flash.now.alert = "Por favor revisa tu correo o password"
        render :new
      end
    end
  end
end
