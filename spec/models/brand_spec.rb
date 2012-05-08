describe Brand do
  it "must have name" do
    brand = Brand.create :name => nil
    brand.id.should eq(nil)
  end

  describe "could have" do

    let(:brand){Brand.new :name => "test brand"}
    it "some products" do
      # it_behaves_like "one brand"
      brand.products << Product.create(:name => "test1")
      brand.products << Product.create(:name => "test2")
      brand.should have(2).products
    end

    it "norms" do
      brand.norms << Norm.create(:name => "test1")
      brand.norms << Norm.create(:name => "test2")
      brand.should have(2).norms
    end

    it "shops" do
      brand.shops << Shop.create(:name => "test1",:address => 'road1')
      brand.shops << Shop.create(:name => "test2",:address => 'road2')
      brand.should have(2).shops
    end

    # shared_examples_for "one brand" do
    #   brand = Brand.create :name => "test brand"
    # end

  end
end
