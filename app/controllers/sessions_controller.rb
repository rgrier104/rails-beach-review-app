class SessionsController < ApplicationController
    skip_before_action :require_login

    def welcome
    end

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Email and/or password incorrect. Please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end