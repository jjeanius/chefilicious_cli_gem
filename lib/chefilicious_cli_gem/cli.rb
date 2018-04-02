class ChefiliciousCliGem::CLI < ChefiliciousCliGem::Meal_Kits
  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url, :meal_kits, :meal_type, :cuisine, :food_category, :mealkit, :rating

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
          display_meal_kits(meal_kits)
          puts ""

          mealkit = ChefiliciousCliGem::Meal_Kits.find_by_mealkit(input.to_i)

          display_mealkit_description
          puts ""
          good_bye

        when "2"
          display_chefs(input)
          puts ""
          puts "please select a chef:"
          input = gets.strip

          mealkit = ChefiliciousCliGem::Meal_Kits.find_by_chef(input.to_i)

          display_chef_bio
          puts ""
          good_bye

        when "3"
          exit
        else
          puts "Please make a valid selection"
        end
      end

    #  def index
    #    counter = 1
    #    until counter == 100
    #      counter +=1
#
  #      end
  #    end

      def display_meal_kits(meal_kits)
        puts ""
        puts "-------------- Let's Revolutionize Your Dinner Routine! ----------------"
        puts ""
        @@all.each do|mealkit|
        counter = 1
          until counter == 100
          counter +=1
          puts "#{counter} - #{mealkit.name} - #{mealkit.cooking_time} - #{mealkit.skill_level} - #{mealkit.cuisine} - #{mealkit.price}"
          puts ""
        end

        puts "please select a Meal Kit:"
        input = gets.strip

        display_meal_kit_detail
       end
      end

       def display_meal_kit_detail
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
     ChefiliciousCliGem::Meal_Kits.each do|mealkit_chef|
        puts "#{index} - #{mealkit_chef.chefname} - {mealkit_chef.knowfor}"
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
