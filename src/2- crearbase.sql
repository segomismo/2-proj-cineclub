
-- -----------------------------------------------------
-- Table `videoclub`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`store` (
  `store_id` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `zip` VARCHAR(15) NULL,
  `phone_number` VARCHAR(15) NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`staff` (
  `staff_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(15) NULL,
  `birth` DATETIME NULL,
  `hire_date` DATETIME NULL,
  `ssn` VARCHAR(20) NULL,
  `position` VARCHAR(45) NULL,
  `salary` INT NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `zip` VARCHAR(15) NULL,
  `store_id` INT NOT NULL,
  PRIMARY KEY (`staff_id`, `store_id`),
  INDEX `fk_staff_store_idx` (`store_id` ASC) VISIBLE,
  CONSTRAINT `fk_staff_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `videoclub`.`store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`customers` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `birth` DATETIME NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `zip` VARCHAR(10) NULL,
  `email` VARCHAR(65) NULL,
  `id` VARCHAR(15) NULL,
  `credit_card` CHAR(16) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL,
  `inventory_id` INT NULL,
  `customer_id` INT NOT NULL,
  `return_date` DATETIME NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `staff_id`, `customer_id`),
  INDEX `fk_rental_staff1_idx` (`staff_id` ASC) VISIBLE,
  INDEX `fk_rental_customers1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `mydb`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `videoclub`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `videoclub` ;

-- -----------------------------------------------------
-- Table `videoclub`.`actors`
-- -----------------------------------------------------
ALTER TABLE `videoclub`.`actors` 
ADD PRIMARY KEY (`actor_id`);


-- -----------------------------------------------------
-- Table `videoclub`.`language`
-- -----------------------------------------------------
ALTER TABLE `videoclub`.`language` 
 ADD PRIMARY KEY (`language_id`);


-- -----------------------------------------------------
-- Table `videoclub`.`films`
-- -----------------------------------------------------
ALTER TABLE `videoclub`.`films` 
  ADD PRIMARY KEY (`film_id`, `language_id`);
ALTER TABLE `videoclub`.`films`
	ADD CONSTRAINT `fk_films_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `videoclub`.`language` (`language_id`)
;


-- -----------------------------------------------------
-- ALTER TABLE nombre_tabla_hija
-- ADD CONSTRAINT nombre_constraint
-- FOREIGN KEY (columna_clave_foranea)
-- REFERENCES nombre_tabla_padre (columna_clave_primaria);
-- Table `videoclub`.`actorsfilms`
-- -----------------------------------------------------
ALTER TABLE  `videoclub`.`actorsfilms` 
  ADD PRIMARY KEY (`actor_id`, `film_id`);
ALTER TABLE  `videoclub`.`actorsfilms` 
  ADD CONSTRAINT `fk_actorsfilms_films`
    FOREIGN KEY (`film_id`)
    REFERENCES `videoclub`.`films` (`film_id`);
ALTER TABLE  `videoclub`.`actorsfilms` 
  ADD CONSTRAINT `fk_actorsfilms_actors1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `videoclub`.`actors` (`actor_id`);


-- -----------------------------------------------------
-- Table `videoclub`.`categorys`
-- -----------------------------------------------------
ALTER TABLE `videoclub`.`categorys` 
  ADD PRIMARY KEY (`category_id`);


-- -----------------------------------------------------
-- Table `videoclub`.`categorysfilms`
-- -----------------------------------------------------
ALTER TABLE`videoclub`.`categorysfilms` 
  ADD PRIMARY KEY (`film_id`, `category_id`);
ALTER TABLE`videoclub`.`categorysfilms` 
 ADD CONSTRAINT `fk_categorysfilms_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `videoclub`.`films` (`film_id`);
ALTER TABLE`videoclub`.`categorysfilms` 
  ADD CONSTRAINT `fk_categorysfilms_categorys1`
    FOREIGN KEY (`category_id`)
    REFERENCES `videoclub`.`categorys` (`category_id`);

-- -----------------------------------------------------
-- Table `videoclub`.`inventory`
-- -----------------------------------------------------
ALTER TABLE  `videoclub`.`inventory` 
  ADD PRIMARY KEY (`inventory_id`, `film_id`, `store_id`);
ALTER TABLE  `videoclub`.`inventory`
  ADD CONSTRAINT `fk_inventory_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `videoclub`.`films` (`film_id`);
    
