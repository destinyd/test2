class Outlink < ActiveRecord::Base
  belongs_to :outlinkable, :polymorphic => true
end
