class UserSubscription < ApplicationRecord

  belongs_to :user
  belongs_to :subscription

  validate :subscription_is_active, on: :create
  validate :atleast_one_month_subscription, on: :create
  validate :max_four_users_per_subscription
  validate :one_active_subscription_per_user
  validates :user_id, uniqueness: { scope: :subscription_id }

  after_create_commit :send_expiry_email

  def self.subscription_ids
    pluck(:subscription_id)
  end

  private

  def subscription_is_active
    unless subscription.active?
      errors.add :base, 'inactive subscription'
    end
  end

  def atleast_one_month_subscription
    unless subscription.valid_till.to_date >= 1.month.after.to_date
      errors.add :base, 'subscription must be for atleast one month'
    end
  end

  def max_four_users_per_subscription
    if UserSubscription.where(subscription_id: subscription_id).length >= 4
      errors.add :base, 'max 4 users can share a subscription'
    end 
  end

  def one_active_subscription_per_user
    if Subscription.exists?(id: UserSubscription.where(user_id: user_id).subscription_ids, active: true) && subscription.active?
      errors.add :base, 'only one active subscription is allowed per user'
    end
  end

  def send_expiry_email
    valid_till = subscription.valid_till
    SubscriptionExpiryMailSchedulerJob.set(wait_until: valid_till - 1.month).perform_later(user_id, valid_till)
    SubscriptionExpiryMailSchedulerJob.set(wait_until: valid_till - 1.week).perform_later(user_id, valid_till)
    SubscriptionExpiryMailSchedulerJob.set(wait_until: valid_till - 1.day).perform_later(user_id, valid_till)
  end

end
