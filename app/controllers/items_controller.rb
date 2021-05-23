class ItemsController < ApplicationController

  def index
    @shopping = Item.all.where(list: "f").or(Item.all.where(list: "t")).order("popularity desc")
    @top_list = Item.all
    @topbanner_item = @top_list.sample
  end

  def men
    @shopping = Item.all.where(category: "m")
  end

  def newCollection
    @shopping = Item.all.where(created_at: Time.now.months_since(-3)..Time.zone.now.end_of_day)
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

  def wishlist
    if current_user
      user = User.find(session[:user_id])
      @savelist=Wishlist.all.where(email: user.email)
    else
      @savelist=Wishlist.all.where(email: nil)
    end
  end

  def summary
    @savelist = Wishlist.all
  end

  def add
    @shopping = Item.find(params[:id])
    @shopping.update(list: "t")

    @curr_pop = @shopping.popularity
    @curr_pop += 1
    @shopping.update(popularity: @curr_pop)
    @shopping.save

    redirect_to save_path
  end

  def wishAdd
    @item = Item.find(params[:id])
    newItem = Wishlist.new(title: @item.title, body: @item.body, price: @item.price, image:@item.image, list:@item.list, popularity:@item.popularity)
    newItem.save
    if current_user
      user = User.find(session[:user_id])
      newItem.update(email: user.email)
    end
    redirect_to wishlist_path
  end

  def wishRemove
    @item = Wishlist.find(params[:id])
    @item.destroy
    redirect_to wishlist_path
  end

  def removeWish
    @item = Item.find(params[:id])
    Wishlist.all.each do |wish| 
      if @item.title == wish.title
        wish.destroy
      end
    end
    redirect_to wishlist_path
  end

  def remove
    @shopping = Item.find(params[:id])
    @shopping.update(list: "f")
    @shopping.save
    redirect_to root_path
  end

  def item_details
    @current_item = Wishlist.find(params[:id])
  end

  def add_bag

    if current_user
      title = params[:title]
      body = params[:body]
      category = params[:category]
      price = params[:price].to_i
      image = params[:image]
      size = params[:size]
      color = params[:color]
      quantity = params[:quantity].to_i
      email = current_user.email

      new_bag = Bag.new(title: title, body: body, category: category, price: price, image: image, size: size, color: color, quantity: quantity, user: email)
      new_bag.save
      redirect_to bag_path
    else
      title = params[:title]
      body = params[:body]
      category = params[:category]
      price = params[:price].to_i
      image = params[:image]
      size = params[:size]
      color = params[:color]
      quantity = params[:quantity].to_i


      new_bag = Bag.new(title: title, body: body, category: category, price: price, image: image, size: size, color: color, quantity: quantity)
      new_bag.save
      redirect_to login_path
    end
  end

  def bag
    if current_user
      current_user_email = current_user.email
      @bag_items = Bag.all.where(user: current_user_email)

      @total = 0
      @bag_items.each do |item|
        price_to_add = item.price * item.quantity
        @total += price_to_add
      end
    else
      redirect_to login_path
    end
  end

  def remove_bag
    @item = Bag.find(params[:id])
    @item.destroy
    redirect_to bag_path
  end

  def cart
    if current_user
      current_user_email = current_user.email
      @bag_items = Bag.all.where(user: current_user_email)

      @total = 0
      @bag_items.each do |item|
        price_to_add = item.price * item.quantity
        @total += price_to_add
      end
    else
      redirect_to login_path
    end
  end

  def checkout

    if current_user.times == nil

      current_user_email = current_user.email
      @bag_items = Bag.all.where(user: current_user_email)

      @bag_items.each do |item|
        item.destroy
      end
      
      redirect_to rating_path

    else

      current_user_email = current_user.email
      @bag_items = Bag.all.where(user: current_user_email)

      @bag_items.each do |item|
      item.destroy

      redirect_to root_path
    end
  end
  end

  def rating
    rating = params[:quantity]
    
    if current_user.times == nil
      current_user.update(times: 2)
    end

  end

  def edit_subscription
    user_email = current_user.email
    @message = nil

    check = Subscriber.all.where(email: user_email)

    if check.exists?
      check.each do |email|
        email.destroy
      end
      @message = 'Removed from subscriber list!'

    else
      new_sub = Subscriber.new(email: user_email)
      new_sub.save
      @message = 'Added to subscriber list!'
    end
  end

  def search
    @searchItem = params[:search]
    @shopping =  Item.all.where(
        "title like ?", 
        "%#{@searchItem}%"
    )
  end


  def filteredItems

    @test = params[:test]
    puts "ADJSNAJSNDASJNDADNKJANDJKASNDJKANDJKANSDJKNADJKANKJSD" + @test.to_s
  end
end
