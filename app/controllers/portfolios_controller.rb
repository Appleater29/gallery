class PortfoliosController < ApplicationController

  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_portfolio, only: %i[ show edit update destroy ]
  
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to @portfolio
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_path
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    # params.require(product: [ :name, :description, images: [] ])
    params.require(:portfolio).permit(:name, :description, images: [])

    # changed from expect to require to help with creating/updating portfolios
  end


end
