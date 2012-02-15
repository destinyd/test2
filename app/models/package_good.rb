class PackageGood < ActiveRecord::Base
  belongs_to :good
  belongs_to :package, :class_name => "Good", :foreign_key => "package_id"
end
