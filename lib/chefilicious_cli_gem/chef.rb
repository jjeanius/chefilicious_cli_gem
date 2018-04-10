class Chef

  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url, :meal_kits, :meal_type, :cuisine, :food_category, :mealkit, :rating, :chef



  @@all_chef = []





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

    @@all_chef

  end



  def self.scrape_all

    self.scrape_chef_d

    self.scrape_chefs

  end





  def self.scrape_chefs



    doc = Nokogiri::HTML(open("https://www.chefd.com/pages/our-chefs"))

    meal_kits_chefs = doc.css("div.section-width-limiter div#chefsGrid.chef-grid")

    meal_kits_chefs.each do|chef|

binding.pry

      chef.new = chef

      chef.name = chef.css("#chefsGrid").css("chef_name")

      chef.knowfor = chef.css("chef-description")

      chef.description = chef.css("p.description")

      chef.url = "https://www.chefd.com/collections/#{chef.css('a').attribute('href').text.strip}"

      chef

      @@all_chef << chef

    end

  end


  def self.find_by_chef

    @@all_chef.detect{|chefname|chefname == chef}

    end



  def self.save

    @@all

  end





end
