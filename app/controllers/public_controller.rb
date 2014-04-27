class PublicController < ApplicationController
  def index
  end

  def admin
  	File.new("public/text.txt", "r").each { |line| @some = line }
  	@docc = "Docl" 
  end
end
