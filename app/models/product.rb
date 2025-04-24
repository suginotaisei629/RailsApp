class Product < ApplicationRecord
<<<<<<< HEAD
    has_rich_text :description
    validates :name, presence: true
    validates :description, presence: true, length: { maximum: 1000 }
=======
>>>>>>> origin/main
end
  