class UsersController < ApplicationController


    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        render :new
      end
    end

    def update
      @user = Userfind(params[:id])
      if @user = Userupdate(user_params)
        redirect_to @user
      else
        render :edit
      end
    end

    def destroy
      User.destroy(params[:id])
      redirect_to @user
    end

  private

    def user_params
      params.require(:user).permit(:name, :location_id, :location_name, :email, :age, :username, :password, :password_confirmation)
    end
  end
