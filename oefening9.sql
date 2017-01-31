-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema oefening9
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema oefening9
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oefening9` DEFAULT CHARACTER SET utf8 ;
USE `oefening9` ;

-- -----------------------------------------------------
-- Table `oefening9`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oefening9`.`Gene` (
  `Gene_ID` INT NOT NULL,
  `Gene_name` VARCHAR(45) NULL,
  `Description_gene` MEDIUMTEXT NULL,
  PRIMARY KEY (`Gene_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oefening9`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oefening9`.`Syndrome` (
  `IDsyndrome` INT NOT NULL,
  `Chromosome` VARCHAR(45) NULL,
  `Gene` INT NULL,
  `Start` INT NULL,
  `End` INT NULL,
  `Description_syndrome` MEDIUMTEXT NULL,
  PRIMARY KEY (`IDsyndrome`),
  INDEX `fk_Gene_idx` (`Gene` ASC),
  CONSTRAINT `fk_Gene`
    FOREIGN KEY (`Gene`)
    REFERENCES `oefening9`.`Gene` (`Gene_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oefening9`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oefening9`.`Patient` (
  `IDpatient` INT NOT NULL,
  `Patient_name` VARCHAR(45) NULL,
  `Age` INT NULL,
  `Sex` ENUM('M', 'V') NULL,
  `Patient_syndrome` INT NULL,
  `Age_of_Diagnose` INT NULL,
  PRIMARY KEY (`IDpatient`),
  INDEX `fk_Patient_syndrome_idx` (`Patient_syndrome` ASC),
  CONSTRAINT `fk_Patient_syndrome`
    FOREIGN KEY (`Patient_syndrome`)
    REFERENCES `oefening9`.`Syndrome` (`IDsyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
