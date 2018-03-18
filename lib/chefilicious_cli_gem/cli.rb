class ChefiliciousCliGem::CLI

  def call
    puts "Welcome to the Chefilicious!"
    meal_type
    cooking_time
    allergen
    cuisine
    food_category
    list_selection
    #meal_kits
    #order_now
  end

  def list_selection
    @meal_kits = ChefiliciousCliGem::Meal_Kits.selection

  end

  def meal_type
    puts "What are you looking for?"
    puts "Please enter a number or type exit for exiting
          1. Breakfast
          2. Lunch
          3. Dinner
          4. Desert"
      input = gets.strip

      case input
        when "1"
          puts "Breakfast"
        when "2"
          puts "Lunch"
        when "3"
          puts "Dinner"
        when "4"
          puts "Yummy Desert!"
        when "exit"
          exit
        else "5"
          "Please enter a valid selection"
      end
    end

  def cooking_time
    puts "Please select your desire cooking time:"
    puts "type exit for exiting and p for Previous Menu
          1. Less than 20 minutes
          2. Between 21 to 45 minutes
          3. Between 45 to 60 minutes
          4. More than 60 Minutes"
    input = gets.strip

    case input
      when "1"
        puts "Less than 20 minutes"
      when "2"
        puts "Between 21 to 45 minutes"
      when "3"
        puts "Between 45 to 60 minutes"
      when "4"
        puts "More than 60 Minutes"
      when "exit"
        exit
      when "p"
        meal_type
        cooking_time
      else
        "Please enter a valid selection"
    end
  end

  def allergen
    puts "Are you allergic to any of the following ingredientes?"
    puts "type exit for exiting and p for Previous Menu
          1. Shellfish
          2. Dairy
          3. Egg
          4. Nuts
          5. Soy
          6. Wheat
          7. No Allergens"
    input = gets.strip

    case input
      when "1"
        puts "Shellfish"
      when "2"
        puts "Dairy"
      when "3"
        puts "Egg"
      when "4"
        puts "Nuts"
      when "5"
        puts "Soy"
      when "6"
        puts "Wheat"
      when "exit"
        exit
      when "p"
        cooking_time
        meal_type
        allergen
      else
        "Please enter a valid selection"
    end
  end

  def cuisine
    puts "Please select a cuisine:"
    puts "type exit for exiting and p for Previous Menu
          1. American
          2. Asian"  #(Chinese, Korean, Japanese, Thai, Vietnamese, Indian)
         "3. Latin"  #(Mexican)
         "4. Mediterranean" #(Greek, Spanish, French, Italian, Middle Eastern)"
    input = gets.strip

    case input
      when "1"
        puts "American"
      when "2"
        puts "Asian"
      when "3"
        puts "Latin"
      when "4"
        puts "Mediterranean"
      when "exit"
        exit
      when "p"
        allergen
        cooking_time
        meal_type
        cuisine
      else
        "Please enter a valid selection"
    end
  end

  def food_category
    puts "What do you like to cook?"
    puts "type exit for exiting and p for Previous Menu
          1. Meat (Beef, Chicken, Lamb, Pork)
          2. Seafood
          3. Poultry
          4. Vegetable
          5. Grains/Pasta
          6. Sweets"
    input = gets.strip

    case input
      when "1"
        puts "Meat"
      when "2"
        puts "Seafood"
      when "3"
        puts "Poultry"
      when "4"
        puts "Vegetable"
      when "5"
        puts "Grains/Pasta"
      when "6"
        puts "Sweets"
      when "exit"
        exit
      when "p"
        cuisine
        allergen
        cooking_time
        meal_type
        food_category
      else
        "Please enter a valid selection"

    end
  end
end

    #* What are you looking for:  (list Type of Meal, Cooking Time, Allergens)
    #* User makes selections on meal type, cooking time, allergens
    #* What do you like to eat?   (list of Cuisine and food categories)
    #* User makes selections on the cuisine and meal Category
    #* The application will shows a list of meal kits (in column format) from all companies with price, cooking time, and rating
    #* User can select the dish and it will provide more information about the dish
    #* There will be an "Order Now" button and it will let the user know that he/she is leaving the Chefilicious website, and he/she will be connected to the company's website
