require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    # Product を作成
    product = Product.create!(name: "Test Product", 
                              description: "Test Description", 
                              inventory_count: 10)

    # Subscriber を作成し、Product と関連付け
    subscriber = Subscriber.create!(email: "subscriber@example.org", product: product)

    # メール送信
    mail = ProductMailer.with(product: product, subscriber: subscriber).in_stock

    # メール内容を確認
    assert_equal "In stock", mail.subject 
    assert_equal [subscriber.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match product.name, mail.body.encoded
  end
end
