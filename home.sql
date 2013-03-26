DROP DATABASE IF EXISTS HomeLogic;

CREATE DATABASE HomeLogic;

USE HomeLogic;

CREATE TABLE tbl_users(
 email		VARCHAR(80)	NOT NULL,
 password	VARCHAR(64) NOT NULL,
 fname		VARCHAR(40)	NULL,
 lname		VARCHAR(40)	NULL,
 salt		VARCHAR(4)	NOT NULL,
 PRIMARY KEY(email)
) ENGINE = INNODB;

CREATE TABLE tbl_rooms(
 room_id	INTEGER(8)	NOT NULL AUTO_INCREMENT,
 room_name	VARCHAR(90) NOT NULL,
 occupancy	INTEGER(2)	NOT NULL,
 PRIMARY KEY(room_id)
 ) ENGINE = INNODB;
 ALTER TABLE tbl_rooms AUTO_INCREMENT=10000;

CREATE TABLE tbl_device(
 device_id	VARCHAR(12)	NOT NULL,
 room		INTEGER(8)	NOT NULL,
 device_name	VARCHAR(40)	NOT NULL,
 device_type	ENUM('Light','Door Lock','Thermostat', 'PLM', 'Controller') NULL,
 status			TINYINT	NOT NULL DEFAULT 0,
 current_temp	INTEGER(4)	NULL,
 device_value	INTEGER(4)	NOT NULL DEFAULT 0,
 stamp			TIMESTAMP NOT NULL,
 PRIMARY KEY(device_id),
 FOREIGN KEY(room) REFERENCES tbl_rooms(room_id)
 	ON DELETE RESTRICT ON UPDATE CASCADE
 ) ENGINE = INNODB;
 
CREATE TABLE tbl_actions(
 action_id	INTEGER(8)	NOT NULL AUTO_INCREMENT,
 room_id	INTEGER(8)	NULL UNIQUE,
 Lon_UserL_Loff	TINYINT NULL DEFAULT 0,
 Loff_UserE_Lon	TINYINT	NULL DEFAULT 0,
 UserL_Loff		TINYINT	NULL DEFAULT 0,
 UserL_Lock		TINYINT	NULL DEFAULT 0,
 PRIMARY KEY(action_id),
 FOREIGN KEY(room_id) REFERENCES tbl_rooms(room_id)
 	ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = INNODB;
ALTER TABLE tbl_actions AUTO_INCREMENT=10000;
 
 
 /* Insert dummy test data */
 INSERT INTO tbl_rooms(room_id, room_name) VALUES(10000, "Living Room");
 INSERT INTO tbl_rooms(room_id, room_name) VALUES(10001, "Bed Room");
 
 INSERT INTO tbl_actions(room_id) VALUES(10000);
 INSERT INTO tbl_actions(room_id) VALUES(10001);

 INSERT INTO tbl_device(device_id, room, device_name, device_type) VALUES("1E4C08",10000, "Modem", "PLM");
 INSERT INTO tbl_device(device_id, room, device_name, device_type) VALUES("1DE94B",10000, "Living Room Light", "Light");
 INSERT INTO tbl_device(device_id, room, device_name, device_type) VALUES("20CBCF",10001, "Bedroom Light", "Light");
 INSERT INTO tbl_device(device_id, room, device_name, device_type) VALUES("1F45C4",10000, "Front Door", "Door Lock");
 INSERT INTO tbl_device(device_id, room, device_name, device_type) VALUES("1E0E1D",10000, "HVAC", "Thermostat");
 










