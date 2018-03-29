class WelcomeController < ApplicationController

  def welcome
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    render :layout => "application"
  end

end
