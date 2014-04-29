class PublicController < ApplicationController
  def index
  end

  def admin
  	Robot.delete_all
  	Feature.delete_all
  	File.new("public/text.txt", "r").each { |line| Public.processor(line) }
  	redirect_to root_path
  	flash[:notice] = "Success!"
  end
end
