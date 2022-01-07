class V1::ItemsController < ApplicationController
  before_action :authenticate_request

  def create
    @item = Item.add_to_cart(item_params, current_user)
    if @item
      render json: { success: 'Product added to cart' }, status: 200
    else
      render json: { error: 'Product must exist' }, status: 404
    end
  end

  def destroy
    @item = Item.remove_from_cart(params[:id], current_user)
    if @item
      render json: { success: 'Product removed from cart' }, status: 200
    else
      render json: { error: 'Product not in cart' }, status: 404
    end
  end

  private
    def item_params
      params.require(:item).permit(:product_id, :quantity)
    end
end
