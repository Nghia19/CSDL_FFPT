-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ChuSoHuu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ChuSoHuu` (
  `MaCSH` INT NOT NULL,
  `DiaChi` VARCHAR(250) NOT NULL,
  `Ten` VARCHAR(150) NOT NULL,
  `SDT` INT NULL,
  PRIMARY KEY (`MaCSH`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VanPhong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VanPhong` (
  `MaVP` INT NOT NULL,
  `DiaChi` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`MaVP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BDS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BDS` (
  `MaBDS` INT NOT NULL,
  `DiaChi` VARCHAR(250) NOT NULL,
  `ChuSoHuu_MaCSH` INT NOT NULL,
  `VanPhong_MaVP` INT NOT NULL,
  PRIMARY KEY (`MaBDS`, `VanPhong_MaVP`, `ChuSoHuu_MaCSH`),
  INDEX `fk_BDS_ChuSoHuu_idx` (`ChuSoHuu_MaCSH` ASC) VISIBLE,
  INDEX `fk_BDS_VanPhong1_idx` (`VanPhong_MaVP` ASC) VISIBLE,
  CONSTRAINT `fk_BDS_ChuSoHuu`
    FOREIGN KEY (`ChuSoHuu_MaCSH`)
    REFERENCES `mydb`.`ChuSoHuu` (`MaCSH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BDS_VanPhong1`
    FOREIGN KEY (`VanPhong_MaVP`)
    REFERENCES `mydb`.`VanPhong` (`MaVP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NhanVien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NhanVien` (
  `MaNV` INT NOT NULL,
  `Ten` VARCHAR(150) NOT NULL,
  `VanPhong_MaVP` INT NOT NULL,
  PRIMARY KEY (`MaNV`, `VanPhong_MaVP`),
  INDEX `fk_NhanVien_VanPhong1_idx` (`VanPhong_MaVP` ASC) VISIBLE,
  CONSTRAINT `fk_NhanVien_VanPhong1`
    FOREIGN KEY (`VanPhong_MaVP`)
    REFERENCES `mydb`.`VanPhong` (`MaVP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ThanNhan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ThanNhan` (
  `Ten` VARCHAR(150) NOT NULL,
  `NgaySinh` DATE NOT NULL,
  `MQH` VARCHAR(45) NOT NULL,
  `NhanVien_MaNV` INT NOT NULL,
  `ThanNhancol` VARCHAR(45) NOT NULL,
  INDEX `fk_ThanNhan_NhanVien1_idx` (`NhanVien_MaNV` ASC) VISIBLE,
  PRIMARY KEY (`Ten`, `NhanVien_MaNV`),
  CONSTRAINT `fk_ThanNhan_NhanVien1`
    FOREIGN KEY (`NhanVien_MaNV`)
    REFERENCES `mydb`.`NhanVien` (`MaNV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TruongPhong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TruongPhong` (
  `VanPhong_MaVP` INT NOT NULL,
  `NhanVien_MaNV` INT NOT NULL,
  INDEX `fk_TruongPhong_VanPhong1_idx` (`VanPhong_MaVP` ASC) VISIBLE,
  PRIMARY KEY (`NhanVien_MaNV`, `VanPhong_MaVP`),
  CONSTRAINT `fk_TruongPhong_VanPhong1`
    FOREIGN KEY (`VanPhong_MaVP`)
    REFERENCES `mydb`.`VanPhong` (`MaVP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TruongPhong_NhanVien1`
    FOREIGN KEY (`NhanVien_MaNV`)
    REFERENCES `mydb`.`NhanVien` (`MaNV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
