class PublicController < ApplicationController
  def index
    
  end

  def robots
  	j = -1
  	arr = []
  	@percent = []
  	@robot_id = []
  	10.times do |k| 
  		arr[k] = params[:abcdifghij_id[k]]
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
  	Feature.destroy_all
  	File.new("public/text.txt", "r").each { |line| Public.processor(line) }
  	redirect_to root_path
  	flash[:notice] = "Successful database upgrading! Congratulations!"
  end
end
