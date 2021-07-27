class InfoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.info_mailer.form_contact.subject
  #
  def form_contact(contact)
    @correo = Contact.find(contact.id)
    # raise @correo.to_json
    @greeting = "#{contact.email}:  #{ contact.title }"
    # =>  destinatario del correo  , quien envia el correo
    mail( to: WebConfig.first.global_email,from: contact.email, subject: @greeting)
  end
end
