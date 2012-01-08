class Flash < ActiveRecord::Base
  validates_attachment_size :image, :less_than => 1.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  acts_as_commentable
  acts_as_taggable
 
  has_attached_file :image, 
                     :styles => { :flash_pic => '600x300>' }, 
                     :path => ":rails_root/public/images/flashes/:style_:id_:updated_at.:extension", 
                     :url => "/images/flashes/:style_:id_:updated_at.:extension" 

  default_scope order('id desc')
  scope :recent,limit(5)
  has_one :outlink, :as => :outlinkable
  accepts_nested_attributes_for :outlink

end
