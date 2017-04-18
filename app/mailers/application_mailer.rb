class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def new_confirmation(user)

    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user

    mail(to: user.email, subject: "Welcome to Blocipedia!")
  end
end
