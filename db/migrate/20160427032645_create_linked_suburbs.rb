class CreateLinkedSuburbs < ActiveRecord::Migration
  def change
    create_table :linked_suburbs do |t|
      t.integer "suburbID", :null => false
      t.integer "to_suburbID", :null => false

      t.timestamps null: false
    end
  end
end
