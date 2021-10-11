require "open-uri"
require "json"

def dog_fetch(url)
  JSON.parse(URI.open(url).read)
end

def breed_image(breed)
  "https://dog.ceo/api/breed/#{breed}/images/random"
end

def sub_breed_image(breed, sub_breed)
  "https://dog.ceo/api/breed/#{breed}/#{sub_breed}/images/random"
end

Breed.delete_all
Category.delete_all

dog_breeds = dog_fetch("https://dog.ceo/api/breeds/list/all")

dog_breeds["message"].each do |breed, sub_breed|
  category = Category.create(category_name: breed)

  if !dog_breeds["message"][breed.to_s].empty?
    sub_breed.each do |sb|
      is_sub_breed = category.breeds.create(
        breed_name: sb.to_s,
        image_url:  sub_breed_image(breed, sb).to_s
      )
    end
  else
    breed = category.breeds.create(
      breed_name: breed.to_s,
      image_url:  breed_image(breed).to_s
    )
  end
end

puts "Created #{Category.count} categories."
puts "Created #{Breed.count} breeds."