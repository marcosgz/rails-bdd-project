# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def checkout
    @cart = Cart.new(current_user, session[:cart])
  end

  def buy
    @product = Product.find(params[:id])
    session[:cart] ||= []
    session[:cart] << @product.id

    redirect_to root_path
  end
end
