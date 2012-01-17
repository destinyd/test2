class TuanUrl < ActiveRecord::Base
  belongs_to :tuan_api
  validates :name,:presence => true,:uniqueness => true,:on => :create
  validates :url,:uniqueness => true,:on => :create
  def docfind
    self.tuan_api.docfind
  end
  def suite
    self.tuan_api.suite
  end
end
