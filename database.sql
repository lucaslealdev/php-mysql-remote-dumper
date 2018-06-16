-- MySQL Script generated by MySQL Workbench
-- 06/16/18 00:05:21
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mysqlbackup
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mysqlbackup
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mysqlbackup` DEFAULT CHARACTER SET utf8mb4 ;
USE `mysqlbackup` ;

-- -----------------------------------------------------
-- Table `mysqlbackup`.`banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysqlbackup`.`banco` (
  `idbanco` INT NOT NULL AUTO_INCREMENT,
  `host` VARCHAR(255) NOT NULL,
  `user` VARCHAR(255) NOT NULL,
  `pass` VARCHAR(255) NOT NULL,
  `db` VARCHAR(255) NOT NULL,
  `recorrencia` ENUM('Minuto', 'Hora', 'Dia', 'Semana', 'Mês') NOT NULL DEFAULT 'Dia',
  `ultimo` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idbanco`),
  INDEX `ultimoidx` (`ultimo` ASC, `recorrencia` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysqlbackup`.`log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysqlbackup`.`log` (
  `idlog` INT NOT NULL AUTO_INCREMENT,
  `quando` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `arquivo` VARCHAR(255) NOT NULL,
  `banco_idbanco` INT NOT NULL,
  PRIMARY KEY (`idlog`),
  INDEX `fk_log_bancos_idx` (`banco_idbanco` ASC),
  INDEX `quando` (`quando` ASC),
  CONSTRAINT `fk_log_bancos`
    FOREIGN KEY (`banco_idbanco`)
    REFERENCES `mysqlbackup`.`banco` (`idbanco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;