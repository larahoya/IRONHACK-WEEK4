(1..25).each do |index|
  Contact.create(name:"Contact #{index}", address:"Address #{index}", phone:"#{index}", email:"#{index}@gmail.com", favorite: false)
end

