class Notifier < ActionMailer::Base
  default_url_options[:host] = "http://stark-meadow-2659.herokuapp.com/" # Production: "http://stark-meadow-2659.herokuapp.com/"
  default from: "noreply@solidmediagroup.com"

  def password_reset(user)
    @user = user
    mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
         subject: "Reset password")
  end
end
