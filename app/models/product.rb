class Product < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
    
  belongs_to :category
  has_many :prices, dependent: :destroy

  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,6}(.\d{0,2})?\z/ } 
end
