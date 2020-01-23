# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Ingredient.destroy_all
Allergen.destroy_all

User.create!([{name: "Maddie"}, {name: "Javi"}, {name: "Robert"}])

Recipe.create(name: "Pad Thai", user: User.first)
Recipe.create(name: "Hamburger", user: User.last)
Recipe.create(name: "Taco", user: User.first)

pad_thai = Ingredient.create!([{name: "Rice Noodles"}, {name: "Peanuts"}, {name: "Lime"}, {name:"Shrimp"}])
hamburger = Ingredient.create!([{name: "Ground Beef"}, {name: "Olive Oil"},{name: "Buns"},{name: "Salt"}, {name: "Pepper"}, {name: "Lettuce"}])
taco = Ingredient.create!([{name: "Corn Tortilla"}, {name: "Salsa"}])

pad_thai.each do |ing|
    RecipeIngredient.create(recipe: Recipe.find_by(name:"Pad Thai"), ingredient: ing)
end

hamburger.each do |ing|
    RecipeIngredient.create(recipe: Recipe.find_by(name:"Hamburger"), ingredient: ing)
end

taco.each do |ing|
    RecipeIngredient.create(recipe: Recipe.find_by(name: "Taco"), ingredient: ing)
end

Recipe.find_by(name:"Taco").ingredients << Ingredient.find_by(name: "Ground Beef")
Recipe.find_by(name:"Taco").ingredients << Ingredient.find_by(name: "Lettuce")


Allergen.create(user: User.first, ingredient: Ingredient.find_by(name: "Peanuts"))
 