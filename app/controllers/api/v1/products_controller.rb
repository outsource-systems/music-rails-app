class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %w[show]

  def index
    @q = Product.ransack(params[:q])
    @q.sorts = ["sort_number ASC"] if @q.sorts.blank?
    @products = @q.result.includes(:artists)
    if params[:is_fetch_items]
      @products.includes(:items)
      @products.includes(items: :artists)
    end
    @products.page(params[:page]).per(params[:per])
  end

  def show; end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
