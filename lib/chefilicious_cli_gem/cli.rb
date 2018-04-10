class ChefiliciousCliGem::CLI < ChefiliciousCliGem::Meal_Kits

  def call
    ChefiliciousCliGem::Meal_Kits.scrape_all
    Chefs.scrape_all_chefs
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
            2. Our celebrity Chefs
            3. Exit"

      input = gets.strip.downcase

      case input
        when "1"
          display_meal_kits(meal_kits)
          puts "please select a Meal Kit:"
          input = gets.strip

          mealkit = ChefiliciousCliGem::Meal_Kits.find_by_mealkit(input.to_i)
            puts ""
              display_mealkit_description(mealkit)
                puts ""
                  good_bye

        when "2"
          display_chefs(input)
            puts ""
              puts "please select a chef:"
                input = gets.strip
                  mealkit_chef = Chefs.find_by_chef(input.to_i)
                    display_chef_bio
                      puts ""
                        good_bye

        when "3"
          exit

        else
          puts "Please make a valid selection"
        end
        main_menu
      end

      def display_meal_kits(meal_kits)
        puts ""
        puts "---------------------- Discover Your Options! ---------------------------------"
        puts ""
        puts "          Name                           Time    Level   Cuisine     Price"
        puts "--------------------------------------------------------------------------------"

        counter = 1
            @@all.each do |mealkit|
              mealkit.name == mealkit
                puts "#{counter} - #{mealkit.name} - #{mealkit.cooking_time} - #{mealkit.skill_level} - #{mealkit.cuisine} - #{mealkit.price}"
                  until counter == 100
                    counter += 1
                    break
            end
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
        #puts "Chef:              #{chef.name}"
        puts "Skill Level:       #{mealkit.skill_level}"
        puts "Food Category:     #{mealkit.food_category}"
        puts "Allergen:          #{mealkit.allergen}"
        puts "Cooking Time:      #{mealkit.cooking_time}"
        puts "Price:             #{mealkit.price}"
        puts "Website:           #{mealkit.url}"
        puts ""
        puts "------------------------------  Description  ------------------------------"
        puts ""
      # puts "#{mealkit.description}"
        puts ""
       good_bye
     end


    def display_chefs(chefs)
     puts ""
     puts "------------------- Our Famous Chefs ---------------------"
     puts ""

     counter = 1
     @@all_chefs.each do|famous_chef|
       famous_chef == chef.name
         until counter == 101
         puts "#{counter} - #{chef.name} - {chef.knowfor}"
         counter +=1
         puts ""
         puts ""
         input.to_i = gets.strip
         display_chef_bio
       end
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
      puts "Would you like to see more information?  Enter Y or N"
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
