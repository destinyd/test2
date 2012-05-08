describe Product do
  it "must have name" do
    product = Product.create :name => nil
    product.id.should eq(nil)
  end
end
