Scenario 3 - Basic Netflix system

User can purchase netflix subscription

Upto 4 users can share a netflix subscription

Each subscription is valid for some time

All the important data should be accessible through associations.

User should not be able to have more than one active(not expired) subscription associated with it

Send a reminder email to all the users of the subscription a month, a week and a day before the subscription expires with the appropriate email message.

one subscription valid till 2 months

### user with max subscriptions
User.joins(:user_subscriptions).select('users.*, count(*) as sub_count').group(:user_id).order(sub_count: :desc).first

### all subscription of a user
User.first.subscriptions