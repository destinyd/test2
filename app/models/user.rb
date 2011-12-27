class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:username
  
  has_many :prices
  has_many :comments
  has_many :goods
  has_many :integrals
  has_many :msgs
  has_many :got_msgs, :class_name => "Msg",:as => :getable
  has_many :articles
  has_many :uploads
  has_many :focuss
  has_many :outlinks
  has_many :records

  has_many :user_tasks
  has_many :tasks,:through => :user_tasks

  validates :username, :presence => true,:uniqueness => true

  scope :recent ,limit(10).order('id desc')#.select('email,created_at')
  def to_s
    self.username || self.email
  end
  def get_point(point,integralable,desc = nil)
    integral = self.integrals.new :point => point,
      :desc => desc
    integral.integralable = integralable
    integral.save!
  end

  def points
    self.integrals.sum(:point)
  end
end
