class Attr < ActiveRecord::Base
  belongs_to :attrable, :polymorphic => true
  validates :name,:presence => true
  validates :value,:presence => true
  validates :attrable_id,:presence => true
  validates :attrable_type,:presence => true
  scope :supported,where(:supported => true)

  has_many :reviews, :as => :reviewable

  before_create  :supported_first
  private
  def supported_first
    first = Attr.where(:name => self.name).limit(1)
    self.supported = true if first.blank?
  end
end
