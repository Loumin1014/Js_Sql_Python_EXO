-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: ferme1
-- Source Schemata: ferme
-- Created: Sat Nov 17 14:52:05 2018
-- Workbench Version: 8.0.13
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema ferme1
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `ferme1` ;
CREATE SCHEMA IF NOT EXISTS `ferme1` ;

-- ----------------------------------------------------------------------------
-- Table ferme1.alimentation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`alimentation` (
  `idplante` INT(10) NOT NULL AUTO_INCREMENT,
  `idanimal` INT(10) NOT NULL,
  `annee` TINYINT(4) NULL DEFAULT NULL,
  `qtx` SMALLINT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idplante`, `idanimal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.animal
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`animal` (
  `idanimal` INT(10) NOT NULL,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idanimal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.culture
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`culture` (
  `idculture` INT(10) NOT NULL,
  `idplante` INT(10) NULL DEFAULT NULL,
  `annee` TINYINT(3) NULL DEFAULT NULL,
  `rendement` INT(10) NULL DEFAULT NULL,
  `idterrain` INT(10) NULL DEFAULT NULL,
  `idemploye` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idculture`),
  INDEX `FK_idplante` (`idplante` ASC) VISIBLE,
  INDEX `FK_idterrain` (`idterrain` ASC) VISIBLE,
  INDEX `FK_idemploye` (`idemploye` ASC) VISIBLE,
  CONSTRAINT `FK_idemploye`
    FOREIGN KEY (`idemploye`)
    REFERENCES `ferme1`.`employe` (`idemploye`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_idplante`
    FOREIGN KEY (`idplante`)
    REFERENCES `ferme1`.`plante` (`idplante`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_idterrain`
    FOREIGN KEY (`idterrain`)
    REFERENCES `ferme1`.`terrain` (`idterrain`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.elevage
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`elevage` (
  `idelevage` INT(10) NOT NULL,
  `idanimal` INT(10) NULL DEFAULT NULL,
  `idterrain` INT(10) NULL DEFAULT NULL,
  `capacite` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idelevage`),
  INDEX `FK1_idanimal` (`idanimal` ASC) VISIBLE,
  INDEX `FK2_idterrain` (`idterrain` ASC) VISIBLE,
  CONSTRAINT `FK1_idanimal`
    FOREIGN KEY (`idanimal`)
    REFERENCES `ferme1`.`animal` (`idanimal`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK2_idterrain`
    FOREIGN KEY (`idterrain`)
    REFERENCES `ferme1`.`terrain` (`idterrain`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.employe
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`employe` (
  `idemploye` INT(10) NOT NULL,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  `idposte` SMALLINT(5) NULL DEFAULT NULL,
  PRIMARY KEY (`idemploye`),
  INDEX `FK_idposte` (`idposte` ASC) VISIBLE,
  CONSTRAINT `FK_idposte`
    FOREIGN KEY (`idposte`)
    REFERENCES `ferme1`.`poste` (`idposte`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.plante
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`plante` (
  `idplante` INT(10) NOT NULL,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  `idtype_plante` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idplante`),
  INDEX `FK_idtype_plante` (`idtype_plante` ASC) VISIBLE,
  CONSTRAINT `FK_idtype_plante`
    FOREIGN KEY (`idtype_plante`)
    REFERENCES `ferme1`.`type_plante` (`idtype_plante`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.poste
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`poste` (
  `idposte` SMALLINT(5) NOT NULL,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idposte`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.production
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`production` (
  `idelevage` INT(10) NULL DEFAULT NULL,
  `annee` TINYINT(4) NOT NULL,
  `qtx` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`annee`),
  INDEX `FK1_idelevage` (`idelevage` ASC) VISIBLE,
  CONSTRAINT `FK1_idelevage`
    FOREIGN KEY (`idelevage`)
    REFERENCES `ferme1`.`elevage` (`idelevage`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.produit
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`produit` (
  `idproduit` INT(10) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idproduit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.terrain
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`terrain` (
  `idterrain` INT(10) NOT NULL,
  `surface` FLOAT NULL DEFAULT NULL,
  `longitude` FLOAT NULL DEFAULT NULL,
  `latitude` FLOAT NULL DEFAULT NULL,
  `idtype_terre` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idterrain`),
  INDEX `FK_idtype_terre` (`idtype_terre` ASC) VISIBLE,
  CONSTRAINT `FK_idtype_terre`
    FOREIGN KEY (`idtype_terre`)
    REFERENCES `ferme1`.`type_terre` (`idtype_terre`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.traitement
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`traitement` (
  `idproduit` INT(10) NOT NULL,
  `idculture` INT(10) NOT NULL,
  `qtx` SMALLINT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idproduit`, `idculture`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.type_plante
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`type_plante` (
  `idtype_plante` INT(10) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idtype_plante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table ferme1.type_terre
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferme1`.`type_terre` (
  `idtype_terre` INT(10) NOT NULL,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idtype_terre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
SET FOREIGN_KEY_CHECKS = 1;
