class Item < ApplicationRecord
	belongs_to :product
	belongs_to :cart


	def self.add_to_cart(params, user)
		cart = user.carts.find_or_create_by(actual_status: "open")
		item = cart.items.find_or_create_by(product_id: params[:product_id])
		item.quantity = params[:quantity] if params[:quantity] >= 0
		item.save
	end

  def self.remove_from_cart(product_id, user)
    cart = user.carts.find_or_create_by(actual_status: "open")
    item = cart.items.find_by(product_id: product_id)
    if item.nil?
      return false
    else
      item.destroy
      return true
    end
  end

  def update_inventory
  	self.product.update(inventory: self.product.inventory - self.quantity)
  end

  def subtotal
  	quantity * product.price
  end
end
