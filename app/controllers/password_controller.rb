class PasswordController < ApplicationController
  def check
    @username = params[:username] unless params[:username].nil?
    @password = params[:password] unless params[:password].nil?
    special = "?<>',?[]}{=-)(*&^%$#`~{}."
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    if !@username || !@password
    elsif @username.length < 6 || @password.length < 6
     flash.now[:alert] = "Username and password must contain at least 6 characters"
    elsif @username == @password
     flash.now[:alert] = "Username cannot be the same as password"
    elsif @username =~ regex
     flash.now[:alert] = "Username must not contain special characters"
    elsif @password !=~ /\d/ && @password !=~ regex
     flash.now[:alert] = "Password must contain a number and a special character"
    end
   render "check_password.html.erb"
  end

  def index
  end
end
