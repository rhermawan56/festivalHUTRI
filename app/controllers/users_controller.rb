class UsersController < ApplicationController
    before_action :must_login, {only: [:setting]}

    def setting
        @users = User.find_by(id: params[:id])
        session[:setting] = "active"
        session[:post] = nil
        session[:home] = nil
        session[:login] = nil
        session[:signup] = nil
    end

    def profile
        
    end

    def signup
        session[:signup] = "active"
        session[:login] = nil
        session[:post] = nil
        session[:home] = nil

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
        session[:login] = "active"
        session[:post] = nil
        session[:home] = nil
        session[:signup] = nil
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
        session[:body] = nil
        session[:container] = nil
        session[:shadow] = nil
        session[:font] = nil
        session[:inner] = nil
        session[:bg] = nil
        flash[:notice] = "Anda berhasil logout"
        redirect_to("/home")
    end
end
