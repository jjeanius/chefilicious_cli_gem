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
      mealkit.meal_type = mealkit_chef_d.attribute("data-type_of_meal").value
      mealkit.cooking_time = mealkit_chef_d.css("span")[0].text
      mealkit.allergen = mealkit_chef_d.attribute("data-allergens").value
      mealkit.cuisine = mealkit_chef_d.attribute("data-cuisine").value
      mealkit.food_category = mealkit_chef_d.attribute("data-proteins").value
      mealkit.rating = mealkit_chef_d.css("div.grid-view-item__meta.product_rating")  # does not work
      #binding.pry
      mealkit
      @@all << mealkit
    end
  end

  def self.find_by_mealkit(mealkit)
    @@all[mealkit.to_i-1]
    end

  def self.save
    @@all
  end


end
