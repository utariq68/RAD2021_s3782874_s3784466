class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def forgot
    forgotten = params[:email]
    verified_email = params[:linked]

    if forgotten != nil
      new_forgotten = Forgot.new(email: forgotten)
      new_forgotten.save
      NewLetterMailer.forgot_password(forgotten).deliver_now
    end

    if verified_email != nil
      check = Forgot.all.where("email like ?", "%#{verified_email}%")

      if check.exists?
        login_email = check[0].email
        check[0].destroy
        user = User.find_by_email(login_email)
        session[:user_id] = user.id

        persistance = Bag.all.where(user: nil).update(user: params[:email])
        persistance = Wishlist.all.where(email: nil)
        persistance.update(email: params[:email])
        redirect_to root_path, notice: "Logged in!"
      else
        redirect_to forgot_path
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
