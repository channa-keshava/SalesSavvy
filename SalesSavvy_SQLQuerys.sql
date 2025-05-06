CREATE TABLE users (
  user_id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('ADMIN','CUSTOMER') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
);

CREATE TABLE jwt_tokens (
  token_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP NOT NULL,
  PRIMARY KEY (token_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE categories (
  category_id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (category_id)
);

CREATE TABLE products (
  product_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL,
  category_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (product_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE productimages (
  image_id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  image_url TEXT NOT NULL,
  PRIMARY KEY (image_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

/* Cart Management Service */
CREATE TABLE cart_items (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

/*Order Management Service*/
CREATE TABLE orders (
  order_id VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  status ENUM('PENDING','SUCCESS','FAILED') DEFAULT 'PENDING',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (order_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
  id INT NOT NULL AUTO_INCREMENT,
  order_id VARCHAR(255) NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price_per_unit DECIMAL(10,2) NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);



INSERT INTO `categories` VALUES (3,'Accessories'),
(5,'Mobile Accessories'),
(4,'Mobiles'),
(2,'Pants'),
(1,'Shirts');

INSERT INTO `products` VALUES (1,'Shirt1','Stylish Shirt1',499.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(2,'Shirt2','Stylish Shirt2',599.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(3,'Shirt3','Stylish Shirt3',699.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(4,'Shirt4','Stylish Shirt4',799.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(5,'Shirt5','Stylish Shirt5',899.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(6,'Shirt6','Stylish Shirt6',999.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(7,'Shirt7','Stylish Shirt7',1099.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(8,'Shirt8','Stylish Shirt8',1199.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(9,'Shirt9','Stylish Shirt9',1299.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(10,'Shirt10','Stylish Shirt10',1399.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(11,'Shirt11','Stylish Shirt11',1499.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(12,'Shirt12','Best Shirt In the Segment',987.00,200,1,'2025-01-27 14:58:30','2025-02-10 05:35:12'),(13,'Shirt13','Stylish Shirt13',1699.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(14,'Shirt14','Stylish Shirt14',1799.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(15,'Shirt15','Stylish Shirt15',1899.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(16,'Pant1','Stylish Pant1',799.99,50,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(17,'Pant2','Stylish Pant2',899.50,45,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(18,'Pant3','Stylish Pant3',759.99,40,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(19,'Pant4','Stylish Pant4',689.99,55,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(20,'Pant5','Stylish Pant5',999.99,30,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(21,'Pant6','Stylish Pant6',699.99,20,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(22,'Pant7','Stylish Pant7',849.50,35,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(23,'Pant8','Stylish Pant8',799.00,60,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(24,'Pant9','Stylish Pant9',729.99,25,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(25,'Pant10','Stylish Pant10',889.99,50,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(26,'Pant11','Stylish Pant11',819.99,40,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(27,'Shirt Colourful','Best Shirt',750.00,50,1,'2025-01-27 14:58:30','2025-01-27 14:58:30'),(28,'cool shirt','colourful shirt',800.00,50,1,'2025-01-27 14:58:30','2025-01-27 14:58:30'),(29,'Best color Shirt','Cool color shirt',900.00,90,1,'2025-01-27 14:58:30','2025-03-17 11:54:39'),(30,'Pant15','Stylish Pant15',899.99,90,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(31,'TV1','Smart TV1 with HD display',18999.99,20,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),
(32,'TV2','Smart TV2 with Full HD display',21999.50,15,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(33,'TV3','Smart TV3 with 4K display',29999.00,10,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(34,'TV4','Smart TV4 with HDR and Dolby Vision',25999.99,12,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(35,'TV5','Smart TV5 with Ultra HD screen',34999.99,8,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(36,'TV6','Smart TV6 with Alexa Built-in',27999.50,18,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(37,'TV7','Smart TV7 with Android OS',22999.00,22,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(38,'TV8','Smart TV8 with High Refresh Rate',31999.99,14,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(39,'TV9','Smart TV9 with Thin Bezels',24999.99,20,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(40,'TV10','Smart TV10 with AI Upscaling',39999.00,5,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(41,'Speaker','Worlds BEst',12999.99,50,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(42,'Nikon DSLR','Indias best',8999.50,75,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(43,'NIK DSLR2','Sales Choice',15999.00,40,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(44,'NIC DSLR3','Capture Nik',19999.99,30,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(45,'LAPTOP','Smart TV15 with AI Upscaling',24999.99,25,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(46,'Mobile1','Mobile6 with gaming chipset and high refresh rate',19999.99,50,4,'2025-01-04 19:31:27','2025-01-04 20:12:48'),(47,'Mobile2','Mobile7 with gaming chipset and high refresh rate',8999.50,55,4,'2025-01-04 19:31:27','2025-01-04 20:12:48'),(48,'Mobile3','Mobile8 with gaming chipset and high refresh rate',22999.00,50,4,'2025-01-04 19:31:27','2025-01-04 20:12:48'),(49,'Mobile4','Mobile9 with gaming chipset and high refresh rate',8999.50,55,4,'2025-01-04 19:31:27','2025-01-04 20:12:48'),(50,'Mobile5','Mobile10 with gaming chipset and high refresh rate',39999.00,50,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(51,'Mobile6','Mobile10 with gaming chipset and high refresh rate',48765.00,30,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(53,'Mobile8','Mobile12with gaming chipset and high refresh rate',34598.00,345,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(54,'Mobile9','Mobile13 with gaming chipset and high refresh rate',45673.00,45,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(56,'Mobile11','Mobile15 with gaming chipset and high refresh rate',23412.00,65,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(57,'Mobile12','Mobile12 with gaming chipset and high refresh rate',89765.00,456,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(58,'Mobile13','Mobile14 with gaming chipset and high refresh rate',23456.00,567,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(59,'Mobile14','Mobile11 with gaming chipset and high refresh rate',99990.00,234,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(60,'Mobile15','Mobile15 with gaming chipset and high refresh rate',45389.00,225,4,'2025-01-04 19:31:27','2025-01-06 15:11:42'),
(61,'Mobile Accessory -1','Durable and practical mobile accessory for everyday use.',999.00,30,5,'2025-01-27 14:58:30','2025-03-17 11:58:55'),
(62,'Mobile Accessory 2','Durable and practical mobile accessory for everyday use.',349.50,200,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(63,'Mobile Accessory 3','A versatile mobile accessory with modern features.',899.00,80,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(64,'Mobile Accessory 4','Reliable mobile accessory designed for convenience.',749.75,120,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(65,'Mobile Accessory 5','Mobile accessory offering comfort and durability.',199.99,250,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(66,'Mobile Accessory 6','A stylish and protective mobile accessory.',249.99,500,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(68,'Mobile Accessory 8','An essential mobile accessory designed for convenience.',399.50,350,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(70,'Mobile Accessory 10','Compact and efficient mobile accessory for all your needs.',1099.99,100,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(72,'Louies-2','Cool Louies 2.',156.99,321,1,'2025-01-21 14:33:32','2025-01-21 14:33:32'),(74,'spykershirt','best shirt',999.00,100,1,'2025-01-22 18:57:55','2025-01-22 18:57:55'),(75,'Spy shirts','good cool',99.00,200,1,'2025-01-22 19:33:24','2025-01-22 19:33:24'),(76,'spyker hot shirt','best shirt',999.00,100,1,'2025-01-22 19:45:19','2025-01-22 19:45:19'),(77,'louies s[yker','cool hot shirt',854.00,20,1,'2025-01-22 19:48:57','2025-01-22 19:48:57'),(79,'LouiesSpiker','wonderful striped shirt',899.00,200,1,'2025-01-27 04:39:32','2025-01-27 04:39:32'),(80,'spiker','adsjfkhbsjkdf',999.00,200,1,'2025-01-27 04:40:00','2025-01-27 04:40:00'),(81,'spyker12','wednc ewjhcew',999.00,20,1,'2025-01-27 05:26:17','2025-01-27 05:26:17'),(82,'gyshirt','dcjhbSJDHCac',899.00,10,1,'2025-01-27 05:32:17','2025-01-27 05:32:17'),(83,'aKS;JC','ZADJLNSV ',767.00,29,1,'2025-01-27 05:33:04','2025-01-27 05:33:04'),(84,'hgdv','wedjkcwev',644.00,10,1,'2025-01-27 05:41:08','2025-01-27 05:41:08'),(85,'sdfhjb1','sdkjvb',657.00,20,1,'2025-01-27 05:49:07','2025-01-27 05:49:07'),(86,'sdkfjn','sdfkjn',23.00,23,1,'2025-01-27 05:50:27','2025-01-27 05:50:27'),(87,'dsf','sdfb',23.00,23,1,'2025-01-27 05:53:04','2025-01-27 05:53:04'),(88,'dsfbvsdf','sdfb',23.00,21,1,'2025-01-27 05:55:04','2025-01-27 05:55:04'),(89,'shiet','asdvwefg',23.00,23,1,'2025-01-27 06:01:25','2025-01-27 06:01:25'),(90,'zdf','sdfb',23.00,23,1,'2025-01-27 06:03:52','2025-01-27 06:03:52'),(91,'shirtspyker','aschjadc',123.00,23,1,'2025-01-27 13:51:14','2025-01-27 13:51:14'),(92,'asdkjc','wdf',12.00,23,1,'2025-01-27 13:51:32','2025-01-27 13:51:32'),(93,'abc','dfghj',40.00,5,1,'2025-01-27 14:04:08','2025-01-27 14:04:08'),(94,'abc2','gyvhujnkml,',30.00,3,1,'2025-01-27 14:17:25','2025-01-27 14:17:25'),(95,'blueShirt','Awesome Blue Shirt',876.00,20,1,'2025-01-27 14:58:30','2025-01-27 14:58:30');


INSERT INTO `productimages` VALUES (1,1,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt1.png'),(2,2,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt2.png'),(3,3,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt3.png'),(4,4,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt4.png'),(5,5,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt5.png'),(6,6,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt6.png'),(7,7,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt7.png'),(8,8,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt8.png'),(9,9,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt9.png'),(10,10,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt10.png'),(11,11,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt11.png'),(12,12,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt12.png'),(13,13,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt12.png'),(14,14,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt14.png'),(15,15,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt15.png'),(17,17,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant2.png'),(18,18,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant3.png'),(19,19,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant4.png'),(20,20,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant5.png'),(21,21,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant6.png'),(22,22,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant7.png'),(23,23,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant8.png'),(24,24,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant9.png'),(25,25,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant10.png'),(26,26,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant11.png'),
(27,27,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant11.png'),(28,28,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant11.png'),(29,29,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant11.png'),(30,30,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant15.png'),(31,31,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv1.png'),(32,32,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv2.png'),(33,33,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv3.png'),(34,34,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv4.png'),(35,35,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv5.png'),(36,36,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv6.png'),(37,37,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv7.png'),(38,38,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv8.png'),(39,39,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv9.png'),(40,40,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv10.png'),(41,41,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv11.png'),(42,42,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv12.png'),(43,43,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv13.png'),(44,44,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv14.png'),(45,45,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv15.png'),(46,46,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph1.png'),(47,47,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph2.png'),(48,48,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph3.png'),(49,49,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph4.png'),(50,50,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph5.png'),(51,51,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph6.png'),(53,53,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph8.png'),(54,54,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph9.png'),(56,56,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph11.png'),(57,57,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph12.png'),(58,58,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph13.png'),(59,59,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph14.png'),(60,60,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph1.png'),(61,61,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph1.png'),(62,62,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma2.png'),(63,63,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma3.png'),(64,64,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma4.png'),(65,65,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma5.png'),(66,66,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma6.png'),(68,68,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma8.png'),(70,70,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma10.png'),
(72,72,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/newshirt2.png'),(75,75,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/newshirt2.png'),(76,76,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt10.png'),(77,77,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt2.png'),(79,79,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt9.png'),(80,80,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt9.png'),(95,95,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt13.png');