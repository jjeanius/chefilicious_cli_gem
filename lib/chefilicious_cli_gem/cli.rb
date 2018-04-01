class ChefiliciousCliGem::CLI < ChefiliciousCliGem::Meal_Kits
  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url, :meal_kits, :meal_type, :cuisine, :food_category, :mealkit, :rating

  def initialize
    @name = name
    @price = price
    @skill_level = skill_level
    @cooking_time = cooking_time
    @allergen = allergen
    @url = url
    @mealkit = mealkit
  end

  def call
    ChefiliciousCliGem::Meal_Kits.scrape_all
    puts ""
    puts "Welcome to the Chefilicious!"
    puts "A place where your culinary experience comes to life!"
      start
      main_menu
    end

    def start
      puts ""
      puts "Please press any key to get started"
      puts ""
      input = gets.strip
    end

    def main_menu
      puts "What would you like more informaiton on?"
      puts "
            1. Meal Kits
            2. Our celebrity Chefs
            3. Exit"
      input = gets.strip.downcase

      case input
        when "1"
          display_meal_kits
        when "2"
          display_chefs
        when "3"
          exit
        else
          puts "Please make a valid selection"
        end
      end

      def display_meal_kits
        puts ""
        puts "-------------- Let's Revolutionize Your Dinner Routine! ----------------"
        puts ""
      #binding.pry
        @@all.each do|meal|meal.name == mealkit.name
        #  mealkit.cooking_time = cooking_time
        #  mealkit.skill_level = skill_level
        #  mealkit.cuisine = cuisine
        #  mealkit.price = price
        puts " #{mealkit.name} - #{mealkit.cooking_time} - #{mealkit.skill_level} - #{mealkit.cuisine} - #{mealkit.price}"
        puts "please select a Meal Kit:"
        puts ""
        input = gets.strip
        display_meal_kit_description
        good bye
       end
     end

       def display_meal_kit_description(mealkit)
         puts ""
         puts "----------- #{mealkit.name} - #{mealkit.skill_level} -----------"
         puts ""
         puts "Chef:              #{mealkit_chef.chefname}"
         puts "Cuisine:           #{mealkit.cuisine}"
         puts "Food Category:     #{mealkit.food_category}"
         puts "Allergen:          #{mealkit.allergen}"
         puts "Cooking time:      #{mealkit.cooking_time}"
         puts "Price:             #{mealkit.price}"
         puts "Website:           #{mealkit.url}"
         puts ""
         puts "---------------Description--------------"
         puts ""
         puts "#{mealkit.description}"
         puts ""
         good_bye
     end

    def display_chefs(chefd)

     puts ""
     puts "---------- Our Famous Chefs ----------"
     puts ""
     @chefs.each with_index do |meal_kit_chef, index|    #ChefiliciousCliGem::Meal_Kits.each.with_index(from_number) do |mealkit_chef, index|
        puts "#{index}. #{mealkit_chef.chefname} - {mealkit_chef.knowfor}"
        puts ""
        puts ""
        input = gets.strip
        display_chef_bio
      end
    end

    def display_chef_bio

      puts ""
      puts ""
      puts "---------------About #{mealkit_chef.chefname}--------------"
      puts ""
      puts "#{mealkit_chef.description}"
      puts ""
      good_bye
    end

     def good_bye
      puts ""
      puts "Would you like to see another meal_kit?  Enter Y or N"
      input = gets.strip.downcase
      if input == "y"
        start
      else
        puts ""
        puts " Thank You! Have a wonderful day!"
        exit
      end
    end

end
