class PublicController < ApplicationController
  def index
  end

  def admin
  	File.new("public/text.txt", "r").each { |line| @some = line }
  	redirect_to root_path
  	flash[:notice] = "Success!"
  end
end
