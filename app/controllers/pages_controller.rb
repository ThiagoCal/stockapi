class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index ]

  def home
  end

  def index
    @api = StockQuote::Stock.new(api_key: "pk_03f609bd3ac74f70b35c77418535c946")
    if params[:ticker] == ""
      @nothing = "You forgot to enter a Symbol"
    elsif params[:ticker]
      begin
        @stock = StockQuote::Stock.quote(params[:ticker])
      rescue => e
        @error = "Sorry, maybe you should try again, the symbol you wrote doesn't exist"
      end
   end
  end

end
