class Business < ActiveRecord::Base

  belongs_to :user
  belongs_to :neighborhood 
  belongs_to :borough
  has_many :photos, :dependent => :destroy # destroys associated photos when business destroyed
  has_many :reviews, :dependent => :destroy # destroys associated reviews when business destroyed
  has_many :business_biztags
  has_many :biztags, through: :business_biztags
  accepts_nested_attributes_for :biztags 
  has_many :business_designers
  has_many :designers, through: :business_designers
  accepts_nested_attributes_for :designers

  has_attached_file :profile_photo, 
    :storage => :s3, 
    # :hash_secret => "longSecretString", 
    # :path => ":hash", 
    :bucket => "consignnyc",
    :s3_credentials => "#{Rails.root}/config/aws.yml",
    # :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
    # :s3_credentials => S3_CREDENTIALS,
    # :styles => { :thumb => "1024x768"}, 
    # :default_style => :thumb, 
    :s3_protocol => "https"

  # validates :profile_photo, :attachment_presence => true
  validates_with AttachmentSizeValidator, :attributes => :profile_photo, :less_than => 3.megabytes
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
 
end
