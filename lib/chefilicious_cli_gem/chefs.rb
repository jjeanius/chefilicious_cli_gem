class Chefs
  attr_accessor :name, :knowfor, :description, :chefs, :chef_info

  @@all_chefs = []

  def self.all
    @@all_chefs
  end

  def self.scrape_all_chefs
    self.scrape_chefs
  end

  def self.scrape_chefs
    doc = Nokogiri::HTML(open("https://www.chefd.com/pages/our-chefs"))
    meal_kits_chefs = doc.css("div.section-width-limiter div#chefsGrid.chef-grid")
    meal_kits_chefs.each do|chef|
      chef_info = self.new
      chef_info.name = chef.css("#chefsGrid").css("chef_name")
      chef_info.knowfor = chef.css("chef-description")
      chef_info.description = chef.css("p.description")
      chef_info.url = "https://www.chefd.com/collections/#{chef.css('a').attribute('href').text.strip}"
      chef_info
      @@all_chefs << chef
    end
  end

  def self.find_by_chef
    @@all_chefs.detect{|chefname|chefname == chef}
    end

  def self.save
    @@all_chefs
  end

end
