class PublicController < ApplicationController
  $time = 0 # Variable to count how many times were used action "restore". I use it because restoring make displacement to one unit
  def index
  end

  def robots
  	j = -1
    arr = []
  	@percent = []
    @robot_id = []
    @robots = Robot.all

  	10.times { |k| arr[k] = params[:abcdifghij_id[k]] }

    if Public.repeats(arr) == 0
      @robots.each do |i|
        j += 1 
        @percent[j] = Public.percenter(i, arr)
        @robot_id[j] = i.id
      end
    else
      redirect_to root_path, alert: "Try to put only unique features and don't repeat yourself :)"
    end
  end

  def restore
    $time += 1
  	Robot.destroy_all
  	Feature.destroy_all
  	File.new("public/text.txt", "r").each { |line| Public.processor(line) }
  	redirect_to root_path, notice: "Successful database upgrading! Congratulations!"
  end
end