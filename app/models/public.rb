class Public

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