describe Norm do
  it "must have name" do
    norm = Norm.create :name => nil
    norm.id.should eq(nil)
  end
end

