class UserMailer < ApplicationMailer
  default from: "olayemifolakemi@gmail.com"
  
  def confirm_email(email)
    @email = email
    @url  = 'http://localhost:4000'
    mail(to: @email, subject: 'Booking Confirmed')
  end 
end
