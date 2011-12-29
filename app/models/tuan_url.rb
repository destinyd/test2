class TuanUrl < ActiveRecord::Base
  belongs_to :tuan_api
  validates :name,:presence => true,:uniqueness => true
  validates :url,:uniqueness => true
  def docfind
    self.tuan_api.docfind
  end
  def suite
    self.tuan_api.suite
  end
end
