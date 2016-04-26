class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.datetime :DOB
      t.string :register_date
      t.boolean :show_name
      t.boolean :show_email
      t.boolean :show_phone
      t.timestamps
    end
  end
end
