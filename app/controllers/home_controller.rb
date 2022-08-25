class HomeController < ApplicationController
  def top
  end

  def index
    session[:home] = "actives"
    session[:post] = nil
    session[:login] = nil
    session[:signup] = nil
    session[:setting] = nil
    session[:logout] = nil
    @users = User.all
  end

end
