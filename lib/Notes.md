Chefilicious

A command line interface for a non-subscription meal kit company (such as Chef D, Fresh Direct, Chefday...etc), which allow the consumer to see the meal kit information in one website.

* The application will scrape the information from various company websites and allow the consumer to see product information and make a selection.

* The application will collect the following information:
Food, Price, Allergens, Serving_Size, Skill, cooking_time

* Type of Meal:
Breakfast, Lunch, Dinner, Dessert, Date Night

* Cooking Time:
< 10 Minutes, 10 - 20 Minutes, 20 - 45 Minutes, 45 -  60 minutes, >60 Minutes

* Allergens:
Shellfish, Dairy, Egg, Fish, Peanut, Soy, Tree Nut, Wheat

* Cuisine:
American, Asian(Chinese, Korean, Japanese, Thai, Vietnamese), Latin(Mexican, Spanish), Mediterranean, Indian, Greek, French, Italian, Middle Eastern, South and All Cuisine

*  Food Categories:
Meat (Beef, Chicken, Lamb, Pork), Fish, Poultry, Vegetable, Grains/Pasta, Sweets and Special Dietary Needs

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
