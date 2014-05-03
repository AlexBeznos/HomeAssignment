class Public

  def self.percenter(robot, feature_id)
    m = robot.features.length
    puts "Robot length #{m}"
    percent = 0
    feature_id.each do |k|
      percent += 1 unless robot.features.find_by(name: Feature.find(k).name).nil?
    end
    return (percent + (10 - m)) * 10 
  end

  def self.repeats(array)
  	k = 0
  	for i in 0..array.length-2 do
  		for j in i+1..array.length-1 do
        k += 1 if array[i] == array[j]
      end
    end
    puts "Hello this is #{k}"
    return k
  end

  def self.processor(line)
  	i = 0
    arr = line.scan(/[\w']+/)
    name = ""
    arr.each do |word|
      i += 1
      name = word if i == 1
      if i == 1
      	Robot.create(name: word)
      elsif Feature.exists?(name: word)
      	Robot.find_by(name: name).features << Feature.find_by(name: word)
      else
        Robot.find_by(name: name).features.create(name: word)
      end
    end
  end
end