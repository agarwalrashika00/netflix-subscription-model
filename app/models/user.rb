class User < ApplicationRecord

  has_many :user_subscriptions, dependent: :destroy
  has_many :subscriptions, through: :user_subscriptions
  
end
