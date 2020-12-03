-- MySQL Script generated by MySQL Workbench
-- Wed Jun 24 21:15:52 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema iws
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `iws` ;

-- -----------------------------------------------------
-- Schema iws
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `iws` DEFAULT CHARACTER SET utf8 ;
USE `iws` ;

-- -----------------------------------------------------
-- Table `iws`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iws`.`category` ;

CREATE TABLE IF NOT EXISTS `iws`.`category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iws`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iws`.`news` ;

CREATE TABLE IF NOT EXISTS `iws`.`news` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `short_intro` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `author_name` VARCHAR(25) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `category_id` INT(11) NOT NULL,
  `image` TEXT NOT NULL,
  PRIMARY KEY (`id`, `category_id`),
  INDEX `fk_news_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_news_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `iws`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iws`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iws`.`comment` ;

CREATE TABLE IF NOT EXISTS `iws`.`comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `comment` TEXT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `news_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `news_id`),
  INDEX `fk_comment_news1_idx` (`news_id` ASC),
  CONSTRAINT `fk_comment_news1`
    FOREIGN KEY (`news_id`)
    REFERENCES `iws`.`news` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iws`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iws`.`tag` ;

CREATE TABLE IF NOT EXISTS `iws`.`tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iws`.`tag_has_news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iws`.`tag_has_news` ;

CREATE TABLE IF NOT EXISTS `iws`.`tag_has_news` (
  `tag_id` INT(11) NOT NULL,
  `news_id` INT(11) NOT NULL,
  PRIMARY KEY (`tag_id`, `news_id`),
  INDEX `fk_tag_has_news_news1_idx` (`news_id` ASC),
  INDEX `fk_tag_has_news_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_tag_has_news_news1`
    FOREIGN KEY (`news_id`)
    REFERENCES `iws`.`news` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_news_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `iws`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
