class Emailer < ActionMailer::Base
  def contact(recipient, subject, message, sent_at = Time.now)
    @subject = subject
    @recipients = recipient
    @from = 'kpatidar@systematixtechnocrates.com'
    @sent_on = sent_at
    @body = message
    @headers = {}
  end

  def new_album_email(recipient,album)
    @subject = "ED Album :: New Album"
    @recipients = recipient.email_id
    @reciever = recipient
    @from = 'noreply@systematixtechnocrates.com'
    @content_type = "text/html"
    @album = album
  end

end
