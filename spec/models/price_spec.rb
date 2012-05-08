describe Price do
  it "must have type_id" do
    price = Price.create :price => 1
    price.id.should eq(nil)
  end
  it "must have price" do
    price = Price.create :type_id => 0
    price.id.should eq(nil)
  end


  let(:price) {Price.create :type_id => 0,:price => 1}

  describe "#costs <<" do
    it "cost" do
      price.costs << Cost.create(:money => 5)
    end
  end
end
