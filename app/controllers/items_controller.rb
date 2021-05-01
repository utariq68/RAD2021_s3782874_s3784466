class ItemsController < ApplicationController
  def index
    @shopping = Item.all
  end

  def men
    @shopping = Item.all.where(category: "m")
  end

  def female
    @shopping = Item.all.where(category: "f")
  end

  def save
    @shopping = Item.all.where(list: "t")
  end

  def add
    @shopping = Item.find(params[:id])
    # @shopping = Item.where(list: "f")
    @shopping.update(list: "t")
    redirect_to root_path
  end

  def remove
    @shopping = Item.find(params[:id])
    # @shopping = Item.where(list: "f")
    @shopping.update(list: "f")
    redirect_to save_path
  end
end
