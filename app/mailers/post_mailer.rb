class PostMailer < ActionMailer::Base
  default from: "dynamicpubo@gmail.com"

  def post_information(post)
  	@post = post
  	@user = @post.user
  	attachments.inline['startrek.jpg'] = File.read("#{Rails.root.to_s}/public/images/startrek.jpg")
  	mail(to: @user.email, subject: "Test new posting ^^")
  	
  end
end
