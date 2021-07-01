require 'pry'

class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
    if @account.exchange_market == "Binance"
      @account_coins = helpers.connect_to_binance(@account)
    else
    end
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path
    else
      render :new
    end
  end

  private
  def account_params
    params.require(:account).permit(:title, :api_key, :secret_key, :exchange_market)
  end
end
