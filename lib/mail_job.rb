 class MailJob < Struct.new(:invitation, :c) 
   def perform
     Notifications.invitation_message(invitation, c).deliver
   end
 end
