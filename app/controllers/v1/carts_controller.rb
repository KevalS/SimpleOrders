class V1::CartsController < ApplicationController
  before_action :authenticate_request
  before_action :set_cart, only: [:checkout, :basket]

  def index
    @carts = current_user.carts.completed
  end

  def show
    @cart = current_user.carts.find_by(id: params[:id])
    if @cart.nil?
      render json: { error: 'Cart not found' }, status: 404
    else
      @items = @cart.items
    end
  end

  def basket
    render :show
  end

  def checkout
    if @cart.check_out(checkout_params)
      render :show
    else
      render json: { error: @cart.error_message }, status: 404
    end
  end

  private

    def set_cart
      @cart = current_user.carts.find_or_create_by(actual_status: "open")
      @items = @cart.items
    end

    def checkout_params
      params.require(:cart).permit(:email, :address, :card)
    end

end
