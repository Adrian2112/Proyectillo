class InvitationController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    #@accounts = {"gmail" => Contacts::Gmail, "yahoo" => Contacts::Yahoo, "hotmail" => Contacts::Hotmail }
    #@contacts = @accounts[0].new(@invitation.email, @invitation.password).contacts    
    @contacts = Contacts.new(:gmail, @invitation.email.to_s, @invitation.password.to_s).contacts
    if @invitation.valid? and @contacts != nil
      Notifications.invitation_message(@invitation, @contacts).deliver
      redirect_to('/invitar', :notice => "Tu invitacion ha sido enviada! Gracias por tu apoyo.")
    else
      flash.now.alert = "Por favor revisa tu correo o password"
      render :new
    end
  end
end
