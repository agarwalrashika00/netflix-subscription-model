class SubscriptionExpiryMailSchedulerJob < ApplicationJob

  queue_as :default

  def perform(user_id, valid_till)
    SubscriptionExpiryMailer.with(user_id: user_id, valid_till: valid_till).subscription_expiry_mail.deliver_later
  end

end
