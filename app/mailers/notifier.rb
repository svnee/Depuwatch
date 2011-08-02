class Notifier < ActionMailer::Base
  default :from => "report@depuwatch.lu"
  
  def report_notification(sender)
    @sender = sender
    mail(:to => "info@depuwatch.lu",
         :from => sender.email,
         :subject => "[Depuwatch Report] A new bug has been found")
 end
end
