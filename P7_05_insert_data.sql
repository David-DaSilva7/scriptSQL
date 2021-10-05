
-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Pizzeria`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Pizzeria` (`pizzeria_id`, `name`, `description`, `shortDescription`, `imageName`, `Employee_employee_id`) VALUES (0, 'OC Pizza Hagondange ', 'Pizzeria au centre d\'hagondange qui livre sur un rayon de 10km', 'Pizzeria Hagondange', 'pizzeriaHagondange.png', 0);
INSERT INTO `OCPizzadb`.`Pizzeria` (`pizzeria_id`, `name`, `description`, `shortDescription`, `imageName`, `Employee_employee_id`) VALUES (1, 'OC Pizza Trémery', 'Pizzeria au centre de Trémery avec parking ', 'Pizzeria Tremery', 'pizzeriaTremery.png', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Order`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Order` (`order_id`, `order_number`, `date`, `amount`, `state`, `is_paid`, `withdrawal`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`, `Pizzeria_pizzeria_id1`, `Pizzeria_Employee_employee_id1`) VALUES (0, 2027, '19/08/2021', '47,57€', 'France', NULL, 'carte bleue ', 0, 0, 1, 1);
INSERT INTO `OCPizzadb`.`Order` (`order_id`, `order_number`, `date`, `amount`, `state`, `is_paid`, `withdrawal`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`, `Pizzeria_pizzeria_id1`, `Pizzeria_Employee_employee_id1`) VALUES (1, 3072, '19/08/2021', '27,50€', 'France', NULL, 'carte bleue ', 1, 0, 0, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Customer` (`customer_id`, `account_number`, `first_name`, `last_name`, `birthday`, `email`, `login`, `password`, `token`, `Address_address_id`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`) VALUES (0, '396572', 'David', 'DA SILVA ', '24/05/1999', 'davidfctt@gmail.com', 'David.DS', 'dasilva57', NULL, 0, 1, 0, 0);
INSERT INTO `OCPizzadb`.`Customer` (`customer_id`, `account_number`, `first_name`, `last_name`, `birthday`, `email`, `login`, `password`, `token`, `Address_address_id`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`) VALUES (1, '560976', 'Hugo ', 'LAMM', '23/12/1999', 'hugox57@gmail.com', 'Hugox57', 'lamm57525', NULL, 1, 0, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Address`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Address` (`address_id`, `address`, `additional_information`, `postal_code`, `city`, `phone_number`, `latitude`, `longitude`, `is_default_address`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`) VALUES (0, '5 rue Jacques Brel', NULL, 57300, 'Mondelange ', 0678899076, NULL, NULL, NULL, 0, 1);
INSERT INTO `OCPizzadb`.`Address` (`address_id`, `address`, `additional_information`, `postal_code`, `city`, `phone_number`, `latitude`, `longitude`, `is_default_address`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`) VALUES (1, '17 rue victor hugo ', NULL, 57525, 'Talange', 0680267821, NULL, NULL, NULL, 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Employee` (`employee_id`, `account_status`, `first_name`, `last_name`, `birthday`, `email`, `login`, `password`, `token`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`) VALUES (0, Pizzaiolo, 'Pierre ', 'PORTANOVA', '17/11/1996', 'pierre.portanova@gmail.com', 'PierreFCT', 'pierrotfct', NULL, 1, 0, 0, 1, 0);
INSERT INTO `OCPizzadb`.`Employee` (`employee_id`, `account_status`, `first_name`, `last_name`, `birthday`, `email`, `login`, `password`, `token`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`) VALUES (1, Pizzaiolo, 'Eric', 'DA SILVA', '18/01/1996', 'eric-ast@gmail.com', 'EricCr7', 'madrid57', NULL, 0, 1, 1, 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Role`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Role` (`role_id`, `name`) VALUES (0, 'Pizzaiolo');
INSERT INTO `OCPizzadb`.`Role` (`role_id`, `name`) VALUES (1, 'Pizzaiolo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`EmployeeHasRole`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`EmployeeHasRole` (`Employee_employee_id`, `Role_role_id`) VALUES (0, 1);
INSERT INTO `OCPizzadb`.`EmployeeHasRole` (`Employee_employee_id`, `Role_role_id`) VALUES (1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Invoice`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Invoice` (`invoice_id`, `invoice_number`, `payment_date`, `payment_mode`, `Order_order_id`, `Order_order_id1`) VALUES (0, 1756, '19/08/2021', 'carte bleue ', 0, 1);
INSERT INTO `OCPizzadb`.`Invoice` (`invoice_id`, `invoice_number`, `payment_date`, `payment_mode`, `Order_order_id`, `Order_order_id1`) VALUES (1, 3198, '19/08/2021', 'carte bleue ', 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Menu`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Menu` (`menu_id`, `name`, `description`, `image_name`, `price`) VALUES (0, 'Bambino ', 'Une pizza 10cm, une boisson, un tiramisu nutella ', 'bambino.png', 6€);
INSERT INTO `OCPizzadb`.`Menu` (`menu_id`, `name`, `description`, `image_name`, `price`) VALUES (1, 'Classique ', 'Une pizza 33cm, une boisson, un tiramisu ', 'classique.png', 13€);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`OrderHasMenu`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`OrderHasMenu` (`quantity`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`, `Menu_menu_id`) VALUES (4, 0, 1, 0, 0);
INSERT INTO `OCPizzadb`.`OrderHasMenu` (`quantity`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`, `Menu_menu_id`) VALUES (3, 1, 0, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Item`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Item` (`Item_id`, `name`, `description`, `image_name`, `price`) VALUES (0, 'Reine ', 'base tomate, jambon, champignon, mozzarella', 'reine.png', 9,50€);
INSERT INTO `OCPizzadb`.`Item` (`Item_id`, `name`, `description`, `image_name`, `price`) VALUES (1, 'Marguerita ', 'base tomate, mozzarella ', 'marguerita.png', 8,50€);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`MenuHasItem`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`MenuHasItem` (`Menu_menu_id`, `Item_Item_id`) VALUES (1, 0);
INSERT INTO `OCPizzadb`.`MenuHasItem` (`Menu_menu_id`, `Item_Item_id`) VALUES (0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`OrderHasItem`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`OrderHasItem` (`Item_Item_id`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`) VALUES (0, 1, 1, 1);
INSERT INTO `OCPizzadb`.`OrderHasItem` (`Item_Item_id`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`) VALUES (1, 0, 0, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Recipe` (`description`, `preparation_time_in_seconds`, `Item_Item_id`) VALUES ('base tomate, champignon, jambon, mozzarella ', 240, 1);
INSERT INTO `OCPizzadb`.`Recipe` (`description`, `preparation_time_in_seconds`, `Item_Item_id`) VALUES ('base tomate, mozzarella', 200, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Ingredient` (`ingredient_id`, `name`, `description`, `price`) VALUES (0, 'champignon', 'champignon Paris', 1€);
INSERT INTO `OCPizzadb`.`Ingredient` (`ingredient_id`, `name`, `description`, `price`) VALUES (1, 'mozzarella', 'mozzarella di bufala', 2€);
INSERT INTO `OCPizzadb`.`Ingredient` (`ingredient_id`, `name`, `description`, `price`) VALUES (2, 'tomate', 'tomate d\'italie', 0,80€);
INSERT INTO `OCPizzadb`.`Ingredient` (`ingredient_id`, `name`, `description`, `price`) VALUES (3, 'jambon', 'jambon italien', 2,40€);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`RecipeHasIngredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`RecipeHasIngredient` (`quantity`, `Recipe_Item_Item_id`, `Ingredient_ingredient_id`) VALUES (4, 0, 1);
INSERT INTO `OCPizzadb`.`RecipeHasIngredient` (`quantity`, `Recipe_Item_Item_id`, `Ingredient_ingredient_id`) VALUES (5, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Note`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Note` (`item_id`, `description`, `Item_Item_id`) VALUES (0, 'sans champignon ', 0);
INSERT INTO `OCPizzadb`.`Note` (`item_id`, `description`, `Item_Item_id`) VALUES (1, 'base crème', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Category`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Category` (`category_id`, `name`, `description`, `image_name`, `parent_category_id`, `Category_category_id`) VALUES (0, 'Pizza', 'base tomate ou base crème ', 'pizza.png', 0, 1);
INSERT INTO `OCPizzadb`.`Category` (`category_id`, `name`, `description`, `image_name`, `parent_category_id`, `Category_category_id`) VALUES (1, 'Dessert', 'tiramisu, fruits ', 'dessert.png', 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`CategoryHasItem`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`CategoryHasItem` (`Item_Item_id`, `Category_category_id`) VALUES (2, 1);
INSERT INTO `OCPizzadb`.`CategoryHasItem` (`Item_Item_id`, `Category_category_id`) VALUES (0, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OCPizzadb`.`Stock`
-- -----------------------------------------------------
START TRANSACTION;
USE `OCPizzadb`;
INSERT INTO `OCPizzadb`.`Stock` (`quantity`, `Ingredient_ingredient_id`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`) VALUES (4, 1, 4, 2);
INSERT INTO `OCPizzadb`.`Stock` (`quantity`, `Ingredient_ingredient_id`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`) VALUES (5, 0, 2, 4);

COMMIT;

