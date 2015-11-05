class Mailer < ActionMailer::Base
  default :from => Juvia::Application.config.from
  uri = URI.parse(Juvia::Application.config.base_url)
  default_url_options[:protocol] = uri.scheme
  default_url_options[:host] = uri.host

  def comment_posted(comment)
    @site    = comment.site
    @comment = comment
    mail(to: comment.site.user.email, subject: I18n.t('mail.title.new_comment_posted'))
  end

  def reply_posted(comment)
    @site    = comment.site
    @comment = comment
    posters = comment.topic.comments.map(&:author_email).uniq
    posters.delete(comment.author_email)
    posters.delete(comment.site.user.email)
    emails = posters.join(",")
    mail(to: comment.author_email, bcc: emails, subject: "[#{@site.name}] #{I18n.t('mail.title.new_comment_posted')}")
  end
end
