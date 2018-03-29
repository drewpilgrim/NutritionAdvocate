# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User Seed
user = User.create({username:"Drew", email:"drew@gmail.com",password:"password", age:"24", gender:"m"})
puts user.errors.full_messages

# Alergy Requirements
Requirement.create([{name: "Dairy", tag: "allergy", yummly_search:"396^Dairy-Free"},{name: "Egg", tag: "allergy", yummly_search:"397^Egg-Free"}, {name: "Gluten", tag: "allergy", yummly_search:"393^Gluten-Free"}, {name: "Peanut", tag: "allergy", yummly_search:"394^Peanut-Free"}, {name: "Seafood", tag: "allergy", yummly_search:"398^Seafood-Free"}, {name: "Sesame", tag: "allergy", yummly_search:"399^Sesame-Free"}, {name: "Soy", tag: "allergy", yummly_search:"400^Soy-Free"}, {name: "Sulfite", tag: "allergy", yummly_search:"401^Sulfite-Free"}, {name: "Wheat", tag: "allergy", yummly_search:"392^Wheat-Free"}])

# Diet Requirements
Requirement.create([{name: "Vegetarian", tag: "diet",yummly_search:"389^Ovo vegetarian"},{name: "Vegan", tag: "diet",yummly_search:"386^Vegan"}, {name: "Pescetarian", tag: "diet",yummly_search:"390^Pescetarian"}])

#Mealtype Requirement
Requirement.create([{name: "Main Dishes", tag: "mealType", yummly_search:"course^course-Main Dishes"},{name: "Desserts", tag: "mealType", yummly_search:"course^course-Desserts"}, {name: "Side Dishes", tag: "mealType",yummly_search:"course^course-Side Dishes"}, {name: "Lunch", tag: "mealType", yummly_search:"course^course-Lunch"}, {name: "Snacks", tag: "mealType", yummly_search:"course^course-Snacks"}, {name: "Appetizers", tag: "mealType", yummly_search:"course^course-Appetizers"}, {name: "Salads ", tag: "mealType",yummly_search:"course^course-Salads"}, {name: "Brakfast and Brunch", tag: "mealType", yummly_search:"course^course-Breakfast and Brunch"}, {name: "Soups", tag: "mealType", yummly_search:"course^course-Soups"}])

#Nutritional Data
NutritionalDatum.create({age:25, gender:"m", exercise:3, procnt:64, fibtg:30, vita_iu:0.0009, thiamin:0.0012, riboflavin:0.0013, niacin:0.016, vitamin_b6:0.0013, vitamin_b12:0.0000024, folate:0.0004, vitc: 0.045, ca:1.0, iodine:0.00015, fe:0.008, magnesium:0.4, k:3.8, na:6.9, zinc:0.014, enerc_kcal:14398, chole:22, fatrn:8, fasat:1.6, chocdf:250, sugar:30, fat:61})

NutritionalDatum.create({age:25, gender:"f", exercise:3, procnt:46, fibtg:25, vita_iu:0.0007, thiamin:0.0011, riboflavin:0.0011, niacin:0.014, vitamin_b6:0.0013, vitamin_b12:0.0000024, folate:0.0004, vitc: 0.045, ca:1.0, iodine:0.00015, fe:0.018, magnesium:0.31, k:2.8, na:6.9, zinc:0.008, enerc_kcal:12593, chole:22, fatrn:8, fasat:1.6, chocdf:250, sugar:30, fat:61})

# Dummy Data

UserRequirement.create({user_id: 1, requirement_id: 5})


PastMeal.create({na: 0.002, fatrn: 0, fasat: 0, chocdf: 0, fibtg: 4, procnt: 0, vitc: 0.0063, ca: 0.01, fe: 0.00018, sugar: 19, enerc_kcal: 95, fat: 0, vita_iu:0.000018, k: 0, chole: 0, name: "Apple", user_id: 1})

PastMeal.create({na: 0.002, fatrn: 0, fasat: 0, chocdf: 0, fibtg: 4, procnt: 0, vitc: 0.0063, ca: 0.01, fe: 0.00018, sugar: 19, enerc_kcal: 95, fat: 0, vita_iu:0.000018, k: 0, chole: 0, name: "Apple", user_id: 1})

PastMeal.create({na: .6912, fatrn: .9, fasat: 1.5, chocdf: 20.7, fibtg: 5.8, procnt: 0, vitc: 0.00483, ca: 0.01, fe: 0.00018, sugar: 5.2, enerc_kcal: 127.2, fat: 0, vita_iu:0.0000213, k: .612, chole: .0048, name: "Minestrone", user_id: 1})




