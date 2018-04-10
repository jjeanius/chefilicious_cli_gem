class ChefiliciousCliGem::Meal_Kits
  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url, :meal_kits, :meal_type, :cuisine, :food_category, :mealkit, :rating, :chef

  @@all = []

  def initialize
    @name == name
    @price == price
    @skill_level == skill_level
    @cooking_time == cooking_time
    @allergen == allergen
    @url == url
    @mealkit == mealkit
    @chef == chef
  end

  def self.all
    @@all
  end

  def self.scrape_all
    self.scrape_chef_d
  #  self.scrape_chefs
  end

  def self.scrape_chef_d
    doc = Nokogiri::HTML(open("https://www.chefd.com/collections/all?sort_by=best-selling"))
     meal_kits_chef_d = doc.css("div.grid.grid--uniform.grid--view-items.product-list div.grid__item.small--one-half.medium-up--one-third.product-item")
     meal_kits_chef_d.each do|mealkit_chef_d|
      mealkit = self.new
      mealkit.name = mealkit_chef_d.css("a").attribute("data-name").value
      mealkit.price = mealkit_chef_d.css("button")[0].text.gsub(/\n/,"").strip
      mealkit.skill_level = mealkit_chef_d.attribute("data-skill_level").value
      mealkit.url = "https://www.chefd.com#{mealkit_chef_d.css('a').attribute('href').text.strip}"
      mealkit.meal_type = mealkit_chef_d.attribute("data-type_of_meal")
      mealkit.cooking_time = mealkit_chef_d.css("span")[0].text
      mealkit.allergen = mealkit_chef_d.attribute("data-allergens")
      mealkit.cuisine = mealkit_chef_d.attribute("data-cuisine")
      mealkit.food_category = mealkit_chef_d.attribute("data-proteins")
      mealkit.rating = mealkit_chef_d.css("div.grid-view-item__meta.product_rating")  # does not work
      mealkit
      @@all << mealkit
    end
  end

#  def self.scrape_chefs
#    doc = Nokogiri::HTML(open("https://www.chefd.com/pages/our-chefs"))
#    meal_kits_chefs = doc.css("div.section-width-limiter div#chefsGrid.chef-grid")
#    meal_kits_chefs.each do|chef|
#binding.pry
#      chef.new = chef
#      chef.name = chef.css("#chefsGrid").css("chef_name")
#      chef.knowfor = chef.css("chef-description")
#      chef.description = chef.css("p.description")
#      chef.url = "https://www.chefd.com/collections/#{chef.css('a').attribute('href').text.strip}"
#      chef
#      @@all << chef
#    end
#  end

  def self.find_by_mealkit(mealkit)
    @@all.detect {|meal| meal.name == mealkit}
    mealkit
    end
#  def self.find_by_chef
#    @@all.detect{|chefname|chefname == chef}
#    end

  def self.save
    @@all
  end


end
