class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :username, :null=> false
      t.string :email, :null => false
      t.index :username, unique: true
      t.index :email, unique: true

      #t.string :password
      #t.string :password_digest
      #t.integer :subscriptionID
      #t.integer :phone
      #t.string :first_name
      #t.string :last_name
      #t.date :register_date
      #t.boolean :show_name
      #t.boolean :show_email
      #t.boolean :show_phone

      t.timestamps
    end
  end

  def down
    drop_table :users
  end

end
