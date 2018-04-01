class ChefiliciousCliGem::Meal_Kits
  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url, :meal_kits, :meal_type, :cuisine, :food_category, :mealkit, :rating
  @@all = []

  def initialize
    @name = name
    @price = price
    @skill_level = skill_level
    @cooking_time = cooking_time
    @allergen = allergen
    @url = url
    @mealkit = mealkit
  end

  def self.scrape_all
    self.scrape_chef_d
    self.scrape_chefd_chefs
end

  def self.all
    @@all
  end

  def self.scrape_chef_d
    doc = Nokogiri::HTML(open("https://www.chefd.com/collections/all?sort_by=best-selling"))
     meal_kits_chef_d = doc.css("div.grid.grid--uniform.grid--view-items.product-list div.grid__item.small--one-half.medium-up--one-third.product-item")
     meal_kits_chef_d.each do|mealkit_chef_d|
      #binding.pry
      mealkit = self.new
      mealkit.name = mealkit_chef_d.css("a").attribute("data-name").value
      mealkit.price = mealkit_chef_d.css("button").text.gsub(/\n/,"").strip  # need to work on spacing
      mealkit.skill_level = mealkit_chef_d.attribute("data-skill_level").value
      mealkit.url = "https://www.chefd.com#{mealkit_chef_d.css('a').attribute('href').text.strip}"
      mealkit.meal_type = mealkit_chef_d.attribute("data-type_of_meal")
      mealkit.cooking_time = mealkit_chef_d.css("span").text.strip  # Need to remove "Net Carbs940For 2 For 4 "
      mealkit.allergen = mealkit_chef_d.attribute("data-allergens")
      mealkit.cuisine = mealkit_chef_d.attribute("data-cuisine")
      mealkit.food_category = mealkit_chef_d.attribute("data-proteins")
      mealkit.rating = mealkit_chef_d.css("div.grid-view-item__meta").first.attribute("product_rating") #product rating is not working  .product_rating
      @@all << mealkit
    end
  end

  def self.scrape_chefd_chefs
    doc = Nokogiri::HTML(open("https://www.chefd.com/pages/our-chefs"))
    meal_kits_chefd_chefs = doc.css("div.chefsGrid.che-grid div.chef-details")
    meal_kits_chefd_chefs.each do|mealkit_chef|
      binding.pry
      mealkit_chef = self.new
      mealkit_chef.chefname = mealkit_chef.attribute("chef-name")
      mealkit_chef.knowfor = mealkit_chef.attribute("chef-description")
      mealkit_chef.description = mealkit_chef.attribute("p.description")
      @@all << mealkit_chef
    end
  end

def self.save
  @@all
end


  def self.find_by_mealkit(name)
    @@all.detect{|mealkit|mealkit.name == name}
  end

  def self.find_by_chef(name)
    @@all.detect{|chefname|chefname.name == name}
  end

end
