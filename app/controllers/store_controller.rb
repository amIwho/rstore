class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    locale = params[:set_locale]
    if locale
     redirect_to store_path(locale: locale)
    else
     @products = Product.order(:title)
     @cart = current_cart
     end
  end


  def show
    @product = Product.find(params[:product_id])

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end
end
