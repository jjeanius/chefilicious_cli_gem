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
        puts "          Name                           Time    Level   Cuisine     Price"
        @@all.collect do|mealkit|
        counter = 1
          until counter == 101
          puts "#{counter} - #{mealkit.name} - #{mealkit.cooking_time} - #{mealkit.skill_level} - #{mealkit.cuisine} - #{mealkit.price}"
          counter +=1
        end

        puts "please select a Meal Kit:"
        input = gets.strip

         puts ""
         puts "----------- #{mealkit.name} - #{mealkit.cuisine} Cuisine -----------"
         puts ""
         #puts "Chef:              #{chef.name}"
         puts "Skill Level:       #{mealkit.skill_level}"
         puts "Food Category:     #{mealkit.food_category}"
         puts "Allergen:          #{mealkit.allergen}"
         puts "Cooking Time:      #{mealkit.cooking_time}"
         puts "Price:             #{mealkit.price}"
         puts "Website:           #{mealkit.url}"
         puts ""
         puts "---------------------------  Description  -----------------------------"
         puts ""
        # puts "#{mealkit.description}"
         puts ""
         good_bye

     end
   end

    def display_chefs(chefs)
     puts ""
     puts "------------------- Our Famous Chefs ---------------------"
     puts ""
     @@all.each do|famous_chef|
       famous_chef == chef.name
       counter = 1
         until counter == 101
         puts "#{counter} - #{chef.name} - {chef.knowfor}"
         counter +=1
         puts ""
         puts ""
         input = gets.strip
         display_chef_bio
      end
    end

    def display_chef_bio
      puts ""
      puts ""
      puts "---------------About #{chef.name}--------------"
      puts ""
      puts "#{chef.description}"
      puts ""
      good_bye
    end

     def good_bye
      puts ""
      puts "Would you like to see another meal_kit?  Enter Y or N"
      input = gets.strip.downcase
      if input == "y"
        main_menu
      else
        puts ""
        puts "Thank You! Have a wonderful day!"
        exit
      end
    end

end
