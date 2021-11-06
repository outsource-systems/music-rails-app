class Api::V1::ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @q.sorts = ["sort_number ASC", "name ASC"] if @q.sorts.blank?
    @products = @q.result
  end
end
