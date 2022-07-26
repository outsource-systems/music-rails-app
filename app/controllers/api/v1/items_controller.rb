class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: %w[show]

  def index
    @q = Item.ransack(params[:q])
    @q.sorts = ["sort_number ASC"] if @q.sorts.blank?
    @items = @q.result.includes(:product).page(params[:page]).per(params[:per])
  end

  def show; end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
