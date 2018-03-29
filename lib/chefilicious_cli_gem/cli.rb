class ChefiliciousCliGem::CLI

  def call
    @meal_kits = ChefiliciousCliGem::Meal_Kits.scrape_all
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
          main_menu
        end
      end

      def display_meal_kits
        puts ""
        puts "-------------- Lets' Revolutionize Your Dinner Routine! ----------------"
        puts ""
        binding.pry
        ChefiliciousCliGem::Meal_Kits.each with_index(from_number-1, 10) do |mealkit, index|
        puts "#{index}. #{mealkit.name} - #{mealkit.cooking_time} - #{mealkit.skill_level} - #{mealkit.cuisine} - #{mealkit.price}"
        puts "please select a Meal Kit:"
        puts ""
        input = gets.strip
        display_meal_kit_description
        good bye
       end
     end

       def display_meal_kit_description(meal_kit)
         puts ""
         puts "----------- #{mealkit.name} - #{mealkit.skill_level} -----------"
         puts ""
         puts "Chef:              #{mealkit_chef.chefname}"
         puts "cuisine:           #{mealkit.cuisine}"
         puts "Food Category:     #{mealkit.food_category}"
         puts "allergen:          #{mealkit.allergen}"
         puts "cooking_time:      #{mealkit.cooking_time}"
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
