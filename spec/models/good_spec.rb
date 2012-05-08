describe Good do
  it "must have name" do
    good = Good.create :name => nil
    good.id.should eq(nil)
  end

  let(:brand){ Brand.create :name => 'shenmajia'}
  let(:product){Product.create :name => 'senior member'}
  let(:norm){ Norm.create :name => '7 day'}

  it "create by brand" do
    good = Good.new
    good.brand = brand
    good.brands << brand
    good.product = product
    good.norm = norm
    good.name = "#{brand.name} #{product.name} #{norm.name}"
    good.name.should == 'shenmajia senior member 7 day'
    good.save
    good.errors.empty?.should == true
    # brand.reload
    # product.reload
    # norm.reload
    brand.goods.should include(good)
    product.goods.should include(good)
    norm.goods.should include(good)
  end
end
