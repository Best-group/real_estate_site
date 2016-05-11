class Listing < ApplicationRecord
  resourcify

  belongs_to :user

  searchable do
    text :title, :default_boost => 2
    text :description
    text :unit
    text :street
  end

  hash_as_id

end
