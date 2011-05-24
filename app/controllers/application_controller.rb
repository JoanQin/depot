class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  
  private 
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
  public
    def index_count
      if session[:counter].nil?
        session[:counter] = 1
        return session[:counter]
      else
        session[:counter] = session[:counter] + 1
        return session[:counter]
      end
    end
    
    def reset_count
      session[:counter] = 0
      return session[:counter]
    end
    
  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice=>"Please log in"
      end
    end
end
