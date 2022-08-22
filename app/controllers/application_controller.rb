class ApplicationController < ActionController::Base

    before_action :set_user

    def set_user
        @current_user = User.find_by(id: session[:user_id])
        @assets = Asset.find_by(user_id: session[:user_id])
        if @assets && @assets.cs_aset != nil
            session[:body] = @assets.cs_aset
            session[:container] = "container-#{@assets.cs_aset}"
            session[:shadow] = "#{@assets.cs_aset}-shadow"
            session[:font] = "font-#{@assets.cs_aset}"
            session[:inner] = "inner-#{@assets.cs_aset}"
            session[:bg] = "bgr-#{@assets.cs_aset}"
        end
    end

    def must_login
        if @current_user == nil
            flash[:notice] = "Anda harus login terlebih dahulu"
            redirect_to("/login")
        end
    end
end
