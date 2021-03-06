class Mailer < ActionMailer::Base

  # default email
  default from: "no-reply@consign.nyc"

  # USER EMAILS

  # USER confirmation email following REVIEW
  def new_review_email(user, business)
    @user = user
    @business = business
    mail(:to => @user.email, :subject => "Your review has been posted on CONSIGN.NYC")
  end

  # USER confirmation email following PHOTO
  def new_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => @user.email, :subject => "Your photo has been uploaded on CONSIGN.NYC")
  end

  # CONSIGN.NYC EMAILS

  # CONSIGN.NYC email following user REVIEW
  def admin_review_email(user, content, business, rating)
    @user = user
    @content = content
    @business = business
    @rating = rating
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Review on CONSIGN.NYC")
  end

  # CONSIGN.NYC email following user PHOTO
  def admin_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Photo on CONSIGN.NYC")
  end

  # STORE ADMIN ACCESS TEMPLATE EMAILS

  # STORE ADMIN confirmation email following REVIEW
  def store_review_email(user, content, business, rating)
    @user = user
    @content = content
    @business = business
    @rating = rating
    mail(:to => @business.admin_email, :subject => "#{@business.name} has received a new review on CONSIGN.NYC")
  end

  # STORE ADMIN confirmation email following PHOTO
  def store_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => @business.admin_email, :subject => "#{@business.name} has a new photo on CONSIGN.NYC")
  end

  # NEW MESSAGE EMAIL

  # CONSIGN.NYC email when MESSAGE received
  def message_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Message from CONSIGN.NYC")
  end

end
