/* Question */
/* 
You’re a consultant for a major pizza chain that will be running a promotion where all 3-topping pizzas will be sold for a fixed price, 
and are trying to understand the costs involved.

Given a list of pizza toppings, consider all the possible 3-topping pizzas, 
and print out the total cost of those 3 toppings. 
Sort the results with the highest total cost on the top followed by pizza toppings in ascending order.

Break ties by listing the ingredients in alphabetical order, 
starting from the first ingredient, followed by the second and third.

P.S. Be careful with the spacing (or lack of) between each ingredient. 
Refer to our Example Output.

Notes:
    Do not display pizzas where a topping is repeated. For example, ‘Pepperoni,Pepperoni,Onion Pizza’.
    Ingredients must be listed in alphabetical order. For example, 'Chicken,Onions,Sausage'. 'Onion,Sausage,Chicken' is not acceptable.

Table: pizza_toppings

topping_name:	    varchar(255)
ingredient_cost:	decimal(10,2)

Example Output:
pizza	                        total_cost
Chicken,Pepperoni,Sausage	    1.75
Chicken,Extra Cheese,Sausage	1.65
Extra Cheese,Pepperoni,Sausage	1.60
Chicken,Extra Cheese,Pepperoni	1.45

*/

-- Solution

SELECT 
    CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
    p1.ingredient_cost+p2.ingredient_cost+p3.ingredient_cost AS total_cost
FROM pizza_toppings AS p1 INNER JOIN pizza_toppings AS p2
ON p1.topping_name < p2.topping_name
INNER JOIN pizza_toppings AS p3
ON p2.topping_name < p3.topping_name
ORDER BY total_cost DESC, pizza