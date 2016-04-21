class Listing < ApplicationRecord
  belongs_to :user

  searchable do
    text :title, :default_boost => 2
    text :description
    text :unit
    text :street
  end

end
