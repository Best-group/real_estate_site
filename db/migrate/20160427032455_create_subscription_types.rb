class CreateSubscriptionTypes < ActiveRecord::Migration
  def change
    create_table :subscription_types do |t|
      t.string "name", :default => "",   :limit => 25, :null => false
      t.integer "months_duration", :null => false
      t.float "value", :null => false
      t.integer "max_listings", :null => false
      t.integer "max_images", :null => false

      #Options go here. Like privacy settings and stuff....
      t.boolean "private_options", :default => false, :null => false

      t.timestamps null: false
    end
  end
end
