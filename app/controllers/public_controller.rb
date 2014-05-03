class PublicController < ApplicationController
  def index
  end

  def robots
  	j = -1
    arr = []
  	@percent = []
    @robot_id = []
    @robots = Robot.all

  	10.times { |k| arr[k] = params[:abcdefghij_id[k]] }

    if Public.repeats(arr) == 0
      @robots.each do |robot|
        j += 1 
        @percent[j] = Public.percenter(robot, arr)
        @robot_id[j] = robot.id
      end
    else
      redirect_to root_path, alert: "Try to put only unique features and don't repeat yourself :)"
    end
  end

  def restore
  	Robot.destroy_all
  	Feature.destroy_all
  	File.new("public/text.txt", "r").each { |line| Public.processor(line) }
  	redirect_to root_path, notice: "Successful database upgrading! Congratulations!"
  end
end