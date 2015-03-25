CREATE TABLE products(id_product int(12) NOT NULL auto_increment, 
name_product VARCHAR(60) NOT NULL, 
price_product DOUBLE NOT NULL, 
quantity_product DOUBLE, PRIMARY KEY(id_product));

INSERT INTO `proect`.`products` (`name_product`, `price_product`, `quantity_product`) VALUES ('Pine', '3.50', '100');
INSERT INTO `proect`.`products` (`name_product`, `price_product`, `quantity_product`) VALUES ('Zahar', '15', '80');
INSERT INTO `proect`.`products` (`name_product`, `price_product`, `quantity_product`) VALUES ('Mere', '10', '20');
INSERT INTO `proect`.`products` (`name_product`, `price_product`, `quantity_product`) VALUES ('Dorna', '12', '40');
INSERT INTO `proect`.`products` (`name_product`, `price_product`, `quantity_product`) VALUES ('Ciocolate', '20', '50');

CREATE  TABLE users (
username VARCHAR(45) NOT NULL ,
password VARCHAR(60) NOT NULL ,
enabled TINYINT NOT NULL DEFAULT 1 ,
PRIMARY KEY (username));
  
CREATE TABLE user_roles (
user_role_id int(11) NOT NULL AUTO_INCREMENT,
username varchar(45) NOT NULL,
role varchar(45) NOT NULL,
PRIMARY KEY (user_role_id),
UNIQUE KEY uni_username_role (role,username),
KEY fk_username_idx (username),
CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
  
INSERT INTO users(username,password,enabled) VALUES ('Dima','12345', true);
INSERT INTO users(username,password,enabled) VALUES ('Mihai','1234', true);
INSERT INTO users(username,password,enabled) VALUES ('Petru','1234', true);

INSERT INTO user_roles (username, role) VALUES ('Dima', 'ROLE_USER');
INSERT INTO user_roles (username, role) VALUES ('Dima', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('Mihai', 'ROLE_USER');
INSERT INTO user_roles (username, role) VALUES ('Petru', 'ROLE_USER');



