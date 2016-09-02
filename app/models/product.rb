class Product < ActiveRecord::Base
  belongs_to :category
  has_many :prices, dependent: :destroy

  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,6}(.\d{0,2})?\z/ } 
end
