class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])  # stock es variable temporal. Stock es el nombre de la clase del modelo, y de ahi se manda a traer la funcion /*
      if @stock
          respond_to do |format|
            format.js { render partial: 'users/result' } 
          end        
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js { render partial: 'users/result' }
        end        
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: 'users/result' }
      end   
    end    
  end

end
