describe Unit do
  it "must have name" do
    unit = Unit.create :name => nil
    unit.id.should be_nil
  end
end
