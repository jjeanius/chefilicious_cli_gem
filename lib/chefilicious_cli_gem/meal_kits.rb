class ChefiliciousCliGem::Meal_Kits
  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url, :meal_kits

  def self.selection
    self.scrape_meal_kits

  end

  def self.scrape_meal_kits
    meal_kits = []


    # Go to Chef'D, Chefday, Fresh_Direct find the information
    # extract the properties
    # instantiate meal_kit

    #meal_kits << self.scrape_chef_d
    #meal_kits << self.scrape_chefday
    #meal_kits << self.scrape_fresh_direct

  meal_kits
end

  def self.scrape_chef_d
    doc = Nokogiri::HTML(open("https://www.chefd.com/collections/all?sort_by=best-selling"))
    doc.css(div.class "grid grid")
    binding.pry

  end

  def self.scrape_fresh_direct
    doc = Nokogiri::HTML(open("https://www.freshdirect.com/browse.jsp?pageType=browse&id=meals_kits_meals"))
      doc.css(div mealkits_products_list).text

  end


  def self.scrape_chefday
    doc = Nokogiri::HTML(open("http://www.chefday.com/recipes"))


  end

end
