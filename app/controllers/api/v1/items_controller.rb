class Api::V1::ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @q.sorts = ["sort_number ASC", "name ASC"] if @q.sorts.blank?
    @items = @q.result.page(params[:page]).per(params[:page] || 25)
  end
end
