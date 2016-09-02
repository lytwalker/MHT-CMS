class Category < ActiveRecord::Base
  belongs_to :type
  has_many :products, dependent: :destroy
  
  validates :name, :description, presence: true
end
