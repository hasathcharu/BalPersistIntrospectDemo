-- AUTO-GENERATED FILE.

-- This file is an auto-generated file by Ballerina persistence layer for model.
-- Please verify the generated scripts and execute them against the target DB server.

DROP TABLE IF EXISTS `appointment`;
DROP TABLE IF EXISTS `patients`;
DROP TABLE IF EXISTS `Doctor`;

CREATE TABLE `Doctor` (
	`id` INT NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	`specialty` VARCHAR(191) NOT NULL,
	`phone_number` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `patients` (
	`id` INT AUTO_INCREMENT,
	`name` VARCHAR(191) NOT NULL,
	`age` INT NOT NULL,
	`ADDRESS` VARCHAR(191) NOT NULL,
	`phoneNumber` CHAR(10) NOT NULL,
	`gender` ENUM('MALE', 'FEMALE') NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `appointment` (
	`id` INT NOT NULL,
	`reason` VARCHAR(191) NOT NULL,
	`appointmentTime` DATETIME NOT NULL,
	`status` ENUM('SCHEDULED', 'STARTED', 'ENDED') NOT NULL,
	`patientId` INT NOT NULL,
	FOREIGN KEY(`patientId`) REFERENCES `patients`(`id`),
	`doctorId` INT NOT NULL,
	FOREIGN KEY(`doctorId`) REFERENCES `Doctor`(`id`),
	PRIMARY KEY(`id`)
);


CREATE INDEX `patientId` ON `appointment` (`patientId`);
CREATE INDEX `doctorId` ON `appointment` (`doctorId`);
CREATE UNIQUE INDEX `reason_index` ON `appointment` (`reason`);
CREATE INDEX `specialty_index` ON `Doctor` (`specialty`);
