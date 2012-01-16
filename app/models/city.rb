class City < ActiveRecord::Base
  belongs_to  :province
  has_many    :areas
  def to_param
    self.name
  end
  def to_s
    self.name
  end
end
