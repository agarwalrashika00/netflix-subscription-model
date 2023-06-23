class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :type
      t.boolean :active
      t.timestamp :valid_till

      t.timestamps
    end
  end
end
