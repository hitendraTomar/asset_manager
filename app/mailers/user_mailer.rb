class UserMailer < ApplicationMailer
	default from: 'moctusror@gmail.com'
   
   def buyer_booking_email(user)
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Thanks for booking.')
   end

   def owner_booking_email(user)
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Thanks for booking.')
   end
end
