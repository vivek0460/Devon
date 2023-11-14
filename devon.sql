-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: devondb
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Head Phone','2023-11-13 23:58:44','2023-11-13 23:58:44'),(2,'Mobile','2023-11-13 23:58:44','2023-11-13 23:58:44'),(3,'Furniture','2023-11-13 23:58:44','2023-11-13 23:58:44'),(4,'Fashion','2023-11-13 23:58:44','2023-11-13 23:58:44'),(5,'Laptop','2023-11-13 23:58:44','2023-11-13 23:58:44');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2023_11_07_172135_create_product_table',1),(5,'2023_11_07_173123_create_product_images_table',1),(6,'2023_11_07_173136_create_product_review_table',1),(7,'2023_11_07_173254_create_category_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'https://via.placeholder.com/640x480.png/0066aa?text=magnam','2023-11-13 23:58:45','2023-11-13 23:58:45'),(2,2,'https://via.placeholder.com/640x480.png/004466?text=veniam','2023-11-13 23:58:45','2023-11-13 23:58:45'),(3,3,'https://via.placeholder.com/640x480.png/00bbee?text=rerum','2023-11-13 23:58:45','2023-11-13 23:58:45'),(4,4,'https://via.placeholder.com/640x480.png/0011aa?text=quam','2023-11-13 23:58:45','2023-11-13 23:58:45'),(5,5,'https://via.placeholder.com/640x480.png/0000cc?text=omnis','2023-11-13 23:58:45','2023-11-13 23:58:45'),(6,6,'https://via.placeholder.com/640x480.png/0000bb?text=voluptatibus','2023-11-13 23:58:45','2023-11-13 23:58:45'),(7,7,'https://via.placeholder.com/640x480.png/001177?text=et','2023-11-13 23:58:45','2023-11-13 23:58:45'),(8,8,'https://via.placeholder.com/640x480.png/00ee77?text=nemo','2023-11-13 23:58:45','2023-11-13 23:58:45'),(9,9,'https://via.placeholder.com/640x480.png/00aa33?text=qui','2023-11-13 23:58:45','2023-11-13 23:58:45'),(10,10,'https://via.placeholder.com/640x480.png/00ddaa?text=vel','2023-11-13 23:58:45','2023-11-13 23:58:45'),(11,11,'https://via.placeholder.com/640x480.png/00bb33?text=placeat','2023-11-13 23:58:45','2023-11-13 23:58:45'),(12,12,'https://via.placeholder.com/640x480.png/005544?text=dolores','2023-11-13 23:58:45','2023-11-13 23:58:45'),(13,13,'https://via.placeholder.com/640x480.png/004488?text=distinctio','2023-11-13 23:58:45','2023-11-13 23:58:45'),(14,14,'https://via.placeholder.com/640x480.png/00ffaa?text=quisquam','2023-11-13 23:58:45','2023-11-13 23:58:45'),(15,15,'https://via.placeholder.com/640x480.png/0044ff?text=doloribus','2023-11-13 23:58:45','2023-11-13 23:58:45'),(16,16,'https://via.placeholder.com/640x480.png/0055dd?text=est','2023-11-13 23:58:45','2023-11-13 23:58:45'),(17,17,'https://via.placeholder.com/640x480.png/00dd33?text=suscipit','2023-11-13 23:58:45','2023-11-13 23:58:45'),(18,18,'https://via.placeholder.com/640x480.png/006611?text=illum','2023-11-13 23:58:45','2023-11-13 23:58:45'),(19,19,'https://via.placeholder.com/640x480.png/0033ff?text=quo','2023-11-13 23:58:45','2023-11-13 23:58:45'),(20,20,'https://via.placeholder.com/640x480.png/000033?text=ipsum','2023-11-13 23:58:45','2023-11-13 23:58:45');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `client_id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` VALUES (2,3,'5786ce1a-706a-44c4-8567-8ae13ae71983',5,'This is test review','2023-11-13 22:59:48','2023-11-13 22:59:48');
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount_percent` int NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `available` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 13',46674.00,30,'Et esse cum eum velit est perspiciatis est. Consequatur blanditiis quaerat quae molestiae officia. Minima qui sunt inventore ut vel similique.',1,0,'2023-11-13 23:58:44','2023-11-13 23:58:44'),(2,'Samsumg 21',26888.00,20,'Ut consequatur ducimus corporis omnis recusandae itaque velit. Quis aut est nulla asperiores. Nemo non porro et necessitatibus sed. Et id minus qui nesciunt ut consequatur in.',3,0,'2023-11-13 23:58:44','2023-11-13 23:58:44'),(3,'iPhone 14',44723.00,40,'Dignissimos illum perspiciatis dolorum et. Aliquid tempore placeat recusandae laborum. Iste nam magni eos id.',5,0,'2023-11-13 23:58:44','2023-11-13 23:58:44'),(4,'Samsumg  Ultra 23',21238.00,20,'Porro qui aut quis ut minima hic laborum. A et reprehenderit tenetur qui. Quis hic velit et distinctio. Rerum et modi sed nulla.',4,0,'2023-11-13 23:58:44','2023-11-13 23:58:44'),(5,'HP Inkjet Printer',28988.00,20,'Laboriosam beatae reiciendis aut molestiae deserunt nisi. Et qui accusantium earum aut. Atque tempore voluptate deleniti et aut. Accusamus dicta eum tenetur ad.',4,0,'2023-11-13 23:58:44','2023-11-13 23:58:44'),(6,'OnePlus 10T',47335.00,30,'Optio repudiandae consequatur deleniti aut vel cupiditate. Magni hic sunt eaque impedit numquam vitae vel. Voluptatum eos delectus distinctio ducimus. Reprehenderit sunt in maxime odio.',5,0,'2023-11-13 23:58:44','2023-11-13 23:58:44'),(7,'Samsumg 70',47365.00,10,'Nemo qui impedit sunt dolor quidem aliquid officiis. Eius qui accusantium optio nostrum labore nostrum natus ad. Minus atque tempore esse dolor. Qui optio ratione sit consequatur.',2,0,'2023-11-13 23:58:44','2023-11-13 23:58:44'),(8,'Samsumg 12',41582.00,30,'Sint illum sint fugit quia accusantium quidem eum. Delectus dolores consequatur voluptates porro quia. Mollitia eos incidunt dolor excepturi. Occaecati numquam omnis enim sed ea ex pariatur.',1,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(9,'iPhone 15',43262.00,20,'Omnis ut ipsam nostrum aperiam. Quis molestiae quam mollitia rerum perspiciatis. Omnis rerum distinctio rerum sequi aut quos eum.',2,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(10,'iPhone 11',22081.00,30,'Est voluptatem quia ullam nihil iusto adipisci. Officia earum ut dignissimos perspiciatis non qui architecto. Adipisci perferendis qui perferendis dolor autem amet possimus.',2,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(11,'Samsumg 32',44434.00,40,'Et officiis ipsa quae mollitia. Occaecati sint voluptas aperiam magni. Incidunt voluptatum est labore harum eum voluptas natus. Qui culpa est illum. Magni non iure veniam totam iste sed.',2,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(12,'Realme 11',22076.00,30,'Ut voluptatem error iste doloribus ducimus minus. Quasi labore temporibus amet est cumque pariatur. Aut eum omnis ipsa rem nulla.',2,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(13,'Samsumg  Ultra 23',31975.00,30,'Cumque voluptas asperiores minus distinctio soluta dolorem. Enim sit quia ea quia. Assumenda eos iste laborum nam.',1,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(14,'Samsumg 21',44848.00,40,'Consequuntur quam optio corrupti hic ad quo. Suscipit quisquam est aut dolor. Id vitae quidem ut ut rerum a similique laboriosam.',4,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(15,'Realme 11',44159.00,30,'Dolores voluptatem laboriosam iusto voluptatibus adipisci. Nihil dolorem dolore nobis pariatur qui quod voluptatem. Veniam distinctio non consectetur adipisci.',3,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(16,'Samsumg 52',26637.00,40,'Sed assumenda quam sed culpa. Iure corporis laudantium quia. Qui aliquam delectus aut molestias. Enim et esse ad voluptatibus quia.',5,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(17,'Samsumg 52',40816.00,40,'Velit quia impedit ad recusandae possimus corporis. Quia dolor sequi aut doloremque quia ipsum. Soluta harum et id et. Totam voluptate reprehenderit ullam expedita.',3,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(18,'Jockey TShirt',31648.00,30,'Debitis distinctio rerum ipsa laudantium velit. Libero ratione natus ex similique. Autem officiis modi deserunt sint. Similique et veniam molestiae velit ratione quis consequatur.',2,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(19,'Lenovo Ideabook',23969.00,50,'Explicabo et sint consequuntur et fuga. Exercitationem sequi unde ex vero sint atque vero. Atque enim autem natus expedita ex.',1,0,'2023-11-13 23:58:45','2023-11-13 23:58:45'),(20,'Samsumg 70',22691.00,20,'Laborum non cumque voluptatem itaque totam. Culpa minima libero ipsum iusto ipsa. Voluptatem at assumenda at. Voluptatem ratione pariatur impedit vitae.',3,0,'2023-11-13 23:58:45','2023-11-13 23:58:45');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Santino Ebert','jkozey@example.net','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','s0hjTa1q7e','2023-11-13 23:58:44','2023-11-13 23:58:44'),(2,'Jeramie Kulas','ziemann.gwen@example.com','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','N9rIISIl6W','2023-11-13 23:58:44','2023-11-13 23:58:44'),(3,'Mrs. Anna Quigley III','albin.hudson@example.com','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','65d8SOsF5M','2023-11-13 23:58:44','2023-11-13 23:58:44'),(4,'Prof. Yadira Kassulke DDS','leanne97@example.org','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pX8I9kNiNB','2023-11-13 23:58:44','2023-11-13 23:58:44'),(5,'Adelle Hill','gohara@example.com','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','EyyotodfQr','2023-11-13 23:58:44','2023-11-13 23:58:44'),(6,'Willard Haley','lebsack.kobe@example.com','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','xlUjJgZzfF','2023-11-13 23:58:44','2023-11-13 23:58:44'),(7,'Mr. Howell Toy','ischumm@example.org','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','yZs7DMN3FD','2023-11-13 23:58:44','2023-11-13 23:58:44'),(8,'Gunner Feest II','ondricka.jacinto@example.org','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','K2n0nV5rUh','2023-11-13 23:58:44','2023-11-13 23:58:44'),(9,'Freeda Kovacek','mitchell.tomas@example.org','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XZJvzxkfuE','2023-11-13 23:58:44','2023-11-13 23:58:44'),(10,'Rosina Stehr IV','darby.kiehn@example.org','2023-11-13 23:58:44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Gxgwjo3gHq','2023-11-13 23:58:44','2023-11-13 23:58:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14 11:10:52
