(1..25).each do |index|
  Project.create(name: "Project #{index}", description: "Description of the project #{index}")
end
