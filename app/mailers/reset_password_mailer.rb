class ResetPasswordMailer < ApplicationMailer
	def self.send_reset_password_mail( password, recipient )
		send_reset_password(password, recipient).deliver_later
	end

	def send_reset_password(password, recipient)
		@password = password
		mail to: recipient, subject: 'Password reset requested'
	end
end