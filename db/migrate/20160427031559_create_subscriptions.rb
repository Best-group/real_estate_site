class CreateSubscriptions < ActiveRecord::Migration
  def up
    create_table :subscriptions do |t|
      #t.integer "userID" :default => "",   :limit => 25, :null => false,
      t.integer "userID",  :null => false
      t.integer "type", :null => false
      t.datetime "date_started", :null => false

      t.timestamps null: false
    end
  end

  def down
    drop_table :subscriptions
  end
end
