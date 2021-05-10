class ItemsController < ApplicationController
  def index
    @shopping = Item.all

    @top_list = Item.all.where(list: "f").order("popularity desc")
    @topbanner_item = @top_list.first()
  end

  def men
    @shopping = Item.all.where(category: "m")
  end

  def female
    @shopping = Item.all.where(category: "f")
  end

  def kids
    @shopping = Item.all.where(category: "k")
  end

  def save
    @shopping = Item.all.where(list: "t")
  end

  def add
    @shopping = Item.find(params[:id])
    @shopping.update(list: "t")

    @curr_pop = @shopping.popularity
    @curr_pop += 1
    @shopping.update(popularity: @curr_pop)
    @shopping.save

    redirect_to root_path
  end

  def remove
    @shopping = Item.find(params[:id])
    @shopping.update(list: "f")
    @shopping.save
    redirect_to save_path
  end

  def item_details
  end
end
