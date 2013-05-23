class UserMailer < ActionMailer::Base

  def welcome(user,event)
    @subject = "Welcome to Intelegencia's Party"
    @recipients = user.email
    @from = 'Admin Intelegencia <fp.intelegencia@gmail.com>'
    @sent_on = Time.now
    @body = {:user => user,:event => event}
  end
  
  def notify_all(subject,emails,content)
    @subject = subject
    @recipients = emails
    @from = 'Admin Intelegencia <fp.intelegencia@gmail.com>'
    @sent_on = Time.now
    @body = {:content => content}
  end

  def feedback(sender,subject,content)
    @subject = "Feedback - " + subject
    @recipients = "ashish@intelegencia.com"
    @from = 'Admin Intelegencia <fp.intelegencia@gmail.com>'
    @sent_on = Time.now
    @body = {:sender => sender,:content => content}
  end

end
