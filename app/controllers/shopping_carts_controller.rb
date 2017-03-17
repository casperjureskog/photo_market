class ShoppingCartsController < ApplicationController
  before_action :get_shopping_cart

  def show
    if @cart.total === 0
      flash[:alert] = 'Please add a photo to your cart before checkout'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def get_shopping_cart
    @cart = ShoppingCart.find(session[:cart_id])
  end
end
