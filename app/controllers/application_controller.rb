class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize
  before_filter :set_i18n_locale_from_params
  before_filter :initialize_variables
  # ...
  
  protected

  def initialize_variables
    @cart = current_cart
  end
      
  def set_i18n_locale_from_params
    locale = params[:locale]
    if locale
        if I18n.available_locales.include?(locale.to_sym)
            I18n.locale = locale
        else
            flash.now[:notice] = "#{locale} translation not available"
            logger.error flash.now[:notice]
        end
    end
  end

  def default_url_options
      { locale: I18n.locale }
    end
  
   protected
   
   def authorize
       unless User.find_by_id(session[:user_id])
       redirect_to login_url, notice: "Пожалуйста, пройдите авторизацию"
       end
   end
   
  private
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
