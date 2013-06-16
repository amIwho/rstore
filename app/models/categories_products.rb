class CategoriesProducts < ActiveRecord::Base
  attr_accessible :category_id, :product_id
  has_many :categories
  has_many :products
end
