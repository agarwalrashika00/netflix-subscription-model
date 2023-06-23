class Subscription < ApplicationRecord

  has_many :user_subscriptions, dependent: :destroy
  has_many :users, through: :user_subscriptions

  validates :valid_till, presence: true
  validates :date_valid_till, comparison: { greater_than_or_equal_to: :date_after_one_month }, if: :valid_till?

  before_validation :set_valid_till, on: :create

  private

  def set_valid_till
    self.valid_till = 2.months.after
  end

  def date_valid_till
    valid_till.to_date
  end

  def date_after_one_month
    1.month.after.to_date
  end

end
