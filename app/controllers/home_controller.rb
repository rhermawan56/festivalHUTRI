class HomeController < ApplicationController
  def top
  end

  def index
    session[:home] = "active"
    session[:post] = nil
    session[:login] = nil
    session[:signup] = nil
  end
end
