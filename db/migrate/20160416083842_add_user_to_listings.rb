class AddUserToListings < ActiveRecord::Migration[5.0]
  def up
    add_reference :listings, :user, foreign_key: true
  end

  def down
    remove_foreign_key :listings, :user, foreign_key: false
  end
end
