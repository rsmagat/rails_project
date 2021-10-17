require "open-uri"
require "json"
require 'faker'

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
  if !dog_breeds["message"][breed.to_s].empty?
    category = Category.create(
        category_name: breed,
        breed_type: 'master_has_sub'
    )

    sub_breed.each do |sb|
      sb_image = dog_fetch(sub_breed_image(breed, sb).to_s)

      is_sub_breed = category.breeds.create(
        breed_name: sb.to_s,
        image_url:  sb_image["message"],
        breed_type: 'sub'
      )
    end
  else
    b_image = dog_fetch(breed_image(breed).to_s)

    category = Category.create(
        category_name: breed,
        breed_type: 'master_has_no_sub'
      )

    breed = category.breeds.create(
      breed_name: breed.to_s,
      image_url:  b_image["message"],
      breed_type: 'master'
    )
  end
end

puts "Created #{Category.count} categories."
puts "Created #{Breed.count} breeds."