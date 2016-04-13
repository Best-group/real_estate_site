class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.integer :subscriptionID
      t.integer :phone
      t.string :first_name
      t.string :last_name
      t.date :registerDate
      t.boolean :show_name
      t.boolean :show_email
      t.boolean :show_phone

      t.timestamps
    end
  end
end