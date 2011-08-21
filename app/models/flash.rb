class Flash < ActiveRecord::Base
  belongs_to :category
  validates_attachment_size :image, :less_than => 1.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  acts_as_commentable
 
  has_attached_file :image, 
                     :styles => { :flash_pic => '600x300>' }, 
                     :path => ":rails_root/public/images/items/:style_:id_:updated_at.:extension", 
                     :url => "/images/items/:style_:id_:updated_at.:extension" 

  default_scope order('id desc')
  scope :recent,limit(5)
  scope :by, lambda{|id|
    if id.blank?
     scoped
    else
     flashes = where(:category_id => id)
     flashes.blank? ? scoped : flashes
    end
  }


end
