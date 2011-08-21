class Upload < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true
  validates_attachment_size :image, :less_than => 1.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  acts_as_commentable
 
  has_attached_file :image, 
                     :styles => { :original => '250x250>',  :small => '120x120>' }, 
                     :path => ":rails_root/public/images/items/:style_:id_:updated_at.:extension", 
                     :url => "/images/items/:style_:id_:updated_at.:extension" 

  default_scope where(:deleted_at =>  nil).order('id desc')
  scope :recent,limit(9)

  def destroy
    self.deleted_at = Time.now
    self.save
  end
     
end
