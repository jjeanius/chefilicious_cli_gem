Chefilicious

A command line interface that list 50 top meal kits from a non-subscription company (such as Chef D, Fresh Direct, Chefday...etc).  

The application will allow the user to see the following information:

* A list of 50 meal kits information and allow the user to make a product selection for each meal kit.

* The application will scrape the information from a company website and it will have a link to connect the user to the website.

* The application will also provide a list of chefs and the user can select each chef for more

* "Order Now" button will link to the company's websites for the specific dishes


Websites:

1) Chef'd     URL:  https://www.chefd.com/collections/all?sort_by=best-selling

2) Fresh Direct
     URL:  https://www.freshdirect.com/srch.jsp?pageType=search&searchParams=meal+kits&pageSize=30&all=false&activePage=0&sortBy=Sort_Relevancy&orderAsc=true&activeTab=product&departmentFilterGroup=clearall&brandFilterGroup=clearall

3) Chefday
     URL:  http://www.chefday.com/recipes


CLI:

* Main Menu - Greet the user
* Welcome to the Chefilicious!
* What are you looking for:  (list Type of Meal, Cooking Time, Allergens)
* User makes selections on meal type, cooking time, allergens
* What do you like to eat?   (list of Cuisine and food categories)
* User makes selections on the cuisine and meal Category
* The application will shows a list of meal kits (in column format) from all 3 companies with price, cooking time, and rating
* User can select the dish and it will provide more information about the dish
* There will be an "Order Now" button and it will let the user know that he/she is leaving the Chefilicious website, and he/she will be connected to the company's website

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
