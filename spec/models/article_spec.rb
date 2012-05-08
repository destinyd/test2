describe Article do
  it "Article must have title" do
    article = Article.create :title => nil
    article.id.should eq(nil)
  end
end
