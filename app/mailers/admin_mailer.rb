class AdminMailer < ApplicationMailer
	# default to: "josh@burkeremodeling.com"
	default to: "micahnicodemus22@gmail.com"

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
	end

	def message_alert(form_contact)
		@form_contact = form_contact
		mail(subject: "New Contact Form Submission")
	end
end
