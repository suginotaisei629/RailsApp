class ProductMailer < ApplicationMailer
  def in_stock
    @product = params[:product]
    subscriber = params[:subscriber]

    # `subscriber` が存在するか確認
    if subscriber.present?
      mail to: subscriber.email, subject: 'Product in Stock'
    else
      # `subscriber` がない場合はデフォルトのメールアドレスを使うか、エラーハンドリング
      mail to: 'default@example.com', subject: 'Product in Stock'
    end
  end
end
