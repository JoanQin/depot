class ApplicationController < ActionController::Base
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
end
