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
        redirect_to "/"
      else
        flash[:notice] = @user.errors.full_messages
        redirect_to '/users/new'
      end
    end

  private

    def user_params
      params.require(:user).permit(:name, :location_id, :location_name, :email, :age, :username, :password, :password_confirmation)
    end
  end
