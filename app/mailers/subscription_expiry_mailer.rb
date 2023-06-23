class SubscriptionExpiryMailer < ApplicationMailer

  def subscription_expiry_mail
    @user = User.find_by_id(params[:user_id])
    @valid_till = params[:valid_till]
    mail(to: @user, subject: 'netflix subscription expiry mail') 
  end

end
