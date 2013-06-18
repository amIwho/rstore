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
  
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:product_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
end
