require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")


Cocktail.destroy_all
Ingredient.destroy_all


url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)
capitalized_drinks = {}
drinks['drinks'].each { |e| Ingredient.create(name: e["strIngredient1"].split.map(&:capitalize)*' ') }

cocktails = [
  {
    name: "Old Fashioned",
    photo: "http://az659704.vo.msecnd.net/v1/image/c_lpad,w_1500,h_1500/v1400604631/cocktail_old_fashioned-1.png"
    },
  {
    name: "Bora Bora",
    photo: "http://az659704.vo.msecnd.net/v1/image/c_lpad,w_1500,h_1500/v1400603728/cocktail_bora_bora-1.png"
    },
  {
    name: "Dry Martini",
    photo: "http://az659704.vo.msecnd.net/v1/image/c_lpad,w_1500,h_1500/v1401441139/cocktail_dry_martini-1.png"
    },
  {
    name: "Mai Tai",
    photo: "http://az659704.vo.msecnd.net/v1/image/c_lpad,w_1500,h_1500/v1400603096/cocktail_mai_tai-1.png"
    }
]
cocktails.each { |cocktail| Cocktail.create(cocktail) }

# # has_attachement :photo
# url = "http://az659704.vo.msecnd.net/v1/image/c_lpad,w_1500,h_1500/v1400603728/cocktail_bora_bora-1.png"
# cocktail = Cocktail.new(name: 'Bora Bora')
# cocktail.save!
# cocktail.photo_urls = url # Upload happens here

# url = "http://az659704.vo.msecnd.net/v1/image/c_lpad,w_1500,h_1500/v1400603096/cocktail_mai_tai-1.png"
# cocktail = Cocktail.new(name: 'Maitai')
# cocktail.save!
# cocktail.photo_urls = url

# url = "http://az659704.vo.msecnd.net/v1/image/c_lpad,w_1500,h_1500/v1400604631/cocktail_old_fashioned-1.png"
# cocktail = Cocktail.new(name: 'Old Fashioned')
# cocktail.save!
# cocktail.photo_urls = url

# url = "http://az659704.vo.msecnd.net/v1/image/c_lpad,w_1500,h_1500/v1401441139/cocktail_dry_martini-1.png"
# cocktail = Cocktail.new(name: 'Dry Martini')
# cocktail.save!
# cocktail.photo_urls = url


