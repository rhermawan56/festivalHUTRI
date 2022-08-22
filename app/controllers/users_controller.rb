class UsersController < ApplicationController
    def login_form
        
    end

    def login
        @users = User.find_by(email: params[:email])
        if @users
            flash[:notice] = "Anda berhasil login"
            session[:user_id] = @users.id
            redirect_to("/home")
        else
            flash[:notice] = "Gagal untuk login"
            redirect_to("/login")
        end
    end

    def logout
        session[:user_id] = nil
        flash[:notice] = "Anda berhasil logout"
        redirect_to("/home")
    end
end
