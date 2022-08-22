class PostsController < ApplicationController
    # before_action :must_login

    def posts_form
        session[:post] = "active"
        session[:home] = nil
        session[:login] = nil
        session[:signup] = nil
    end
end
