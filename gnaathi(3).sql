-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2017 at 06:40 PM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gnaathi`
--

-- --------------------------------------------------------

--
-- Table structure for table `acquisition`
--

CREATE TABLE `acquisition` (
  `acquisition_id` int(25) NOT NULL,
  `user_id` int(4) NOT NULL,
  `item_id` int(5) NOT NULL,
  `area` int(10) NOT NULL,
  `contact_no` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acquisitor`
--

CREATE TABLE `acquisitor` (
  `user_id` int(4) NOT NULL,
  `nic_no` varchar(10) NOT NULL,
  `area` varchar(200) NOT NULL,
  `contact_no` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acquisitor`
--

INSERT INTO `acquisitor` (`user_id`, `nic_no`, `area`, `contact_no`) VALUES
(2, '111111111v', '1', '0727701701'),
(3, '123456789v', '1', '0712345678');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category`) VALUES
(3, 'Ayurwedic'),
(4, 'Diseses'),
(5, 'Medicine'),
(6, 'sports'),
(7, 'yoga'),
(8, 'Healthcare'),
(9, 'Culture');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `message` varchar(100) NOT NULL,
  `friend_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `time`, `user_id`, `message`, `friend_id`) VALUES
(1, '2016-11-27 16:38:47', 3, 'hey regular im shihan', 2),
(2, '2016-11-27 16:38:51', 2, 'hey shihan im regular', 3),
(3, '2016-11-27 16:39:39', 2, 'what is up regular', 3),
(4, '2016-11-27 16:39:47', 3, 'nothing much shihan what about u', 2),
(5, '2016-11-27 16:40:54', 3, 'i was busy regular', 2),
(6, '2016-11-27 16:45:10', 2, 'shihan are u coming today? ', 3),
(7, '2016-11-27 16:45:34', 2, 'shihan let me know', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city_name`) VALUES
(1, 'Ambalangoda'),
(2, 'Ampara'),
(3, 'Anuradhapura'),
(4, 'Avissawella'),
(5, 'Badulla'),
(6, 'Balangoda'),
(7, 'Bandarawela'),
(8, 'Batticaloa'),
(9, 'Beruwala'),
(10, 'Chavakacheri'),
(11, 'Chilaw'),
(12, 'Colombo'),
(13, 'Dambulla'),
(14, 'Dehiwala-MountLavinia'),
(15, 'Embilipitiya'),
(16, 'Eravur'),
(17, 'Galle'),
(18, 'Gampaha'),
(19, 'Gampola'),
(20, 'Hambantota'),
(21, 'Haputale'),
(22, 'Harispattuwa'),
(23, 'Hatton'),
(24, 'Horana'),
(25, 'Ja-Ela'),
(26, 'Jaffna'),
(27, 'Kadugannawa'),
(28, 'Kalmunai'),
(29, 'Kalmunai'),
(30, 'Sainthamarathu'),
(31, 'Kalutara'),
(32, 'Kandy'),
(33, 'Kattankudy'),
(34, 'Katunayake'),
(35, 'Kegalle'),
(36, 'Kelaniya'),
(37, 'Kolonnawa'),
(38, 'Kuliyapitiya'),
(39, 'Kurunegala'),
(40, 'Mannar'),
(41, 'Matale'),
(42, 'Matara'),
(43, 'Minuwangoda'),
(44, 'Monaragala'),
(45, 'Moratuwa'),
(46, 'Nawalapitiya'),
(47, 'Negombo'),
(48, 'Nuwara'),
(49, 'Panadura'),
(50, 'Peliyagoda'),
(51, 'Point'),
(52, 'Puttalam'),
(53, 'Ratnapura'),
(54, 'Sigiriya'),
(55, 'SriJayawardanapura'),
(56, 'Talawakele'),
(57, 'Tangalle'),
(58, 'Trincomalee'),
(59, 'Valvettithurai'),
(60, 'Vavuniya'),
(61, 'Wattala'),
(62, 'Wattegama');

-- --------------------------------------------------------

--
-- Table structure for table `comment1`
--

