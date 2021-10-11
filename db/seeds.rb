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

    if (!dog_breeds["message"]["#{breed}"].empty?)
        sub_breed.each do |sb|
            is_sub_breed = category.breeds.create(
                breed_name: "#{sb}",
                image_url: "#{sub_breed_image(breed, sb)}"
            )
        end
    else
        breed = category.breeds.create(
            breed_name: "#{breed}",
            image_url: "#{breed_image(breed)}"
        )
    end
end

puts "Created #{Category.count} categories."
puts "Created #{Breed.count} breeds."



# subbreed.each do |sub|
#   puts "  * #{sub}"
#   subbreed_image = sub_breed_image(breed, sub)
#   puts "#{subbreed_image}"
# end

# dog_breeds["message"].each do |breed, subbreed|
#     puts "* #{breed}"
#     breed_image = breed_image(breed)
#     puts "#{breed_image}"

#     subbreed.each do |sub|
#       puts "  * #{sub}"
#       subbreed_image = sub_breed_image(breed, sub)
#       puts "#{subbreed_image}"
#     end
#   end
