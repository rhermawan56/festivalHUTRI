class UsersController < ApplicationController

    def signup
        @users = User.new
    end

    def create
        @users = User.new(
            name: params[:name],
            email: params[:email],
            address: params[:address],
            password: params[:password]
        )

        if params[:password] != params[:cekpassword]
            flash[:notice] = "password tidak sesuai"
            render("users/signup")
        elsif @users.save
            flash[:notice] = "Berhasil membuat akun"
            redirect_to("/login")
        else
            flash[:notice] = "Gagal membuat akun kolom tidak boleh kosong"
            render("users/signup")
        end
    end

    def login_form
        
    end

    def login
        @users = User.find_by(email: params[:email])
        if @users && @users.authenticate(params[:password])
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
