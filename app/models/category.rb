class Category < ActiveRecord::Base
  has_many :goods
  belongs_to :parent,
             :class_name  => "Category",
             :foreign_key => :parent_id

  has_many   :children,
             :class_name  => "Category",
             :foreign_key => :parent_id,
             :order       => :created_at
  has_many :focus, :as => :focusable
  has_many  :articles
  has_many  :flashes

  scope :roots,where(:parent_id => nil)
  scope :valid,where(:is_valid => true)
  scope :same_parent, lambda { |parent_id|
      where(:parent_id => parent_id)
  }

  default_scope order('created_at').valid.includes(:children)

  def initialize(attribs={})
    super(attribs)
    self.is_valid = true
    self
  end

  
  def valid!
  	self.is_valid = true
	self.save!
  end
  
  def to_s
    self.name
  end

  has_many :integrals, :as => :integralable
  def valid
    return if self.is_valid
    self.update_attribute(:is_valid, true)
    self.user.get_point(10,self)
  end
end
