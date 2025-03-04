-- Create the table
CREATE TABLE pricing.menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    item_name VARCHAR(255),
    first INT,
    second INT,
    third INT
);

-- Insert the data
INSERT INTO pricing.menu (restaurant_name, item_name, first, second, third) VALUES
('Master Don', 'Japanese Style Beef curry rice with scrambled egg', 262, 298, 358),
('Master Don', 'Japanese Style Chicken curry rice with scrambled egg', 225, 258, 288),
('Master Don', 'Japanese Style Beef and chicken curry rice', 274, 298, 358),
('Master Don', 'japanese chicken karaage curry rice', 226, 249, 288),
('Master Don', 'Chicken Karaage Curry Rice', 248, 248, 288),
('Master Don', 'japanese gyudon curry rice', 268, 268, 348),
('Master Don', 'Beef Curry Rice', 298, 298, 358),
('Master Don', 'Tonkotsu Curry', 288, 288, 328),
('Master Don', 'japanese tonkatsu curry rice', 288, 288, 328),
('Master Don', 'Spring onion pork rice topping', 189, 198, 198),
('Master Don', 'Beef curry rice with drink', 322, 358, 358),
('Master Don', 'Chicken curry rice with drink', 286, 328, 328),
('Master Don', 'Curry Udon with drink', 286, 298, 298),
('Master Don', 'Beef curry rice with karaage and drink', 394, 483, 483),
('Master Don', 'Chicken curry rice with karaage and drink', 369, 448, 448),
('Master Don', 'Curry Udon with karaage and drink', 358, 418, 418),
('Master Don', 'tonkotsu ramen with karaage', 382, 428, 428),
('Master Don', 'Tantanmen Ramen with karaage', 406, 448, 448),
('Master Don', 'Miso Ramen with karaage', 382, 428, 428),
('Master Don', 'Shoyu Ramen with karaage', 382, 428, 428),
('Master Don', 'Pan Seared Gyoza', 180, 198, 198),
('Master Don', 'Gyoza', 180, 198, 198),
('Master Don', 'Fried Gyoza', 180, 198, 198),
('Master Don', 'Soda', 60, 85, 85),
('Master Don', 'Regular Coke (in Can)', 60, 85, 85),
('Master Don', 'Sprite (in Can)', 60, 85, 85),
('Master Don', 'Royal (in Can)', 60, 85, 85),
('Master Don', 'Coke Zero (in Can)', 60, 85, 85),
('Master Don', 'Sprite No Sugar (in Can)', 60, 85, 85),
('InLuck/Masterdon', 'Stewed Pork Platter (good for 4 to 5)', 500, 518, 598),
('Master Don', 'Gyoza Platter (good for 4 to 5)', 500, 518, 528),
('Master Don', 'Karaage Platter (good for 4 to 5)', 500, 518, 528),
('Master Don', 'Chicken Chops Platter (good for 4 to 5)', 550, 578, 578),
('Master Don', 'Korokke Platter (good for 4 to 5)', 250, 258, 268),
('InLuck/Masterdon', 'Beef Misono Platter (good for 4 to 5)', 700, 728, 790),
('Master Don', 'Japanese Rice with Quinoa', 55, 58, 58),
('Master Don', 'Gyudon (Japanese Beef Rice Bowl)', 250, 250, 288),
('Master Don', 'Chicken Katsudon', 298, 298, 308),
('Master Don', 'Chicken Katsu', 278, 278, 298),
('Master Don', 'Katsudon', 290, 290, 318),
('Master Don', 'Korokke Curry Rice', 208, 208, 238),
('Master Don', 'Tonkatsu', 270, 270, 298),
('Master Don', 'Korokke', 170, 170, 178),
('Master Don', 'Miso Soup', 55, 55, 58),
('Master Don', 'Soy-Marinated Egg', 68, 68, 78),
('Master Don', 'Japanese Slaw', 68, 68, 78),
('Master Don', 'Beef Curry Rice', 298, 298, 358),
('InLuck', 'Mild Spicy Minced Pork on Rice with Quinoa', 166, 178, 188),
('InLuck', 'Fried Chicken Fillet on Rice with Quinoa', 216, 228, 278),
('InLuck', 'Stewed Pork and Peanuts on Rice with Quinoa', 225, 238, 258),
('InLuck', 'Shredded Chicken on Rice with Quinoa', 178, 188, 188),
('InLuck', 'Spicy chicken karaage on rice', 225, 238, 248),
('InLuck', 'Dry Noodles with Chicken and Sesame Vinegar Sauce', 199, 208, 208),
('InLuck', 'Traditional Dry Noodles', 189, 198, 198),
('InLuck', 'Spicy Traditional Dry Noodles', 199, 208, 208),
('InLuck', 'Mild Spicy Minced Pork on Rice with Drink', 225, 238, 238),
('InLuck', 'Lu Rou Fan (Traditional Taiwanese Pork Rice)', 225, 238, 248),
('InLuck', 'Stewed Pork on Rice with Drink', 248, 308, 308),
('InLuck', 'Fried Chicken Fillet on Rice with Drink', 275, 298, 298),
('InLuck', 'Spicy Karaage on Rice with Drink', 286, 308, 308),
('InLuck', 'Traditional Dry Noodle with Drink', 248, 278, 278),
('InLuck', 'Traditional Dry Noodle with Karaage and Drink', 345, 378, 378),
('InLuck', 'Taiwanese Popcorn Chicken', 130, 138, 138),
('InLuck', 'Gyoza Platter (good for 4 to 5)', 500, 518, 518),
('InLuck', 'Karaage Platter (good for 4 to 5)', 500, 518, 518),
('InLuck', 'Yangnyeom Chicken Platter (good for 4 to 5)', 500, 518, 518),
('InLuck', 'Taiwanese Chicken Platter (good for 4 to 5)', 550, 578, 578),
('InLuck', 'Potato Croquette Platter (good for 4 to 5)', 250, 258, 258),
('InLuck', 'Japanese Rice with Quinoa', 55, 58, 58),
('InLuck', 'Chicken noodle soup with mushroom and goji berry', 199, 199, 218),
('InLuck', 'Taiwanese Fried Chicken (100g)', 149, 149, 160),
('InLuck', 'Chow Mein', 135, 135, 138),
('InLuck', 'Bokchoy with Garlic Sauce', 58, 58, 78),
('InLuck', 'Beef Noodle Soup', 318, 318, 368);