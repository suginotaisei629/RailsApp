class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    subscriber = Subscriber.create!(email: "subscriber@example.com")
    product = Product.create!(name: "Test Product") # ここで製品を作成

    # メールを送信する際にproductパラメータを渡す
    mail = ProductMailer.with(product: product, subscriber: subscriber).in_stock

    assert_equal ["subscriber@example.com"], mail.to
    assert_equal "Test Product is back in stock.", mail.body.encoded
  end
end
