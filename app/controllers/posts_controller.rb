class PostsController < ApplicationController
    def index
        @products = Product.all
    end
end
