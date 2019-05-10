class AdminMailer < ApplicationMailer
	default to: "josh@burkeremodeling.com"

	def message_alert(form_contact)
		@form_contact = form_contact
		mail(subject: "New Contact Form Submission")
	end
end
