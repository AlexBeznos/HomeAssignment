puts "Start seeding..."
Robot.create(name: "MoonLight")
r = Robot.first
r.features.create(name: "Size")
f = r.features.first
Robot.create(name: "HelloWorld")
r = Robot.find(2)
r.features << Feature.first
puts "Finish)" 