class PublicController < ApplicationController
  def index
    
  end

  def robots
  	j = -1
  	arr = []
  	@percent = []
  	@robot_id = []
  	10.times do |k| 
  		arr[k] = params[:feature_id[k]] unless params[:feature_id[k]].nil?
  	end
  	Robot.all.each do |i| 
  	  j+=1
  	  @percent[j] = Public.percenter(i, arr)
      @robot_id[j] = i.id
    end
    @robots = Robot.all
  end

  def admin
  	Robot.destroy_all
  	Feature.delete_all
  	File.new("public/text.txt", "r").each { |line| Public.processor(line) }
  	redirect_to root_path
  	flash[:notice] = "Success!"
  end
end
