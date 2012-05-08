describe Company do
  it "must have name" do
    company = Company.create(:name => nil,:email => 'test@1.com',:address => 'road')
    company.id.should be_nil
  end
  it "must have email" do
    company = Company.create(:name => 'shenmajia',:email => nil,:address => 'road')
    company.id.should be_nil
  end
  it "must have address" do
    company = Company.create(:name => 'shenamjia',:email => 'test@1.com',:address => nil)
    company.id.should be_nil
  end

  describe "could have some" do
    it "brands" do
      company = Company.create(:name => 'shenamjia1',:email => 'test@1.com',:address => "road")
      company.brands << Brand.create(:name => "test brand1")
      company.brands << Brand.create(:name => "test brand2")
      company.should have(2).brands
    end
  end

end
