class TuanUrl < ActiveRecord::Base
  belongs_to :tuan_api
  def docfind
    self.tuan_api.docfind
  end
  def suite
    self.tuan_api.suite
  end
end
