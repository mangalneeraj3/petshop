-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: u786772956_petshop
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2y$10$JBCNRjS2T4mYZ/HHU7eBhuBSZvWO1ZGeedkdd.iNtYC9Wxj1jTq52');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Samaria Pet Shop',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'Golden Retriever: The Sunshine Dog Every Family Loves','golden-retriever','<section class=\"blog-post\">\n  <article>\n    <header>\n      <h1>Golden Retriever: The Sunshine Dog Every Family Loves</h1>\n      <p>\n        If you’re dreaming of a loyal, gentle, and endlessly cheerful companion, the Golden Retriever is often the first breed that comes to mind.\n        With their iconic golden coats and friendly smiles, Goldens have become one of the most popular family dogs across the world.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/2b61c5c7a6c22a9e069cc95be6a3e48f9c57efac.jpg\"\n             alt=\"Golden Retriever sitting on grass in warm sunset light\">\n        <figcaption>A happy Golden Retriever enjoying the outdoors.</figcaption>\n      </figure>\n    </header>\n\n    <section>\n      <h2>A Brief History of the Golden Retriever</h2>\n      <p>\n        The Golden Retriever was developed in Scotland in the late nineteenth century as a gundog, bred to retrieve waterfowl and game birds during hunts.\n        Breeders focused on creating a dog with a soft mouth for carrying game gently, combined with a strong love of water and an eager‑to‑please temperament.\n        Over time, that working dog heritage evolved into today’s affectionate, versatile companion seen in homes, show rings, and service roles worldwide.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/911273c41906c98806df22f1c05ffc1649383dda.jpg\"\n             alt=\"Golden Retriever lying on grass in a backyard\">\n        <figcaption>The Golden’s origins as a working retriever are still visible in its athletic build.</figcaption>\n      </figure>\n    </section>\n\n    <section>\n      <h2>What Does a Golden Retriever Look Like?</h2>\n      <p>\n        Golden Retrievers are medium‑to‑large dogs with a strong, athletic build and a broad, expressive head.\n        Adult males typically stand around 56–61 cm tall and females around 51–56 cm, with most adults weighing about 25–34 kg.\n        Their trademark is a dense double coat—soft insulating undercoat plus a water‑resistant outer coat—that comes in shades from light cream to rich golden.\n      </p>\n      <p>\n        You’ll also notice their kind, intelligent brown eyes, floppy ears, and a long tail that seems to wag almost nonstop when they are happy, which is most of the time.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/ac80a6e6d06aab6d2f1f07394a5aa44f6f81fa8b.jpg\"\n             alt=\"Golden Retriever sitting in a sunlit grassy field\">\n        <figcaption>The classic Golden look: soft eyes, silky coat, and a constantly wagging tail.</figcaption>\n      </figure>\n    </section>\n\n    <section>\n      <h2>Temperament: Why Families Love Goldens</h2>\n      <p>\n        Golden Retrievers are famous for their friendly, gentle, and people‑oriented nature.\n        They are highly social dogs who enjoy meeting new people, playing with children, and often get along well with other pets too.\n        Because they are eager to please and very intelligent, training them is usually a pleasure, especially when you use positive reinforcement and consistency.\n      </p>\n      <p>\n        This breed thrives on human companionship and often wants to be wherever the family is—on walks, during road trips, or just curled up near your feet at home.\n        They are not natural guard dogs; most Goldens are more likely to greet strangers with a wagging tail than with suspicion.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/d2e2f61de4af7a291c6e507f8396a923f395b28a.jpg\"\n             alt=\"Family sitting on a sofa with Golden Retriever lying on a rug in front\">\n        <figcaption>A Golden Retriever fits perfectly into active, loving family homes.</figcaption>\n      </figure>\n    </section>\n\n    <section>\n      <h2>Can Golden Retrievers Live Comfortably in India?</h2>\n      <p>\n        Many pet parents in India worry whether Golden Retrievers can handle the hot climate, especially in cities like Jaipur.\n        The answer is yes — with proper care and attention to heat management.\n      </p>\n      <p>\n        Golden Retrievers have a thick double coat that helps regulate body temperature, but it also makes them prone to overheating in extreme heat if they are not kept cool.\n        Give them a cool, shaded resting area, plenty of fresh water, and restrict walks to early mornings and late evenings during summer.\n        In very hot weather, indoor areas with fans or air conditioning become important to keep them safe and comfortable.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/2b61c5c7a6c22a9e069cc95be6a3e48f9c57efac.jpg\"\n             alt=\"Golden Retriever relaxing outdoors on grass at sunset\">\n        <figcaption>In hot climates, schedule outdoor fun during the cooler hours of the day.</figcaption>\n      </figure>\n    </section>\n\n    <section>\n      <h2>Grooming and Shedding: Managing That Beautiful Coat</h2>\n      <p>\n        That stunning golden coat comes with a reality check: Golden Retrievers shed — a lot.\n        They shed moderately throughout the year and heavily once or twice annually when they blow their undercoat.\n      </p>\n      <p>\n        Regular brushing two to three times a week is recommended to remove loose hair, prevent matting, and keep the coat healthy; during heavy shedding periods, daily brushing is ideal.\n        Never shave a Golden Retriever’s double coat, as it protects their skin from the sun and helps regulate temperature; shaving can actually worsen heat stress and cause sunburn.\n        Occasional baths, ear cleaning, and nail trimming complete a simple but consistent grooming routine.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/911273c41906c98806df22f1c05ffc1649383dda.jpg\"\n             alt=\"Golden Retriever lying on grass in a yard\">\n        <figcaption>Regular brushing helps keep a Golden’s coat shiny, healthy, and comfortable.</figcaption>\n      </figure>\n    </section>\n\n    <section>\n      <h2>Exercise and Training Needs</h2>\n      <p>\n        Golden Retrievers are energetic, athletic dogs originally bred for active work, so they need regular physical and mental exercise to stay happy.\n        Most adults do well with at least one to two hours of daily activity in the form of walks, play sessions, and games like fetch or swimming, ideally in the cooler parts of the day.\n      </p>\n      <p>\n        Because they are intelligent and eager to learn, Goldens respond very well to training that uses rewards, clear cues, and consistency.\n        Early socialisation — introducing them to different people, dogs, and environments — helps channel their enthusiasm and prevents unwanted behaviours like jumping or pulling on the leash.\n        Many Golden Retrievers also excel in obedience, agility, and even as therapy or assistance dogs.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/708f74a279733fad608e10c8cb366de242f46a83.jpg\"\n             alt=\"Two Golden Retriever puppies playing with a ball on grass\">\n        <figcaption>Puppies need lots of play and gentle training to grow into well‑behaved adults.</figcaption>\n      </figure>\n    </section>\n\n    <section>\n      <h2>Health, Nutrition, and Common Concerns</h2>\n      <p>\n        With good care, Golden Retrievers generally live around 10–12 years.\n        Like many large breeds, they can be prone to certain health issues such as hip and elbow dysplasia, some heart conditions, and a tendency toward obesity if overfed or under‑exercised.\n      </p>\n      <p>\n        A balanced, high‑quality diet appropriate for their age, weight, and activity level is essential, along with regular veterinary check‑ups and vaccinations.\n        Because their dense coat and lower heat tolerance can stress their body in hot regions, maintaining a healthy weight and good hydration is especially important in India.\n        Joint support through proper nutrition, controlled exercise, and vet‑recommended supplements can help keep them active and comfortable as they age.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/5f08e3e3ba89f1bc48b0f0a5d7df4b219e7a6435.jpg\"\n             alt=\"Golden Retriever puppies playing with colorful balls on grass\">\n        <figcaption>Healthy play, a good diet, and regular vet visits set your Golden up for a long, happy life.</figcaption>\n      </figure>\n    </section>\n\n    <section>\n      <h2>Is a Golden Retriever Right for You?</h2>\n      <p>\n        A Golden Retriever is a wonderful choice if you want a friendly, affectionate family dog who loves to be involved in all aspects of your daily life.\n        They are ideal for families who can provide plenty of time and attention, regular exercise, indoor comfort during hot days, and consistent grooming and health care.\n      </p>\n      <p>\n        On the other hand, if your schedule keeps you away from home for long hours or you cannot provide a cool environment during peak summer, this may not be the right breed for you.\n        Goldens dislike being left alone for long periods and can develop anxiety or destructive habits if their social and exercise needs are not met.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/b5bfc6c38daecfba0fc01ffdf282e8192d2693d9.jpg\"\n             alt=\"Family sitting with a Golden Retriever on the couch\">\n        <figcaption>Goldens are happiest when they are treated as part of the family.</figcaption>\n      </figure>\n    </section>\n\n    <section>\n      <h2>Bringing Home Your Golden Retriever</h2>\n      <p>\n        When you are ready to welcome a Golden Retriever into your family, choose a responsible source that prioritises the health and temperament of their dogs.\n        Reputable breeders and ethical pet shops will ensure vaccinations are up to date, discuss the pup’s health history, and guide you on early care and training.\n      </p>\n      <p>\n        With the right start, your Golden Retriever will quickly become more than just a pet — he or she will be a loyal best friend, an enthusiastic travel companion, and a warm, golden presence in your home for years to come.\n      </p>\n      <figure>\n        <img src=\"https://pplx-res.cloudinary.com/image/upload/pplx_search_images/bc256aaa21d0d7f013ab18ce36339d757e00eeb1.jpg\"\n             alt=\"Golden Retriever puppy chewing a rope toy on a bed\">\n        <figcaption>Bring home your Golden with the right food, toys, and accessories to make their first days special.</figcaption>\n      </figure>\n    </section>\n  </article>\n</section>','https://pplx-res.cloudinary.com/image/upload/pplx_search_images/bc256aaa21d0d7f013ab18ce36339d757e00eeb1.jpg','Samaria Pet Shop','2026-06-22 05:26:17','Golden Retriever care guide for families in Jaipur—temperament, grooming, heat-safety tips and must-have supplies from Samaria Pet Shop','golden retriever, golden retriever puppies jaipur, samaria pet shop jaipur, family dog breeds, dog grooming, dog training, golden retriever care india, golden retriever food, dog accessories jaipur');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiries`
--

DROP TABLE IF EXISTS `enquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquiries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enq_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `petName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'New',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enq_id` (`enq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiries`
--

LOCK TABLES `enquiries` WRITE;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;
INSERT INTO `enquiries` VALUES (1,'ENQ-1258','Jun 10, 2026','Contact: General Enquiry','Richa Sharma Sharma','6399080727','Hello, \n\nPlease confirm if you import pet food? We are in the process of identifying sources of pet food for our retail supply chain network who are looking for dog and cat food (kibble) for our retail chain customer. Whatsapp our team at +916399080727 to discuss. \n\nBest Regards, \nRicha','New','2026-06-10 19:13:57');
/*!40000 ALTER TABLE `enquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pet_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pet_id` (`pet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-11 11:20:15
