class ChefiliciousCliGem::CLI


  def call
    ChefiliciousCliGem::Meal_Kits.scrape_all
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
      puts "What would you like more information on?"
      puts "
            1. Meal Kits
            2. Exit"

      input = gets.strip.downcase

      case input
        when "1"
          display_meal_kits
          puts "please select a Meal Kit:"
          input = gets.strip

          mealkit = ChefiliciousCliGem::Meal_Kits.find_by_mealkit(input.to_i)
            puts ""
              display_mealkit_description(mealkit)
                puts ""
                  good_bye
        when "2"
          puts "Thank You! Have a wonderful day!"
          puts ""
          exit

        else
          puts "Please make a valid selection"
        end
        main_menu
      end

      def display_meal_kits
        puts ""
        puts "---------------------- Discover Your Options! ---------------------------------"
        puts ""
        puts "          Name                           Time    Level   Cuisine     Price"
        puts "--------------------------------------------------------------------------------"

        counter = 1
           ChefiliciousCliGem::Meal_Kits.all.each do |mealkit|
              mealkit.name == mealkit
                puts "#{counter} - #{mealkit.name} - #{mealkit.cooking_time} - #{mealkit.skill_level} - #{mealkit.cuisine} - #{mealkit.price}"
                  until counter == 51
                    counter += 1
                    break
            end
          end


      def display_mealkit_description(mealkit)

        puts ""
        puts ""
        puts ""
        puts "#{mealkit.name}"
        puts ""
        puts "----------- #{mealkit.name} - #{mealkit.cuisine} Cuisine -----------"
        puts ""
        puts "Skill Level:       #{mealkit.skill_level}"
        puts "Food Category:     #{mealkit.food_category}"
        puts "Allergen:          #{mealkit.allergen}"
        puts "Cooking Time:      #{mealkit.cooking_time}"
        puts "Price:             #{mealkit.price}"
        puts "Website:           #{mealkit.url}"
        puts ""
        puts "------------------------------------------------------------"
        puts ""
        puts ""
       good_bye
     end
   end

     def good_bye
      puts ""
      puts "Would you like to see more information?  Enter Y or N"
      input = gets.strip.downcase
      if input == "y"
        main_menu
      else
        puts ""
        puts "Thank You! Have a wonderful day!"
        puts ""
        exit
      end
    end

end
