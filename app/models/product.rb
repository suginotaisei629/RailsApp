class Product < ApplicationRecord
    has_rich_text :description
    validates :name, presence: true
    validates :description, presence: true, length: { maximum: 1000 }
end
  