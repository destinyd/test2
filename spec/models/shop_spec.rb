describe Shop do
  it "must have name" do
    shop = Shop.create :name => nil,:address => 'road1'
    shop.id.should eq(nil)
  end
  it "must have name" do
    shop = Shop.create :name => 'name1',:address => nil
    shop.id.should eq(nil)
  end

  let(:shop){Shop.create! :name => 'shop1',:address => 'road1'}
  describe "#costs<<" do
    it "costs" do
      shop.costs << Cost.create
      shop.costs << Cost.create
      shop.should have(2).costs
    end
  end

end


