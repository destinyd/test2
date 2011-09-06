class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :complaintable, :polymorphic => true
  validates :desc, :presence => true
  validates :type_id, :presence => true
end
