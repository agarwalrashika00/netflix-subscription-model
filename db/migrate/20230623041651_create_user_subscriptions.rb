class CreateUserSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_subscriptions do |t|
      t.references :user
      t.references :subscription

      t.timestamps
    end
  end
end
