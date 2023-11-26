-- MySQL Script generated by MySQL Workbench
-- Sun Nov 26 16:26:54 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Veterinaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Veterinaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Veterinaria` ;
USE `Veterinaria` ;

-- -----------------------------------------------------
-- Table `Veterinaria`.`Veterinaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Veterinaria` (
  `idVeterinaria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `lugar` VARCHAR(45) NOT NULL,
  `veterinario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVeterinaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veterinaria`.`Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Pregunta` (
  `idPregunta` INT NOT NULL,
  `pregunta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPregunta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veterinaria`.`Respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Respuestas` (
  `idRespuestas` INT NOT NULL,
  `respuesta` VARCHAR(45) NOT NULL,
  `Pregunta_idPregunta` INT NOT NULL,
  PRIMARY KEY (`idRespuestas`),
  INDEX `fk_Respuestas_Pregunta1_idx` (`Pregunta_idPregunta` ASC) VISIBLE,
  CONSTRAINT `fk_Respuestas_Pregunta1`
    FOREIGN KEY (`Pregunta_idPregunta`)
    REFERENCES `Veterinaria`.`Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veterinaria`.`Medico_Veterinario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Medico_Veterinario` (
  `idMedico_Veterinario` INT NOT NULL AUTO_INCREMENT,
  `nombreVeterinario` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `Veterinaria_idVeterinaria` INT NOT NULL,
  PRIMARY KEY (`idMedico_Veterinario`),
  INDEX `fk_Medico_Veterinario_Veterinaria_idx` (`Veterinaria_idVeterinaria` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_Veterinario_Veterinaria`
    FOREIGN KEY (`Veterinaria_idVeterinaria`)
    REFERENCES `Veterinaria`.`Veterinaria` (`idVeterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veterinaria`.`Mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Mascota` (
  `idMascota` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `sintomas` VARCHAR(50) NOT NULL,
  `visitas` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idMascota`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veterinaria`.`Ficha_Medica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Ficha_Medica` (
  `idFicha_Medica` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `veterinaria` VARCHAR(50) NOT NULL,
  `medicoVeterinario` VARCHAR(50) NOT NULL,
  `respuestas` VARCHAR(45) NOT NULL,
  `Medico_Veterinario_idMedico_Veterinario` INT NOT NULL,
  `Veterinaria_idVeterinaria` INT NOT NULL,
  `Mascota_idMascota` INT NOT NULL,
  PRIMARY KEY (`idFicha_Medica`),
  INDEX `fk_Ficha_Medica_Medico_Veterinario1_idx` (`Medico_Veterinario_idMedico_Veterinario` ASC) VISIBLE,
  INDEX `fk_Ficha_Medica_Veterinaria1_idx` (`Veterinaria_idVeterinaria` ASC) VISIBLE,
  INDEX `fk_Ficha_Medica_Mascota1_idx` (`Mascota_idMascota` ASC) VISIBLE,
  CONSTRAINT `fk_Ficha_Medica_Medico_Veterinario1`
    FOREIGN KEY (`Medico_Veterinario_idMedico_Veterinario`)
    REFERENCES `Veterinaria`.`Medico_Veterinario` (`idMedico_Veterinario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Medica_Veterinaria1`
    FOREIGN KEY (`Veterinaria_idVeterinaria`)
    REFERENCES `Veterinaria`.`Veterinaria` (`idVeterinaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Medica_Mascota1`
    FOREIGN KEY (`Mascota_idMascota`)
    REFERENCES `Veterinaria`.`Mascota` (`idMascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veterinaria`.`Respuestas_has_Ficha_Medica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veterinaria`.`Respuestas_has_Ficha_Medica` (
  `Respuestas_idRespuestas` INT NOT NULL,
  `Ficha_Medica_idFicha_Medica` INT NOT NULL,
  PRIMARY KEY (`Respuestas_idRespuestas`, `Ficha_Medica_idFicha_Medica`),
  INDEX `fk_Respuestas_has_Ficha_Medica_Ficha_Medica1_idx` (`Ficha_Medica_idFicha_Medica` ASC) VISIBLE,
  INDEX `fk_Respuestas_has_Ficha_Medica_Respuestas1_idx` (`Respuestas_idRespuestas` ASC) VISIBLE,
  CONSTRAINT `fk_Respuestas_has_Ficha_Medica_Respuestas1`
    FOREIGN KEY (`Respuestas_idRespuestas`)
    REFERENCES `Veterinaria`.`Respuestas` (`idRespuestas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Respuestas_has_Ficha_Medica_Ficha_Medica1`
    FOREIGN KEY (`Ficha_Medica_idFicha_Medica`)
    REFERENCES `Veterinaria`.`Ficha_Medica` (`idFicha_Medica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;