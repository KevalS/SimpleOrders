class V1::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

end
