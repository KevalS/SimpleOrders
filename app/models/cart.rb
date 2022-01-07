class Cart < ApplicationRecord
	belongs_to :user
  has_many :items

	enum actual_status: [:open, :completed]

  def total_price
    items.map(&:subtotal).inject(0, &:+)
  end

  def check_out(params)
    if valid_inventory.empty? && items.present?
      update_inventory
      self.update(params)
      self.completed!
    else
      return false
    end
  end

  def valid_inventory
    return @inventory if !@inventory.nil?
    @inventory = items.map{ |item| item.product_id if item.quantity > item.product.inventory}.compact
  end

  def update_inventory
    items.each{ |item| item.update_inventory}
  end

  def error_message
    if !items.present?
      "No products in cart"
    elsif valid_inventory.present?
      "#{valid_inventory} #{'product'.pluralize(valid_inventory.count)} are not available"
    end
  end
end
