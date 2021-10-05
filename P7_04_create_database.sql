-- MySQL Script generated by MySQL Workbench
-- Mon Sep 20 10:42:21 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema OCPizzadb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema OCPizzadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OCPizzadb` DEFAULT CHARACTER SET utf8 ;
USE `OCPizzadb` ;

-- -----------------------------------------------------
-- Table `OCPizzadb`.`Pizzeria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Pizzeria` (
  `pizzeria_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `shortDescription` VARCHAR(100) NOT NULL,
  `imageName` VARCHAR(45) NULL,
  `Employee_employee_id` INT NOT NULL,
  PRIMARY KEY (`pizzeria_id`, `Employee_employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Order` (
  `order_id` INT NOT NULL,
  `order_number` INT NULL,
  `date` DATETIME NULL,
  `amount` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `is_paid` TINYINT NULL,
  `withdrawal` VARCHAR(45) NULL,
  `Pizzeria_pizzeria_id` INT NOT NULL,
  `Pizzeria_Employee_employee_id` INT NOT NULL,
  `Pizzeria_pizzeria_id1` INT NOT NULL,
  `Pizzeria_Employee_employee_id1` INT NOT NULL,
  PRIMARY KEY (`order_id`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`),
  INDEX `fk_Order_Pizzeria1_idx` (`Pizzeria_pizzeria_id1` ASC, `Pizzeria_Employee_employee_id1` ASC) ,
  CONSTRAINT `fk_Order_Pizzeria1`
    FOREIGN KEY (`Pizzeria_pizzeria_id1` , `Pizzeria_Employee_employee_id1`)
    REFERENCES `OCPizzadb`.`Pizzeria` (`pizzeria_id` , `Employee_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Customer` (
  `customer_id` INT NOT NULL,
  `account_number` VARCHAR(100) NULL,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `birthday` DATETIME NULL,
  `email` VARCHAR(100) NULL,
  `login` VARCHAR(100) NULL,
  `password` VARCHAR(100) NULL,
  `token` VARCHAR(100) NULL,
  `Address_address_id` INT NOT NULL,
  `Order_order_id` INT NOT NULL,
  `Order_Pizzeria_pizzeria_id` INT NOT NULL,
  `Order_Pizzeria_Employee_employee_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_Customer_Address_idx` (`Address_address_id` ASC) ,
  INDEX `fk_Customer_Order1_idx` (`Order_order_id` ASC, `Order_Pizzeria_pizzeria_id` ASC, `Order_Pizzeria_Employee_employee_id` ASC) ,
  CONSTRAINT `fk_Customer_Address`
    FOREIGN KEY (`Address_address_id`)
    REFERENCES `OCPizzadb`.`Address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Order1`
    FOREIGN KEY (`Order_order_id` , `Order_Pizzeria_pizzeria_id` , `Order_Pizzeria_Employee_employee_id`)
    REFERENCES `OCPizzadb`.`Order` (`order_id` , `Pizzeria_pizzeria_id` , `Pizzeria_Employee_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(200) NOT NULL COMMENT '\n',
  `additional_information` VARCHAR(255) NULL,
  `postal_code` INT NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `phone_number` INT(20) NOT NULL,
  `latitude` FLOAT NULL,
  `longitude` FLOAT NULL,
  `is_default_address` TINYINT NULL,
  `Pizzeria_pizzeria_id` INT NOT NULL,
  `Pizzeria_Employee_employee_id` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`address_id`),
  INDEX `fk_Address_Pizzeria1_idx` (`Pizzeria_pizzeria_id` ASC, `Pizzeria_Employee_employee_id` ASC) ,
  CONSTRAINT `fk_Address_Pizzeria1`
    FOREIGN KEY (`Pizzeria_pizzeria_id` , `Pizzeria_Employee_employee_id`)
    REFERENCES `OCPizzadb`.`Pizzeria` (`pizzeria_id` , `Employee_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Address_Customer`
    FOREIGN KEY (`Pizzeria_pizzeria_id`)
    REFERENCES `OCPizzadb`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Employee` (
  `employee_id` INT NOT NULL,
  `account_status` INT NULL,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `birthday` DATETIME NULL,
  `email` VARCHAR(100) NULL,
  `login` VARCHAR(100) NULL,
  `password` VARCHAR(100) NULL,
  `token` VARCHAR(100) NULL,
  `Pizzeria_pizzeria_id` INT NOT NULL,
  `Pizzeria_Employee_employee_id` INT NOT NULL,
  `Order_order_id` INT NOT NULL,
  `Order_Pizzeria_pizzeria_id` INT NOT NULL,
  `Order_Pizzeria_Employee_employee_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_Employee_Pizzeria1_idx` (`Pizzeria_pizzeria_id` ASC, `Pizzeria_Employee_employee_id` ASC) ,
  INDEX `fk_Employee_Order1_idx` (`Order_order_id` ASC, `Order_Pizzeria_pizzeria_id` ASC, `Order_Pizzeria_Employee_employee_id` ASC) ,
  CONSTRAINT `fk_Employee_Pizzeria1`
    FOREIGN KEY (`Pizzeria_pizzeria_id` , `Pizzeria_Employee_employee_id`)
    REFERENCES `OCPizzadb`.`Pizzeria` (`pizzeria_id` , `Employee_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Order1`
    FOREIGN KEY (`Order_order_id` , `Order_Pizzeria_pizzeria_id` , `Order_Pizzeria_Employee_employee_id`)
    REFERENCES `OCPizzadb`.`Order` (`order_id` , `Pizzeria_pizzeria_id` , `Pizzeria_Employee_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Role` (
  `role_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`EmployeeHasRole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`EmployeeHasRole` (
  `Employee_employee_id` INT NOT NULL,
  `Role_role_id` INT NOT NULL,
  PRIMARY KEY (`Employee_employee_id`, `Role_role_id`),
  INDEX `fk_EmployeeHasRole_Role1_idx` (`Role_role_id` ASC) ,
  CONSTRAINT `fk_EmployeeHasRole_Employee1`
    FOREIGN KEY (`Employee_employee_id`)
    REFERENCES `OCPizzadb`.`Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmployeeHasRole_Role1`
    FOREIGN KEY (`Role_role_id`)
    REFERENCES `OCPizzadb`.`Role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Invoice` (
  `invoice_id` INT NOT NULL,
  `invoice_number` INT NULL,
  `payment_date` DATETIME NULL,
  `payment_mode` VARCHAR(40) NULL,
  `Order_order_id` INT NULL,
  `Order_order_id1` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_Invoice_Order1_idx` (`Order_order_id1` ASC) ,
  CONSTRAINT `fk_Invoice_Order1`
    FOREIGN KEY (`Order_order_id1`)
    REFERENCES `OCPizzadb`.`Order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Menu` (
  `menu_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(255) NULL,
  `image_name` VARCHAR(45) NULL,
  `price` DECIMAL(10) NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`OrderHasMenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`OrderHasMenu` (
  `quantity` INT NULL,
  `Order_order_id` INT NOT NULL,
  `Order_Pizzeria_pizzeria_id` INT NOT NULL,
  `Order_Pizzeria_Employee_employee_id` INT NOT NULL,
  `Menu_menu_id` INT NOT NULL,
  PRIMARY KEY (`Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`, `Menu_menu_id`),
  INDEX `fk_OrderHasMenu_Menu1_idx` (`Menu_menu_id` ASC) ,
  CONSTRAINT `fk_OrderHasMenu_Order1`
    FOREIGN KEY (`Order_order_id` , `Order_Pizzeria_pizzeria_id` , `Order_Pizzeria_Employee_employee_id`)
    REFERENCES `OCPizzadb`.`Order` (`order_id` , `Pizzeria_pizzeria_id` , `Pizzeria_Employee_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderHasMenu_Menu1`
    FOREIGN KEY (`Menu_menu_id`)
    REFERENCES `OCPizzadb`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Item` (
  `Item_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(255) NULL,
  `image_name` VARCHAR(45) NULL,
  `price` DECIMAL(10) NULL,
  PRIMARY KEY (`Item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`MenuHasItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`MenuHasItem` (
  `Menu_menu_id` INT NOT NULL,
  `Item_Item_id` INT NOT NULL,
  PRIMARY KEY (`Menu_menu_id`, `Item_Item_id`),
  INDEX `fk_MenuHasItem_Item1_idx` (`Item_Item_id` ASC) ,
  CONSTRAINT `fk_MenuHasItem_Menu1`
    FOREIGN KEY (`Menu_menu_id`)
    REFERENCES `OCPizzadb`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MenuHasItem_Item1`
    FOREIGN KEY (`Item_Item_id`)
    REFERENCES `OCPizzadb`.`Item` (`Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`OrderHasItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`OrderHasItem` (
  `Item_Item_id` INT NOT NULL,
  `Order_order_id` INT NOT NULL,
  `Order_Pizzeria_pizzeria_id` INT NOT NULL,
  `Order_Pizzeria_Employee_employee_id` INT NOT NULL,
  PRIMARY KEY (`Item_Item_id`, `Order_order_id`, `Order_Pizzeria_pizzeria_id`, `Order_Pizzeria_Employee_employee_id`),
  INDEX `fk_OrderHasItem_Order1_idx` (`Order_order_id` ASC, `Order_Pizzeria_pizzeria_id` ASC, `Order_Pizzeria_Employee_employee_id` ASC) ,
  CONSTRAINT `fk_OrderHasItem_Item1`
    FOREIGN KEY (`Item_Item_id`)
    REFERENCES `OCPizzadb`.`Item` (`Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderHasItem_Order1`
    FOREIGN KEY (`Order_order_id` , `Order_Pizzeria_pizzeria_id` , `Order_Pizzeria_Employee_employee_id`)
    REFERENCES `OCPizzadb`.`Order` (`order_id` , `Pizzeria_pizzeria_id` , `Pizzeria_Employee_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Recipe` (
  `description` VARCHAR(100) NOT NULL,
  `preparation_time_in_seconds` INT NULL,
  `Item_Item_id` INT NOT NULL,
  PRIMARY KEY (`Item_Item_id`),
  CONSTRAINT `fk_Recipe_Item1`
    FOREIGN KEY (`Item_Item_id`)
    REFERENCES `OCPizzadb`.`Item` (`Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Ingredient` (
  `ingredient_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(255) NULL,
  `price` DECIMAL(10) NULL,
  PRIMARY KEY (`ingredient_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`RecipeHasIngredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`RecipeHasIngredient` (
  `quantity` INT NULL,
  `Recipe_Item_Item_id` INT NOT NULL,
  `Ingredient_ingredient_id` INT NOT NULL,
  PRIMARY KEY (`Recipe_Item_Item_id`, `Ingredient_ingredient_id`),
  INDEX `fk_RecipeHasIngredient_Ingredient1_idx` (`Ingredient_ingredient_id` ASC) ,
  CONSTRAINT `fk_RecipeHasIngredient_Recipe1`
    FOREIGN KEY (`Recipe_Item_Item_id`)
    REFERENCES `OCPizzadb`.`Recipe` (`Item_Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RecipeHasIngredient_Ingredient1`
    FOREIGN KEY (`Ingredient_ingredient_id`)
    REFERENCES `OCPizzadb`.`Ingredient` (`ingredient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Note` (
  `item_id` INT NULL,
  `description` VARCHAR(200) NULL,
  `Item_Item_id` INT NOT NULL,
  INDEX `fk_Note_Item1_idx` (`Item_Item_id` ASC) ,
  CONSTRAINT `fk_Note_Item1`
    FOREIGN KEY (`Item_Item_id`)
    REFERENCES `OCPizzadb`.`Item` (`Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(255) NULL,
  `image_name` VARCHAR(45) NULL,
  `parent_category_id` INT NULL,
  `Category_category_id` INT NOT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `fk_Category_Category1_idx` (`Category_category_id` ASC) ,
  CONSTRAINT `fk_Category_Category1`
    FOREIGN KEY (`Category_category_id`)
    REFERENCES `OCPizzadb`.`Category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`CategoryHasItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`CategoryHasItem` (
  `Item_Item_id` INT NOT NULL,
  `Category_category_id` INT NOT NULL,
  PRIMARY KEY (`Item_Item_id`, `Category_category_id`),
  INDEX `fk_CategoryHasItem_Category1_idx` (`Category_category_id` ASC) ,
  CONSTRAINT `fk_CategoryHasItem_Item1`
    FOREIGN KEY (`Item_Item_id`)
    REFERENCES `OCPizzadb`.`Item` (`Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CategoryHasItem_Category1`
    FOREIGN KEY (`Category_category_id`)
    REFERENCES `OCPizzadb`.`Category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCPizzadb`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizzadb`.`Stock` (
  `quantity` INT NULL,
  `Ingredient_ingredient_id` INT NOT NULL,
  `Pizzeria_pizzeria_id` INT NOT NULL,
  `Pizzeria_Employee_employee_id` INT NOT NULL,
  PRIMARY KEY (`Ingredient_ingredient_id`, `Pizzeria_pizzeria_id`, `Pizzeria_Employee_employee_id`),
  INDEX `fk_Stock_Pizzeria1_idx` (`Pizzeria_pizzeria_id` ASC, `Pizzeria_Employee_employee_id` ASC) ,
  CONSTRAINT `fk_Stock_Ingredient1`
    FOREIGN KEY (`Ingredient_ingredient_id`)
    REFERENCES `OCPizzadb`.`Ingredient` (`ingredient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stock_Pizzeria1`
    FOREIGN KEY (`Pizzeria_pizzeria_id` , `Pizzeria_Employee_employee_id`)
    REFERENCES `OCPizzadb`.`Pizzeria` (`pizzeria_id` , `Employee_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

