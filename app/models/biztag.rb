class Biztag < ActiveRecord::Base

  has_many :business_biztags
  has_many :businesses, through: :business_biztags

  validates :name, presence: true
  
end
