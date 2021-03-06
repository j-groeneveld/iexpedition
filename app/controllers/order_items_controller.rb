class OrderItemsController < ApplicationController
  include CurrentOrder
  before_action :set_order, only: [:create, :update, :destroy]
  before_action :set_order_item, only: [:update, :destroy]

  def create
    @product = Activity.find_by(id: order_item_params[:productable_id])
    qty = order_item_params[:qty].to_i
    qty = qty > 0 ? qty : 1
    @order_item = @order.add_product(@product, qty)

    respond_to do |format|
      if @order.save
        format.js
      else
        flash[:error] = 'There was a problem adding this item.'
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      return format.js if @order_item.update_attributes(qty: order_item_params[:qty])
      format.js { render 'error' }
    end
  end

  def destroy
    @order_item.destroy
  end

  private

  def order_item_params
    params.require(:order_item).permit(:productable_type, :productable_id, :qty, :id)
  end

  def set_order_item
    @order_item = @order.order_items.find_by(id: order_item_params[:id])
  end
end