CREATE TABLE `comment1` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment1`
--

INSERT INTO `comment1` (`comment_id`, `post_id`, `user_id`, `user_name`, `content`, `time`) VALUES
(195, 70, 2, 'regular', 'thank you good ideas', '2015-01-17 19:59:27'),
(196, 71, 3, 'shihan', 'good points', '2015-01-17 20:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email_add` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `email_add`, `name`, `comment`) VALUES
(69, 23, 'geethmadushankagamage@gmail.com', 'geeth', 'well'),
(70, 31, 'geethmadushankagamage@gmail.com', 'suriya', 'well'),
(71, 31, 'sd', 'sds', 'sdd'),
(72, 27, 'rr', 'ree', 'wewe'),
(73, 33, 'geethmadushankagamage@gmail.com', 'Kushan', 'How to Repealing Obamacare'),
(74, 33, 'geethmadushankagamage@gmail.com', 'Arun', 'well said'),
(75, 33, 'geeth@gmail.com', 'Geeth', 'yup'),
(76, 33, 'g@gmail.com', 'Kp', 'good'),
(77, 33, 'adadadad@gmail.com', 'Ara', 'why..???'),
(78, 32, 'geeth@gmail.com', 'Homi', 'finanaly'),
(79, 32, 'dadadad', 'Kasun', 'well'),
(80, 32, 'adad', 'geeth', 'what..???');

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `disease_id` int(4) NOT NULL,
  `description` longtext NOT NULL,
  `symptoms` longtext NOT NULL,
  `first_aid` longtext NOT NULL,
  `remedies` longtext NOT NULL,
  `prevention` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `reg_no` varchar(20) NOT NULL,
  `location` decimal(20,0) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `image` varbinary(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `disease_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `donation_id` int(25) NOT NULL,
  `user_id` int(4) NOT NULL,
  `item_id` int(5) NOT NULL,
  `count` int(10) NOT NULL,
  `area` int(10) NOT NULL,
  `contact_no` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`donation_id`, `user_id`, `item_id`, `count`, `area`, `contact_no`) VALUES
(28, 3, 1, 1, 1, 721234234);

-- --------------------------------------------------------

--
-- Table structure for table `donation_item`
--

CREATE TABLE `donation_item` (
  `item_id` int(5) NOT NULL,
  `item_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donation_item`
--

INSERT INTO `donation_item` (`item_id`, `item_name`) VALUES
(0, 'Wheelchair'),
(1, 'Crutches'),
(2, 'Shower Chair'),
(3, 'Inflatable Bed'),
(4, 'Blankets'),
(5, 'Books(To Read)'),
(6, 'Diabetic meter'),
(7, 'Walkers'),
(8, 'Rollators'),
(9, 'Blood pressure monitors');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `user_id` int(4) NOT NULL,
  `nic_no` varchar(10) NOT NULL,
  `area` varchar(200) NOT NULL,
  `contact_no` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`user_id`, `nic_no`, `area`, `contact_no`) VALUES
(2, '11111', '1', '1111'),
(3, '123456789v', '1', '0712345678');

-- --------------------------------------------------------

--
-- Table structure for table `friend_list`
--

CREATE TABLE `friend_list` (
  `id` int(10) NOT NULL,
  `user_id` int(4) NOT NULL,
  `friend_id` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friend_list`
--

INSERT INTO `friend_list` (`id`, `user_id`, `friend_id`) VALUES
(0, 2, 3),
(1, 6, 2),
(2, 3, 2),
(3, 3, 9),
(4, 3, 10),
(6, 3, 6),
(7, 10, 3),
(9, 6, 3),
(10, 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `medical_center`
--

CREATE TABLE `medical_center` (
  `user_id` int(4) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact_no` char(10) NOT NULL,
  `advertisement` varbinary(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(10) NOT NULL,
  `user_id` int(5) NOT NULL,
  `notification` varchar(511) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `old_notifications`
--

CREATE TABLE `old_notifications` (
  `notification_id` int(10) NOT NULL,
  `user_id` int(5) NOT NULL,
  `notification` varchar(511) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `old_notifications`
--

INSERT INTO `old_notifications` (`notification_id`, `user_id`, `notification`) VALUES
(64, 22, 'Elderly society happyfamily is organizing a Religious activityevent in your area on01/17/2017 51. You can participate and help the gnaathi family grow while enjoying the event. You can get the further details by contacting the number0727707707'),
(63, 19, 'Elderly society happyfamily is organizing a Religious activityevent in your area on01/17/2017 51. You can participate and help the gnaathi family grow while enjoying the event. You can get the further details by contacting the number0727707707');

-- --------------------------------------------------------

--
-- Table structure for table `post1`
--

CREATE TABLE `post1` (
  `post_id` int(11) NOT NULL,
  `user_id` int(4) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `likes` int(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post1`
--

INSERT INTO `post1` (`post_id`, `user_id`, `user_name`, `category`, `title`, `content`, `time`, `likes`) VALUES
(70, 3, 'shihan', 'op3', 'about health', 'Health Forum is a strategic business enterprise of the American Hospital Association', '2015-01-17 19:51:45.000000', NULL),
(71, 2, 'regular', 'op5', 'dengue pateint experience', 'View messages from patients providing insights into their medical experiences with Dengue Fever .Describe Your Experience with dengue', '2015-01-17 19:55:04.000000', NULL),
(72, 3, 'shihan', 'op0', 'cancer patient feeling', 'When you were first diagnosed, you may have had trouble believing or accepting the fact that you have cancer.', '2015-01-17 20:03:03.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `user_name`, `title`, `body`, `category`, `posted`) VALUES
(1, 1, 'geeth', 'Health-care spending increased at faster pace in \'15 as prices rose', 'Spending on health care for people who have private insurance accelerated last year,\n ending a two-year period of more modest spending growth, a new study finds.\r\n\r\nIn 2015,\n overall spending for people with private health insurance increased by 4.6 percent,\n according to the Health Care Cost Institute report. Most of that increase, again,\n was due to higher prices for prescription drugs and medical services, as opposed \n to increased use of either.\r\n\r\nIn contrast, overall health-care spending grew by just \n 2.6 percent in 2014. In 2013, health spending rose 3 percent, HCCI said.\r\n\r\nYear after \n year, we see one constant: Rising prices that are accelerating spending growth, said HCCI\n Executive Director David Newman.\r\nIn dollar terms, the average spending per capita for the\n privately insured was $5,141 in 2015, according to HCCI\'s report. Of that, an average of $813\n was spent out of pocket directly by insured people, in the forms of deductibles, co-payments \n and coinsurance. The rest was covered by their health insurance plans.\r\n\r\nHCCI noted that \n the out-of-pocket responsibility of the privately insured grew by just 3 percent, a slower rate \n than the overall growth in health spending.\r\n\r\nSpending on prescription drugs grew faster than \n that of any other health-care service in 2015, the report found.\r\n\r\nBrand-name medications saw \n the biggest spending jump, up 11.4 percent, with an average of $649 spent per capita on such drugs \n last year. Much of that increase came from hormones and specialty anti-infective drugs, including \n ones used to treat Hepatitis C and HIV, according to the report.\r\n\r\nIn contrast, spending on \n generic drugs grew by just 3.3 percent in 2015, to an average per-capita amount of $313.\r\n\r\nOther \n sectors flagged by HCCI in its report were prices for visits to emergency rooms, which rose by 10.5 \n percent in 2015, to an average price of $1,863. On the other hand, the number of ER visits actually \n declined for privately insured patients, according to the study.\r\nEven higher increases were seen \n in the prices of administered drugs, such as chemotherapy, which are given to patients directly by\n health-care providers. Prices for such medications jumped by 12.5 percent, up to an average of $535 \n last year.\r\n\r\nHCCI also noted that the average price an acute hospital admission has grown by an\n average of $1,000 each year from 2012 to 2015, ending with an average price of $19,967 last year.', 'Healthcare', '2016-11-27 10:18:01'),
(20, 2, 'geeth', 'Mosquitos Can Infect Humans with Zika and Chikungunya in One Bite', 'Mosquitos can carry and transmit Zika and chikungunya viruses simultaneously, according to \n findings presented today (November 14) at the 2016 annual meeting of the American Society of Tropical \n Medicine and Hygiene (ASTMH), held in Atlanta. The work is part of a growing body of research on overlapping\n outbreaks of mosquito-borne diseases.\r\n\r\nIn a laboratory experiment conducted by Colorado State University\n researchers, mosquitos that fed on blood containing Zika, chikungunya, and dengue viruses could carry Zika and \n chikungunya at the same time, and therefore, the insects could infect a person with both viruses in a single bite.\n â€œTheir saliva is clearly testing positive for both, which could mean that people bitten by this type of mosquito \n could be infected by both viruses at once,â€ Claudia RÃ¼ckert of Colorado State, who presented the finding at\n ASTMH, said in a press release. â€œWe need to understand more about what happens in both mosquitoes and people \n when all of these viruses are circulating in close proximity.â€\r\n\r\nIn another presentation, scientists \n reported on neurological complications observed during an unprecedented triple outbreak of Zika, chikungunya,\n and dengue in the city of Salvador-Bahia, Brazil, in 2015. â€œOur analysis shows that each of these viruses may\n have the potential to cause a range of neurological complications, some very severe, and patients should be monitored\n for symptoms,â€ Isadora Siqueira of the Oswaldo Cruz Foundation in Brazil said in the press release. \n â€œWhatâ€™s very difficult to determine is whether having a co-infection with two of these viruses increases \n the risk of neurological problems.â€\r\n\r\nThe interactions between these viruses remain unclear, but \n all three currently circulate in parts of the Americas and Asia, and a recent study in Nicaragua found \n substantial overlap between cases of the three infections.\r\n\r\nMeanwhile, additional research is underway \n to determine whether dengue antibodies enhance or block Zika infection. ', 'Diseses', '2016-11-27 10:20:04'),
(21, 3, 'kushan', 'Ayurveda and heart health â€“ Diet dos and donâ€™ts from an expert', 'Do you know that according to Ayurveda, the heart is the centre of Prana \n(life force)?  This is because the oxygen-rich blood and nutrients are \ntransported to different parts of the body through the heart. Also, not \nmany people know that everyone has different body types or Prakriti and the \nsusceptibility to suffer from a heart disease with specific symptoms is dependent\n on the Prakriti of the person. According to Ayurveda, Prakriti is a term used to\n describe the physical and mental makeup of a person. Dr Jaishree Bhattacharjee, \n Senior Ayurvedic Doctor, Dr Shikhaâ€™s NutriHealth explains about different prakritis,\n and the risk of suffering from a heart disease along with diet dos and donâ€™ts.\r\nVata \n Prakriti (air element)\r\nIf you belong to Vata Prakriti, then you are at a\n high risk of suffering from heart diseases that are manifested by changes in \n the heart rate or pain in the heart. These include heart attack, hypertension,\n abnormal heartbeat (arrhythmia) and weakness of the heart muscle. The major cause \n of this is excessive strain, anxiety, lack of sleep, stress and overwork.\r\nDiet\n dos and donâ€™ts:\r\n1. Avoid excessive intake of junk food or foods made from \n refined flour, particularly foods which are dry in nature, as it aggravates vata.\r\n2. \n Do not skip meals or overexert while exercising as it may further worsen your\n condition by disturbing vata balance in the body.\r\n3. Try to include Indian \n spices like fenugreek (methi), cinnamon (dalchini), mustard (rai), fennel (saunf) \n and cumin (jeera) in the diet as it helps you to maintain a proper balance of\n three doshas in the body.\r\n4. Make sure you add garlic in your meals as it \n helps in avoiding the aggravation of vata.\r\n5. To combat stress and anxiety \n and lower your risk of heart disease, you can take ashwagandha powder (3 gms) \n with milk every day.\r\nPitta Prakriti (Fire element)\r\nIf you are of Pitta \n Prakriti, then you are prone to heart disease that is indicated by swelling \n of the heart muscle with or without inflammation. In most cases, the cause of \n heart disease in people with pitta dosha is due to an underlying liver disorder\n or excessive heat in the body.\r\nDiet dos and donâ€™ts:\r\n1. Stay away from \n eating excessive spicy or fried foods as it will only trigger an inflammation \n putting your heart in trouble. Moreover, also restrict the intake of Pitta \n aggravating foods, which majorly include sour or salty foods such as papad \n and pickles.\r\n2. As tea, coffee and alcohol are heat inducing foods (stimulate \n excessive heat production), it is wise to replace these drinks with lemon water\n and green tea to keep the pitta levels in control.\r\n3. To make the most of\n your diet, include spices like turmeric (haldi), coriander (dhania), cumin (jeera)\n and fennel (saunf) to balance doshas and maintain a healthy heart.\r\n4. As \n far as herbs are concerned, you can have Arjun bark (3 gms) decoction with milk \n on a daily basis or take two tablespoons of aloe vera juice with two tablespoons \n of water on an empty stomach every day.\r\n5. For emotional well-being and\n anger management, you can practise pranayama or anulom vilom, which also helps\n to keep pitta levels under control.\r\nKaphaprakriti (Water element)\r\nLastly,\n if you fall under the Kapha dosha, then you are more at a risk of suffering from\n heart diseases that are characterised by an accumulation of fats (lipids) and calcium \n in the arteries or degenerated blood vessels. And this, in the long run, can lead to \n thickening and blockage of the blood vessels, leading to reduced supply of the blood \n to the heart. If you are of Kapha Prakriti, diseases like ischemic heart disease and \n coronary artery disease are quite common.\r\nDiet dos and donâ€™ts\r\n1. It is best to \n avoid oily foods and comfort foods like fries, chips, deep fried foods, if you are\n of Kapha Prakriti.\r\n2. To counteract the harmful effects on the heart in Kapha \n Prakriti people, it is better to indulge in a light form of exercises like brisk walking \n for 20 â€“ 25 minutes every day or five times a week. Also read about yoga for your heart\n â€“ 20 poses to keep it healthy\r\n3. If you are of Kapha Prakriti, your energy is moist, \n stable and cool and hence, to balance it, you have to eat foods which are warm, dry and \n easy-to-digest like fruits, green tea, broccoli, cabbage and dark leafy vegetables.\r\n4.\n As far as spices are concerned, you can include cinnamon (dalchini), black pepper (kali mirch)\n and dry ginger powder (soonth) in foods to deal with excess Kapha levels in the body.\r\n5. If \n you are planning to go the natural way, then you can have arjuna bark powder (3 gms) with honey two\n times a day or have trikatu powder (3 gms) with warm water, preferably after meals.\r\nImage Source:\n Shutterstock', 'Ayurwedic', '2016-11-27 10:23:55'),
(22, 4, 'homi', 'Zika-Associated Microcephaly Can Present After Birth', 'Nine baby \nboys and four baby girls with laboratory evidence of congenital Zika virus infection, \nwho did not appear to have microcephaly or related neurological conditions at birth, \nwent on to develop brain abnormalities associated with congenital Zika syndrome, researchers \nfrom Brazil and the U.S. reported today (November 22) in the Centers for Disease Control and \nPrevention (CDC)â€™s Morbidity and Mortality Weekly Report. While the babiesâ€™ at-birth head \ncircumferences did not meet the criteria for microcephaly diagnoses, upon later neurologic and \nneuroimaging evaluations at health care centers in Brazil, researchers identified Zika-associated \ncomplications.\r\n\r\nâ€œCongenital microcephaly has been a hallmark of intrauterine infection with \nZika virus,â€ the authors wrote in their report. â€œHowever, despite the absence of microcephaly\n at birth, the 13 infants in this report with laboratory evidence of Zika virus infection had brain \n abnormalities associated with congenital Zika syndrome, including ventriculomegaly and decreased brain\n volume, cortical malformations and subcortical calcifications, underscoring the importance of \n neuroimaging in evaluating these infants.â€\r\n\r\nOf the 13 infants studied, 11 went on to \n develop microcephaly, according to a CDC statement.\r\n\r\nâ€œThis report documents that microcephaly\n at birth is not an essential hallmark of congenital Zika syndrome. Infants with normal HC [head circumference] \n at birth have brain and other abnormalities associated with congenital Zika syndrome and might develop\n microcephaly after birth,â€ the authors added in their report. â€œThese findings demonstrate the importance\n of early neuroimaging for infants exposed to Zika virus prenatally and the need for comprehensive medical \n and developmental follow-up.â€\r\n\r\nFurther reading:\r\nâ€œResearchers Discuss Zikaâ€™s Effects on \n Child Development,â€ The Scientist, September 22, 2016\r\n\r\nâ€œHow Zika Infects Mother and Baby,â€ The Scientist,\n August 25, 2016\r\n\r\nâ€œWHO to People in Zika-Affected Areas: Consider Delaying Pregnancy,â€ The Scientist, June 10, \n 2016\r\n\r\nâ€œScientists Estimate Zika-Related Microcephaly Risk,â€ The Scientist, May 26, 2016', 'Diseses', '2016-11-27 10:25:11'),
(23, 5, 'shihan', 'Sports Medicine / Fitness Pediatrics / Children\'s Health Young Athletes: Injuries And Prevention', 'High profile events \nlike the Olympics bring the hope that witnessing and celebrating dedicated athletes at the top of their game, will inspire young \npeople to take up sport and physical activities that help them develop confidence, lead more satisfying lives, and not least, \nsecure long-term health by reducing their risk for developing chronic illness like diabetes, obesity, cancer and cardiovascular \ndiseases.\r\n\r\nBut unfortunately, if they don\'t take appropriate measures, young athletes can instead, end up in pain, on a \ndifferent path to poor health, due to avoidable sport injury. \r\n\r\nJames R. Andrews, a former president of the American Society \nfor Sports Medicine (AOSSM), said in May this year, the US has experienced a tremendous rise in the number of young people taking up\n sport. Estimates show 3.5 million children aged 14 and under receive medical treatment for sport-related injuries, while\n high-school athletes account for another 2 million a year.\r\n\r\nThis makes sports the leading cause of adolescent injury.\n Along with time away from school and work, these injuries can have far-reaching effects, said Andrews.\r\n\r\nThis article \n looks at some of the common and less common injuries in young athletes. It then reviews a new project that is tracking injuries \n in Olympic athletes, introduces some ideas about avoiding and minimizing injury, and finishes with a list of tips for \n preventing sport injury in children. Common Sport Injuries According to the National Institute of Arthritis and Musculoskeletal\n and Skin Diseases, which is part of the National Institutes of Health in the US, the most common sport injuries are due to \n accidents, poor training practices or using the wrong gear or equipment. People can also hurt themselves \nbecause they are not in shape, or because they don\'t warm up or stretch enough.\r\n\r\nSome injury experts in the US have \nsaid they are also seeing more and more young athletes injured because of overuse and doing too much, and this may partially \nexplain the growing numbers that drop out of sport by the eighth grade. The most common sports injuries are:\r\nKnee injuries,\n\r\nSprains and strains,\r\nSwollen muscles,\r\nAchilles tendon injuries,\r\nPain along the shin bone, and\r\nFractures and \ndislocations.', 'sports', '2016-11-27 10:27:45'),
(24, 6, 'shanika', 'Want to stay healthy into your 70s? Yoga can help you stay mobile and flexible', '(NaturalNews) Yoga is much more than \njust the latest health trend and was actually developed between 5,000 and 10,000 years ago, according to Yoga Basics. There \nare several reasons for its long history and increasing popularity â€“ which range from its ability to encourage a better\n nights sleep to tackling anxiety. Yoga can be a gentle way of getting back into exercise after an injury and a fantastic \n way to wind down after a hard day in the office.\r\n\r\nA recent news article by Daily Mail reveals that yoga is the reason \n 73-year-old yoga instructor Barbara Currie has maintained a youthful appearance, high levels of fitness and incredible posture.\n Currie has been practicing yoga since she was 29 and believes that back stretches in particular are a great way to improve your\n posture and defy your bodys natural aging process â€ preventing that common stoop pose that older people often suffer \n from.\r\n\r\nThere are many benefits to yoga, but if you\re thinking of starting to practice it for the first time, you might \n be feeling a little daunted. Yoga is actually relatively simple, and the health benefits are numerous â€“ almost everyone can \n achieve an improvement in their health and well-being by taking up yoga.\r\n\r\nPhysical benefits of yoga\r\nAccording to Yoga \n Journal many researchers are now accepting that yoga can improve many different health conditions and generally improve your \n lifestyle. The physical benefits and gentle nature of yoga make it great for almost everyone, no matter what your age or fitness\n level.', 'yoga', '2016-11-27 10:28:30'),
(25, 7, 'kasun', 'How to Survive Thanksgiving in a Postelection, Social Media World', 'So, its Thanksgiving, and youre back at home, \npassing the mashed potatoes to your Aunt Jenny, whom you havent seen in person in nearly a year. But you are friends with her \non Facebook, so you know quite a lot about her thoughts on the election. Like ... every thought. Way too many thoughts.\r\n\r\nHow\n do you reconcile the smiling woman across the table with the conservative warrior or liberal firebrand youve been seeing on social \n media? Is Aunt Jennys frothing Facebook persona her real self, or just a piece of her personality? And how do you talk to her \n if her views happen to fundamentally clash with yours?\r\n\r\nThe problem of political reconciliation around the Thanksgiving \n table is not a new one, but a particularly contentious and personal election, plus the ubiquity of social media, have made family \n harmony increasingly fraught.\r\n\r\n"I think people may have caused some damage in relationships just because of the way that they \n interacted on social media," said Jaclyn Cravens, a marriage and family therapist and assistant professor at Texas Tech University. \n "Now, the holidays are coming up, and we may potentially have to sit down face-to-face with these individuals. We dont have the \n option of unblocking, unfollowing, defriending." [The 6 Strangest Presidential Elections in US History]\r\n\r\nOnline versus in\n person\r\n\r\nFor more than a decade, psychologists have been documenting a phenomenon called the online disinhibition effect.\n As described in a 2004 paper, people "loosen up" online; theyre less restrained and more willing to express themselves openly.\n Sometimes, this is beneficial: People can show great kindness and generosity or open up about emotions and experiences that they \n otherwise might have kept hidden. Thats benign disinhibition. \nOther times, online disinhibition is terrible: People threaten each other, throw out insults and hurl abuse. Thats toxic \ndisinhibition.\r\n\r\nDisinhibition isnt the only way offline and online discussions can differ. A 2012 paper in the journal \nNew Media & Society â€” one of the few studies to directly compare internet and real-world discussions of political issues â€” \nfound that online participants of political dialogues were more likely to be male, younger and employed full time than those who \nattended public forums on politics in person. They were also less knowledgeable, less trusting, less tolerant and less interested \nin politics overall. Online discussion also appeared less likely to build consensus: Whereas 53 percent of offline-discussion \nparticipants said their last meeting ended in a decision to take an action, only 17 percent of online-only participants said the\n same.\r\n\r\nOf course, that study compared online discussions to formal political meetings, not around-the-table chats between\n citizens. In this regard, research shows that your Facebook feed is probably more likely to be flooded with political debate than \n your real-world conversations. In a 2012 study, researchers analyzed the 2008 election and found that people talked about politics \n pretty frequently: At least in the run-up to a national election, it was the most-discussed topic among family members and the \n second-most-discussed topic among nonfamily members. Nevertheless, the researchers found that people assiduously avoid political \n disagreements: Only 29 percent of pairs of people who disagreed with one another said they talk about politics frequently, compared \n with 71 percent of people who agreed with one another.', 'Culture', '2016-11-27 10:30:37'),
(26, 13, 'uthpala', 'Health care premiums will go up next year unless Obamacare is fixed, Aetna CEO says', 'As the future of Obamacare enters the \nnational spotlight under president-elect Donald Trump, health-care premiums will go up next year unless the system is fixed, Aetna\n CEO Mark Bertolini said Thursday.\r\n\r\nMost Americans hate their insurance and they hate the health-care system. It\'s unaffordable\n and it needs to be fixed, he said. You can\'t put [people] out on the street without insurance. \r\nBertolini spoke at the DealBook\n Conference in New York City, hosted by CNBC anchor and New York Times columnist Andrew Ross Sorkin and the editors of the newspaper.\n The conference focuses on playing for the long term in a business environment that\'s shackled to quarterly returns and compressed \n news cycles.\r\nBertolini\'s remarks came amid a U.S. election where health insurance has become a central issue. Trump, alongside many \n congressional Republicans, have called for repealing and replacing Obamacare.\r\nThe Affordable Care Act was built on a flawed model \n that required getting as many people as possible into the insurance system, Bertolini said. And he said he thinks the Republican Party \n will make good on its promise to repeal it. \r\nThere will be a repeal first, and I think the repeal will be at a minimum in name,\n Bertolini said. Because what\'s going to happen in the next year, we have people signed up, we have to honor that through 2017. We\'ll\n have to work quickly to have something for 2018. \r\nThe current health-care exchange mostly serves middle-aged people with pre-existing \n conditions, Bertolini said. If the Affordable Care Act is repealed, those people will need the support of Medicare but are too young.\n \r\nBertolini said some of those benefits should come down to ages like 55. Meanwhile, by changing the funding system of Medicaid expansion\n into a block grant to the states, it would be fairly simple to solve those gaps left by an ACA repeal.\r\nI can say with a lot of \n conviction and data that MedicareAdvantage,\n in the end analysis, is a lot cheaper and provides better care, Bertolini said. So if we\'re looking for a way to make entitlements \n work around the promises we\'ve made to seniors, we need to make that program more robust.\r\nBut Bertolini said he\'s unsure of \n exactly what Aetna\'s approach will be, because he didn\'t anticipate Trump\'s election.\r\nIf you were to look at our game board \n of all the possible outcomes of the election, this one wasn\'t even on the sheet,Bertolini said. We started with a fresh piece\n of paper yesterday. We had no idea how to approach it. We literally had to build out what would have taken us months if we thought \n it was possible.\r\nAs chief of one of the nation\'s largest insurers, Bertolini has been outspoken about the broken U.S. health-care \n system. \r\nIf we were to design [the system] over, I would suggest we design it with a definition of the best outcome being a \n productive individual, Bertolini told Institutional Investor last year.\r\nWhile the American system is unaffordable, much of that \n is also due to underlying heath-care costs and inequality, he said. Bertolini said that factors like poverty â€“ your ZIP code â€\n can cause unequal access to good health care. He said technology and the gig economy can help.\r\nWhat \n we should be doing in the future is bringing health care into your home, versus bringing to you in the medical industrial complex,he said.\n If you end up in the hospital, we\'ve failed.', 'Healthcare', '2016-11-27 10:34:12'),
(27, 11, 'geeth', 'As the future of Obamacare enters the national spotlight under president-elect Donald Trump, ', 'Chronic cold is a common ailment. When you have sneezing, watery discharge from the nose (runny nose), itchy or congested nose with watery, red eyes for more than an hour, it can be termed can be termed as persistent rhinitis. House dust and allergy to pets or other animals are the most common causes of persistent rhinitis. But before you pop antibiotics, read up on why taking antibiotics for cold and cough is a bad idea. Alternative medicines are an ideal way to treat this chronic condition. Dr Rahul Dogra, Operations Manager at the Kairali Ayurvedic Centre, Mumbai, tells us how Ayurveda can help treat persistent rhinitis or chronic cold.\r\nIn Ayurveda, rhinitis or cold is referred to as Vata-Kaphaja Pratishaya. Ama (toxins), Asatmya (any change in the environment around the individual) and virudh ahar (wrong combination foods) results in cold or allergic conditions. Ama is the product of impaired digestion and metabolism.  Wrong food combinations\n (Virudh Ahar) having antagonist properties like fish with milk, fruit juice with milk, clarified butter with honey, ice cream after night meals, leads to allergy.\r\nAyurvedic treatment for persistent rhinitis/chronic cold\r\nIf the symptoms are severe and chronic, Vamana Panchakarma treatment, followed by Virechana is administered. This helps to relieve Ama and balance Tridosha. For those who donÃ¢Â€Â™t have digestion issues, Nasya treatment (nasal drops therapy) is administered with herbal oils such as Anu taila or Shadbindu taila.\r\nAfter the Panchakarma treatment, Ayurvedic medicines are administered to improve respiratory immunity and strength of upper respiratory tract. Here are some natural remedies to boost your immune system.\r\nAyurvedic medicines that are helpful to treat chronic cold or persistent rhinitis are:\r\nMahalaxmi vilas Ras\r\nKanakasavam\r\nVasarishtam\r\nVasavleham\r\nSitopaladi Choornam with honey\r\nTaalisapatradi Choornam with honey', 'Healthcare', '2016-11-29 02:09:33'),
(28, 13, 'supun', 'Fully Implanted Brainâ€“Computer Interface in a Locked-In Patient with ALS', 'Locked-in syndrome is characterized by a loss of voluntary muscular control, resulting in quadriplegia and aphonia, with retention of normal cognition.1 The syndrome is typically linked to brainstem stroke, but degenerative disorders such as ALS, which affects approximately 5 persons per 100,000 population,2 progress to the same state.3 Despite their predicament, people in the locked-in state often report a high quality of life,4 which is correlated with the ability to communicate.5 Current strategies for communication depend mainly on eye movements that are followed by a camera, which enables selection of items on a computer screen (â€œeye trackerâ€); when that fails, communication may depend on eye movements or blinks in response to closed-ended questions, which limits the options for independent and private communication.\r\nRecent developments in brainâ€“computer interfaces capitalize on the neuroelectrical properties of the brain and the localized somatic activation by these brain regions.6,7 These systems take advantage of the observation that mental acts, such as an attempt to move a limb, lead to reproducible signals in corresponding cortical regions.8 The detection of signals from the cortex requires computational processing to separate (â€œdecodeâ€) them from background noise. Decoding of sufficient quality provides the input for a computer system that directs typing software, thereby enabling communication.9\r\nDecoding of neuronal signals from brain implants has yielded achievements such as the control of a robotic or paralyzed limb by patients with quadriplegia.10-12 In spite of such achievements, it is difficult to implement independent communication for daily use at home. To accomplish this, a brainâ€“computer interface \nmust allow for user autonomy and continuous functionality and must reliably detect only intended actions.13 Furthermore, permanent availability of the interface for communication requires sensors that are connected to the cerebral cortex but do not cause discomfort\n or disfiguration.14\r\nWe report on a communication system that involves a totally implantable brainâ€“computer interface for home use \nby a locked-in patient with ALS. The implant, combined with automated decoding software, enabled independent communication with the use of typing software.', 'Medicine', '2016-11-27 10:37:28'),
(29, 9, 'kamal', 'Ebola Can Persist 19 Months in Semen, Study Finds', 'Ebola virus remains present in semen much longer than previously recognized, according to a study involving more than 400 men. The paper reporting the results was published in The Lancet Global Health on Tuesday (August 30). In one patient, researchers detected viral RNA 565 days after the patient recovered from symptoms. Previously, researchers believed Ebola virus lasted in semen up to nine months after recovery, STAT News reports.\r\n\r\nEbola can persist in a variety of tissues where the immune system is less active, even after the virus is no longer\n detectable in the blood stream. The virus might be transmitted after months of lying low, potentially sparking an outbreak in an area thought to be clear of Ebola. Ã¢Â€ÂœA documented case of sexual transmission in Liberia six months after acute Ebola virus disease, along with accumulating evidence of similar events, remind us that even low levels of virus can result in transmission,Ã¢Â€Â wrote Daniel Bausch and Ian Crozier in a commentary.\r\n\r\nThe genetic testing in the study could not ascertain whether RNA fragments persisting in semen came from a live, infectious virus. As Bausch and Crozier noted, the results should therefore be Ã¢Â€Âœinterpreted with caution.Ã¢Â€Â Regardless, the World Health Organization (WHO) has advised all male Ebola survivors be tested monthly until they test negative for Ebola twice.\r\n\r\nThe study was based on testing done by LiberiaÃ¢Â€Â™s MenÃ¢Â€Â™s Health Screening Program, which Bausch and Crozier say Ã¢Â€Âœwill have broad importance and provides opportunity for strengthening health systemsÃ¢Â€Â as the country works toward preventing future Ebola outbreaks. ', 'Diseses', '2016-12-01 01:44:37'),
(30, 13, 'tharindu', 'Health care executive: Trump could either repeal or restructure Obamacare', 'Health care changes ahead: CEO 	Health care changes ahead: CEO  \r\nThursday, 10 Nov 2016 | 6:50 AM ET | 01:25\r\nTo Centene Chairman and CEO Michael Neidorff, there is no question that the Affordable Care Act needs fixing.\r\n\r\nIn response to Donald Trumps promise to repeal Obamacare, Neidorff said that while the system has been successful for Centene, which focuses on government-sponsored health-care programs, its structural pitfalls leave much to be desired.\r\n\r\n"You could do it either way. You could start over, or you could look at what you have now and say, What are the fundamental issues? And there are structural issues: number of tiers, whos covered, whats happening, and you can repair it," Neidorff told CNBCs "Squawk Box" on Thursday.\r\n\r\nAlthough Obamacare only covers a small portion of Centenes business  less than 5 percent of nearly 11.5 million people  Neidorff said the rest of its wide-ranging coverage cannot go ignored by the Trump administration.\r\n\r\n"Whatever they want to do, its not something they\re going to be able to do tomorrow morning," the CEO said. "Because you do have over 20 million lives covered, and you need to work through that, not just drop them, but figure out what you\re moving them to."', 'Healthcare', '2016-12-01 02:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `reaserch_person`
--

CREATE TABLE `reaserch_person` (
  `user_id` int(4) NOT NULL,
  `field` varchar(20) NOT NULL,
  `post` varbinary(10000) NOT NULL,
  `date` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `thread_id` int(5) NOT NULL,
  `user_id` int(4) NOT NULL,
  `time` timestamp NOT NULL,
  `content` varbinary(20000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `thread_id` int(5) NOT NULL,
  `user_id` int(4) NOT NULL,
  `time` timestamp NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` varbinary(20000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(5) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_type` int(1) NOT NULL,
  `area` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `email`, `password`, `user_type`, `area`) VALUES
(1, 'admin', 'shihananuruddha@gmail.com', '123456', 10, 0),
(23, 'shihananuruddha', 'shihananuruddha1@gmail.com', '1234567', 1, 12),
(22, 'dulshapremarathna', 'dulshapremarathna@gmail.com', '1234567', 3, 17),
(21, 'shanikaupamali', 'shanikaupamali@gmail.com', '1234567', 2, 7),
(20, 'geethmadushanka', 'geethmadushanka@gmail.com', '1234567', 1, 17),
(19, 'kushankavinda', 'kushankavinda@gmail.com', '1234567', 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user_like_event`
--

CREATE TABLE `user_like_event` (
  `table_raw_id` int(10) NOT NULL,
  `event_id` int(5) NOT NULL,
  `user_id` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_like_event`
--

INSERT INTO `user_like_event` (`table_raw_id`, `event_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 12),
(3, 1, 12),
(4, 1, 12),
(5, 1, 12),
(6, 1, 12),
(7, 1, 12),
(8, 1, 12),
(9, 2, 3),
(10, 3, 3),
(11, 3, 3),
(12, 2, 3),
(13, 2, 3),
(14, 1, 12),
(15, 2, 3),
(16, 3, 3),
(17, 1, 12),
(18, 2, 12),
(19, 2, 3),
(20, 2, 3),
(21, 1, 12),
(22, 1, 12),
(23, 3, 2),
(24, 3, 2),
(25, 1, 12),
(26, 1, 12),
(27, 1, 12),
(28, 1, 12),
(29, 2, 3),
(30, 3, 3),
(31, 1, 12),
(32, 2, 12),
(33, 3, 12),
(34, 2, 12),
(35, 2, 12),
(36, 2, 12),
(37, 3, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acquisition`
--
ALTER TABLE `acquisition`
  ADD PRIMARY KEY (`acquisition_id`),
  ADD KEY `user_id` (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `acquisitor`
--
ALTER TABLE `acquisitor`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`reg_no`),
  ADD KEY `disease_id` (`disease_id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`donation_id`),
  ADD KEY `user_id` (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `donation_item`
--
ALTER TABLE `donation_item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `friend_list`
--
ALTER TABLE `friend_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- Indexes for table `medical_center`
--
ALTER TABLE `medical_center`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `old_notifications`
--
ALTER TABLE `old_notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `reaserch_person`
--
ALTER TABLE `reaserch_person`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`time`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acquisition`
--
ALTER TABLE `acquisition`
  MODIFY `acquisition_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `donation_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `old_notifications`
--
ALTER TABLE `old_notifications`
  MODIFY `notification_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
