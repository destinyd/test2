describe Cost do
  it "must have money" do
    cost = Cost.create :money => nil
    cost.id.should eq(nil)
  end
end

