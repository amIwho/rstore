class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :category_id, :photo
  
  has_attached_file :photo, styles: { small: "150x150>", big: "300x300>"},
  :url  => "/assets/products/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  

  validates :title, uniqueness: true
  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  
  belongs_to :categories
  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  #...
  private
  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
      if line_items.empty?
          return true
      else
          errors.add(:base, 'существуют товарные позиции')
          return false
      end
  end
  
end
