class Product < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
    has_rich_text :description
    validates :name, presence: true
    validates :description, presence: true, length: { maximum: 1000 }
=======
>>>>>>> origin/main
=======
    has_rich_text :description
    validates :name, presence: true
    validates :description, presence: true, length: { maximum: 1000 }
>>>>>>> 1e720d77eea184c8f439b036cd8c9b269826254a
end
  