-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 25, 2019 at 01:36 AM
-- Server version: 5.6.30
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_user`
--

CREATE TABLE IF NOT EXISTS `cart_user` (
  `id` int(11) NOT NULL,
  `ten_user` varchar(50) NOT NULL,
  `sanpham` varchar(1000) NOT NULL,
  `gia` int(11) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_user`
--

INSERT INTO `cart_user` (`id`, `ten_user`, `sanpham`, `gia`, `soluong`) VALUES
(5, 'anhcoi1995', 'Huawei Mate 20 (1)\n', 15990000, 1),
(32, 'ga123', 'Huawei Mate 20 (1)\nHuawei Novo 3i (7)\n', 22289000, 8);

-- --------------------------------------------------------

--
-- Table structure for table `manufactures`
--

CREATE TABLE IF NOT EXISTS `manufactures` (
  `manu_ID` int(150) NOT NULL,
  `manu_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `manu_img` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manufactures`
--

INSERT INTO `manufactures` (`manu_ID`, `manu_name`, `manu_img`) VALUES
(1, 'samsung', ' ss.jpg'),
(2, 'asus', 'asus.jpg'),
(3, 'oppo', 'oppo.jpg'),
(4, 'apple', 'apple.jpg'),
(5, 'huawei', 'huawei.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `manu_ID` int(11) NOT NULL,
  `type_ID` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `description`, `manu_ID`, `type_ID`) VALUES
(1, 'Galaxy Note10| 10+', 27000000, 'ssnote10.jpg', 'Galaxy Note10 và Note10+ được thiết kế với trải nghiệm tuyệt đỉnh như máy tính, điều khiển game cầm tay, film studio và bút thông minh, tất cả hội tụ trong một thiết bị.', 1, 1),
(2, 'ASUS VivoBook 15 A512DA\r\n', 12900000, 'asusvivobook15.jpg', 'Bất kể là dành cho công việc hay giải trí, ASUS VivoBook 15 luôn là mẫu máy tính xách tay nhỏ gọn làm bạn đắm chìm trong mọi tình huống sử dụng. Màn hình NanoEdge không viền trên bốn cạnh mới tự hào với viền siêu mỏng 5,7mm, đem đến tỷ lệ màn hình trên thân máy 88% đầy ấn tượng cho hình ảnh đắm chìm vượt trội. Thiết kế bản lề ErgoLift mới còn nâng bàn phím lên tới vị trí gõ phím thoải mái hơn. VivoBook 15 với nguồn sức mạnh đến từ bộ vi xử lý AMD Ryzen™ 7 mới nhất cùng với card đồ họa rời Radeon™ RX 540X và ổ lưu trữ kép sẽ giúp bạn hoàn thành mọi tác vụ một các đơn giản nhất. Hơn thế nữa, mẫu máy tính này còn có sẵn theo bốn màu sắc hoàn thiện độc đáo để phù hợp với phong cách của bạn.', 2, 2),
(3, 'OPPO F11', 6290000, 'oppo-f11-mtp-400x460.jpg', 'Với các nhà sản xuất smartphone thì màn hình giọt nước để chứa camera selfie đang là xu hướng mới mẻ và vẫn tiếp tục phát triển.', 3, 1),
(4, 'Apple iPhone 7 128GB', 5990000, 'iphone.jpg', 'iPhone 7 32 GB vẫn mang trên mình thiết kế quen thuộc của từ thời iPhone 6 nhưng có nhiều thay đổi lớn về phần cứng như trang bị khả năng chống nước, dàn loa stereo và cấu hình cực mạnh.', 3, 1),
(5, 'HUAWEI P30', 16000000, 'huaweip30.jpg', 'Sáng hơn, rộng hơn và gần hơn. Chiêm ngưỡng thế giới từ những góc nhìn mới. Khám phá nhiều bất ngờ mới mẻ và ghi lại những ký ức khó phai. Điện thoại HUAWEI P30 đang tạo nên chuẩn mực mới trong công nghệ chụp ảnh bằng điện thoại thông minh.', 1, 5),
(6, 'Laptop Asus TUF Gaming FX505DD-AL186T', 18990000, 'asus-fx-505-1.jpg', 'Mặc dù có kích thước nhỏ gọn, FX505 mang trên mình đầy đủ sức mạnh của một chiếc máy tính để bàn đích thực. Mẫu máy này được tiếp sức mạnh từ bộ vi xử lý lên đến sáu nhân Intel® Core™ i7-8750H thế hệ thứ 8 với tốc độ lên đến 3,9GHz. Với sáu nhân và mạnh hơn 23% so với thế hệ tiền nhiệm, bộ vi xử lý mới nhất này cho phép xử lý đa nhiệm nhanh hơn, hiệu quả hơn, bao gồm chơi game, ghi hình và phát trực tiếp cùng lúc. FX505 còn được trang bị đồ họa lên đến NVIDIA® GeForce® GTX 1060 cho hình ảnh sống động và trải nghiệm chơi game siêu mượt mà.', 2, 2),
(7, 'iPhone 11 Pro', 43990000, 'f3_800x450.jpg', 'Màn hình tràn viền Super Retina XDR 5.8 inch\r\nVới thiết kế kiểu dáng màn hình mới này có kết cấu không khác Iphone X với hình ảnh tượng trưng "tai thỏ" quen thuộc.\r\n\r\nThiết kế màn hình OLED Super Retina bên cạnh kiểu dáng tràn viền cao cấp mang đến hình ảnh chân thực hơn làm cho mọi thứ trông thật tuyệt vời, trải nghiệm thật thú vị.\r\n\r\nMột điểm nâng cấp đến từ Iphone 11 Pro và Pro max so với Iphone 11 chính là màn hình tích hợp HDR mang đến hình ảnh sắc nét, chân thực vô cùng.', 4, 1),
(8, 'Samsung Galaxy A50', 6990000, 'samsung-galaxy-a50-black-600x600.jpg', 'Cảm biến vân tay ngay dưới màn hình, tương lai của công nghệ bảo mật\r\nThiết kế của Galaxy A50 trở nên liền lạc hơn khi cảm biến vân tay được tích hợp ngay trên màn hình. Phương thức bảo mật tưởng như chỉ có trong tương lai đã xuất hiện trên A50. Chỉ một lần chạm vào màn hình, điện thoại của bạn đã mở khóa ngay lập tức, vô cùng tiện lợi và an toàn.\r\n\r\nChụp ảnh chuyên nghiệp bằng 3 camera sau\r\nSamsung Galaxy A50 được trang bị tới 3 camera sau với 3 vai trò khác nhau, thể hiện rõ sự chuyên nghiệp trong nhiếp ảnh. Camera chính có độ phân giải 25MP khẩu độ lớn f/1.7 chụp đêm đẳng cấp; camera đo độ sâu 5MP và đặc biệt là camera góc siêu rộng 8MP. Dù là trong bất kỳ hoàn cảnh nào thì Galaxy A50 cũng đều mang đến những bức ảnh đẹp và khác biệt.', 1, 1),
(9, 'OPPO Find X\r\n', 12900000, 'oppo-find-x.jpg', 'Thiết kế đến từ tương lai\r\nChiếc điện thoại OPPO mới đã tạo nên sự khác biệt cho riêng mình nhờ lối thiết kế dạng trượt phần camera giúp không gian hiển thị mặt trước chiếm gần như là trọn vẹn.\r\n\r\nTổng thể thân máy được làm sắc sảo đến từng chi tiết trong sự kết hợp hài hòa giữa khung kim loại và 2 mặt kính cao cấp.\r\nSức mạnh đến từ con chip Snapdragon 845 cùng 8 GB RAM sẽ là thông số đáng mơ ước trên một chiếc smartphone và nay đã có mặt trên OPPO Find X.', 3, 1),
(10, 'Iphone X', 21490000, 'iphonex.jpg', 'Hiệu năng của những chiếc iPhone chưa bao giờ là vấn đề và với iPhone X thì mọi thứ vẫn rất ấn tượng.\r\n\r\nCon chip Apple A11 Bionic 6 nhân kết hợp với 3 GB RAM thì iPhone X tự tin là chiếc smartphone mạnh mẽ nhất mà Apple từng sản xuất.Đặc điểm nổi bật của iPhone X 64GB\r\n\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nBộ sản phẩm chuẩn: Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp, Cây lấy sim\r\n\r\niPhone X là cụm từ được rất nhiều người mong chờ muốn biết và tìm kiếm trên Google bởi đây là chiếc điện thoại mà Apple kỉ niệm 10 năm iPhone đầu tiên được bán ra.\r\nThiết kế mang tính đột phá\r\nNhư các bạn cũng đã biết thì đã 4 năm kể từ chiếc điện thoại iPhone 6 và iPhone 6 Plus thì Apple vẫn chưa có thay đổi nào đáng kể trong thiết kế của mình.\r\n\r\nThiết kế đột phá của điện thoại iPhone X\r\n\r\nNhưng với iPhone X thì đó lại là 1 câu chuyện hoàn toàn khác, máy chuyển qua sử dụng màn hình tỉ lệ 19.5:9 mới mẻ với phần diện tích hiển thị mặt trước cực lớn.\r\n\r\nThiết kế đột phá của điện thoại iPhone X\r\n\r\nMặt lưng kính hỗ trợ sạc nhanh không dây cũng như phần camera kép đặt dọc cũng là những thứ đầu tiên xuất hiện trên 1 chiếc iPhone.\r\n\r\nMàn hình với tai thỏ\r\nĐiểm khiến iPhone X bị chê nhiều nhất đó chính là phần "tai thỏ" phía trên màn hình, Apple đã chấp nhận điều này để đặt cụm camera TrueDepth mới của hãng.\r\n\r\nMàn hình tai thỏ của điện thoại iPhone X\r\n\r\nMàn hình kích thước 5.8 inch độ phân giải 1125 x 2436 pixels đem đến khả năng hiển thị xuất sắc.\r\n\r\nMàn hình tai thỏ của điện thoại iPhone X\r\n\r\niPhone X sử dụng tấm nền OLED (được tinh chỉnh bởi Apple) thay vì LCD như những chiếc iPhone trước đây và điều này đem lại cho máy 1 màu đen thể hiện rất sâu cùng khả năng tái tạo màu sắc không kém phần chính xác.\r\n\r\nFace ID tạo nên đột phá\r\nTouch ID trên iPhone X đã bị loại bỏ, thay vào đó là bạn sẽ chuyển qua sử dụng Face ID, một phương thức bảo mật sinh trắc học mới của Apple.\r\n\r\nFace ID tạo nên đột phá trên điện thoại iPhone X\r\n\r\nVới sự trợ giúp của cụm camera TrueDept thì iPhone X có khả năng nhận diện khuôn mặt 3D của người dùng từ đó mở khóa chiếc iPhone một cách nhanh chóng.\r\n\r\nFace ID tạo nên đột phá trên điện thoại iPhone X\r\n\r\nTuy sẽ hơi hụt hẫng khi Touch ID đã quá quen thuộc trên những chiếc iPhone như tốc độ cũng như trải nghiệm "khóa như không khóa" của Face ID hoàn toàn có thể khiến bạn yên tâm sử dụng.\r\n\r\nĐiện thoại iPhone X tích hợp Face ID\r\n\r\nThao tác vuốt và vuốt\r\nKhông còn phím Home cứng nên các thao tác trên iPhone X cũng hoàn toàn khác so với những đàn anh đi trước.\r\n\r\nThao tác vuốt và vuốt trên điện thoại iPhone X\r\n\r\nGiờ đây chỉ với thao tác vuốt và vuốt từ cạnh dưới là bạn đã có thể truy cập vào đa nhiệm, trở về màn hình Home một cách nhanh chóng.\r\n\r\nCamera kép cải tiến tích hợp Animoji\r\niPhone X vẫn sở hữu bộ đôi camera kép có cùng độ phân giải 12 MP nhưng camera tele thứ 2 với khẩu độ được nâng lên mức f/2.4 so với f/2.8 của iPhone 7 Plus.\r\n\r\nĐiện thoại iPhone X tích hợp camera kép\r\n\r\nNgoài ra thì cả 2 camera trên iPhone X đều sở hữu cho mình khả năng chống rung quang học giúp bạn dễ dàng bắt trọn mọi khoảnh khắc trong cuộc sống.\r\n\r\nĐiện thoại iPhone X tích hợp camera kép\r\n\r\nCamera trước độ phân giải 7 MP với khả năng selfie xóa phông đáp ứng tốt mọi nhu cầu tự sướng của giới trẻ hiện nay.\r\n\r\nĐiện thoại iPhone X tích hợp camera kép\r\n\r\nBộ đôi camera trên iPhone X được đánh giá rất cao về chất lượng ảnh chụp và là một trong những chiếc camera phone chụp ảnh đẹp nhất trong năm 2017.\r\n\r\nHiệu năng mạnh mẽ với Apple A11\r\nHiệu năng của những chiếc iPhone chưa bao giờ là vấn đề và với iPhone X thì mọi thứ vẫn rất ấn tượng.\r\n\r\nCon chip Apple A11 Bionic 6 nhân kết hợp với 3 GB RAM thì iPhone X tự tin là chiếc smartphone mạnh mẽ nhất mà Apple từng sản xuất.\r\n\r\nĐiện thoại iPhone X có hiệu năng mạnh mẽ\r\n\r\nNgoài ra với iPhone X thì Apple cũng nhấn mạnh với trải nghiệm thực tế ảo tăng cường giúp bạn có những phút giây thư giãn thú vị.\r\n\r\nĐiện thoại iPhone X có hiệu năng mạnh mẽ\r\n\r\nViên pin trên iPhone X có dung lượng 2716 mAh (lớn hơn cả trên iPhone 8 Plus) cho bạn sử dụng khá ổn trong khoảng một ngày liên tục.', 3, 1),
(11, 'Apple ipad wifi 32GB', 6990000, 'ipad.jpg', 'Sức mạnh tuyệt đối từ chip A10 Fusion\\r\\nSức mạnh chính là điểm nâng cấp lớn nhất trên iPad 2018 khi sở hữu con chip Apple A10 Fusion cực mạnh. A10 Fusion được sản xuất trên kiến trúc 64 bit, bao gồm 4 lõi và tới 3,3 tỷ bán dẫn. Con chip này giúp cho iPad của bạn có tốc độ cực nhanh. Dù là làm những tác vụ nặng như chỉnh sửa video 4K hay chơi các game đồ họa 3D phức tạp, iPad 2018 đều thực hiện một cách vô cùng mượt mà.\\r\\nDễ dàng đa nhiệm đa cửa sổ\\r\\niPad 2018 đủ mạnh để bạn có thể mở rất nhiều ứng dụng cùng lúc. Với tính năng chia màn hình, bạn sẽ làm việc và giải trí hiệu quả hơn khi mở hai ứng dụng ở hai cửa sổ hiển thị trên màn hình. Ví dụ bạn có thể vừa lướt web lại vừa gọi FaceTime với bạn bè một cách thú vị.\\r\\nTương thích với bút Apple Pencil\\r\\niPad 2018 tương thích với bút cảm ứng thông minh Apple Pencil, một phụ kiện độc đáo thỏa mãn đam mê sáng tạo của bạn. Mọi ý tưởng, hình vẽ, ghi chú, ... đều sẽ được thể hiện nhanh chóng trên iPad 2018 thông qua Apple Pencil. Cây bút này mang đến độ chính xác và phản hồi hoàn hảo, để mọi thao tác của bạn đều diễn ra một cách tự nhiên.\\r\\nMàn hình lớn 9,7 inch Retina tuyệt đẹp\\r\\nMàn hình 9,7 inch Retina của iPad 2018 hiển thị đẹp và sắc nét, giúp bạn luôn cảm thấy dễ chịu khi nhìn vào. Với một màn hình kích thước cực lớn, bạn có thể làm được nhiều việc hơn, giải trí vui vẻ hơn. Dù là kiểm tra email, trình chiếu slide hay chơi game, xem phim, iPad 2018 cũng đem lại sự hứng khởi đặc biệt.\\r\\n\\r\\nThiết kế cao cấp, luôn bên bạn khắp mọi nơi\\r\\nĐược chế tác tỉ mỉ từ nhôm nguyên khối và kiểu dáng hiện đại, iPad 2018 là chiếc máy tính bảng có thiết kế cao cấp. Trọng lượng siêu nhẹ 469 gram và độ mỏng chỉ 7,5mm giúp cho iPad 2018 cực kỳ cơ động, dễ dàng mang đi khắp mọi nơi đồng thời sử dụng thoải mái trên tay. Sẽ có 3 màu sắc thời trang trên iPad 2018 là bạc, xám không gian và vàng champagne.\\r\\n\\r\\nSử dụng đến hơn 10 tiếng chỉ sau một lần sạc đầy\\r\\niPad 2018 có thể bên bạn cả ngày với thời lượng pin tuyệt vời. Chỉ sau một lần sạc, chiếc iPad 2018 sẽ hoạt động liên tục được trong 10 tiếng (không tính thời gian chờ). Nghĩa là nếu kết hợp với thời gian chờ trong nhu cầu sử dụng bình thường, iPad 2018 sẽ dùng được trong 2 – 3 ngày.\\r\\nHai camera tuyệt vời, cho bạn nhiều điều hơn là chỉ chụp ảnh\\r\\nCamera trước và sau trên iPad 2018 không chỉ chụp được những bức ảnh chất lượng mà còn có thể quay video, scan tài liệu, gọi FaceTime hay thậm chí phác thảo các dự án dựa trên sử dụng công nghệ thực tế tăng cường AR. Camera chính độ phân giải 8MP với rất nhiều tính năng và chụp hình chất lượng; trong khi đó camera trước có khả năng gọi điện FaceTime HD, phương thức giao tiếp vui vẻ cùng bạn bè và người thân', 3, 3),
(12, 'SamSung Galaxy A80', 11900000, 'ss-glx-a80.jpg', 'Samsung A80 là chiếc điện thoại dẫn đầu kỷ nguyên mới với màn hình vô cực hoàn hảo, camera trượt xoay 180 độ độc đáo, cảm biến vân tay trong màn hình và những đột phá đầy ấn tượng.', 1, 1),
(13, 'Huawei MediaPad T5 10', 5690000, 'ipad-huawei.png', 'Huawei MediaPad T5 10 là một chiếc máy tính bảng bắt mắt với thiết kế tinh tế. Toàn bộ phần khung của sản phẩm sử dụng chất liệu kim loại chắc chắn, được chế tác đối xứng mang lại cảm giác cầm nắm cao cấp và kiểu dáng đẹp. Các chi tiết trên Huawei MediaPad T5 10 được hoàn thiện một cách cẩn thận mang tới sự yên tâm hơn cho người dùng trong quá trình sử dụng. Bên cạnh đó, trọng lượng sản phẩm khá nhẹ (khoảng 460g) sẽ đảm bảo bạn có thể dễ cầm và mang nó đi tới bất cứ nơi đâu.\\r\\n\\r\\n\\r\\nMàn hình Full HD 1080p tuyệt đẹp\\r\\nHuawei MediaPad T5 10\\r\\n\\r\\nHuawei MediaPad T5 10 đi kèm với màn hình 10,1 lớn hứa hẹn cung cấp cho người dùng một không gian rộng rãi để giải trí. Màn hình có độ phân giải Full HD 1920 x 1200 pixel sắc nét, công nghệ LCD và tỷ lệ khung hình 16: 10 rất phù hợp để bạn xem phim, duyệt web hay xem các chương trình TV.\\r\\n\\r\\n\\r\\nLoa kép, âm thanh mạnh mẽ\\r\\nHuawei MediaPad T5 10\\r\\n\\r\\nĐể mang lại trải nghiệm tốt nhất dành cho người dùng, nhà sản xuất trang bị cho Huawei MediaPad T5 10 hệ thống loa kép với âm thanh mạnh mẽ, chất lượng cao. Bên cạnh đó, công nghệ âm thanh Huawei Histen giúp mọi thứ phát ra trên máy tính bảng trở nên phong phú hơn, tuyệt vời hơn.\\r\\n\\r\\n\\r\\nBộ xử lý mạnh mẽ, hiệu suất đáp ứng\\r\\nHuawei MediaPad T5 10\\r\\n\\r\\nVà chắc chắn Huawei MediaPad T5 10 sẽ làm hài lòng bạn trong mọi trải nghiệm hằng ngày nhờ chip xử lý 8 nhân Kirin 659 \\"cây nhà lá vườn\\" với xung nhip tối đa lên tới 2.36 GHz. SoC này vừa cung cấp hiệu năng tuyệt vời trong khi lại tiêu thụ ít năng lượng hơn. Máy tính bảng sẽ đi kèm với 3GB RAM và 32GB dung lượng lưu trữ. Bạn cũng có thể dễ dàng mở rộng thêm bộ nhớ tối đa 256 GB bằng thẻ nhớ microSD', 5, 4),
(14, 'Điện thoại Samsung Galaxy S10+ (512GB)', 22990000, 'ss10+.jpg', 'Thiết kế mới mang lại cho người dùng trải nghiệm mới mẻ và có lẽ Samsung sẽ là hãng đầu tiên khơi mào cho phong cách thiết kế camera trong Ngoài ra màn hình của S10 được cải tiến nhờ tấm nền Dynamic AMOLED cùng công nghệ HDR10+ giúp hình ảnh sáng, rực rỡ hơn, tối ưu mọi chi tiết hình ảnh được hiển thị.\r\n\r\nMàn hình S10 còn đặc biệt ở thiết kế, chứa camera selfie nằm bên trong màn hình độc nhất vô nhị. Kiểu thiết kế này được Samsung ưu ái gọi là "Infinity-O".\r\n\r\nCảm biến vân tay siêu âm bên dưới màn hìnhmàn hình sau này.', 1, 1),
(15, 'SamSung Galaxy S9', 16990000, 'sss9.jpg', 'Mang lại sự cải tiến đặc biệt trong cây bút S Pen, siêu phẩm Samsung Galaxy Note 9 còn sở hữu dung lượng pin khủng lên tới 4.000 mAh cùng hiệu năng mạnh mẽ vượt bậc, xứng đáng là một trong những chiếc điện thoại cao cấp nhất của Samsung.', 1, 1),
(16, 'Asus ROG Phone 128GB', 19990000, 'asusrogphone.jpg', 'Một trong những sản phẩm được thiết kế tập trung dành riêng cho việc chơi game được ASUS cho ra mắt dành cho các tính đồ game thủ là điện thoại ASUS ROG Phone 128GB Chính hãng. Đây là chiếc điện thoại có thiết kế vô cùng lạ cùng nhiều tính năng thú vị sẽ mang lại trải nghiệm vô cùng đặc biệt cho người sử dụng.', 2, 1),
(17, 'Asus ROG Phone 512GB', 23990000, 'asusrogphone.jpg', 'ASUS ROG Phone 512GB Chính hãng\r\nMột trong những sản phẩm được thiết kế tập trung dành riêng cho việc chơi game được ASUS cho ra mắt dành cho các tính đồ game thủ là điện thoại ASUS ROG Phone 512GB Chính hãng. Đây là chiếc điện thoại có thiết kế vô cùng lạ cùng nhiều tính năng thú vị sẽ mang lại trải nghiệm vô cùng đặc biệt cho người sử dụng.\r\n\r\nThiết kế cao cấp, mạnh mẽ, độc đáo trên ASUS ROG Phone 512GB Chính hãng', 2, 1),
(18, 'Asus Zenfone Max Pro M2', 5290000, 'asusmaxprom2.jpg', 'Với thiết kế sang trọng, cấu hình mạnh, camera “chất” và đặc biệt là viên pin dung lượng “khủng”, điện thoại ASUS ZenFone Max Pro M2 3GB RAM là ứng cử viên “nặng ký” khi người dùng cần mua một chiếc smartphone tầm trung.\r\nSử dụng chất liệu hợp kim nhôm, ZenFone Max Pro M2 3GB RAM sở hữu ngoại hình bắt mắt với mức độ hoàn thiện tốt, các chi tiết được gia công tỉ mỉ, thể hiện sự tinh xảo. Đồng thời, các cạnh bên được làm cong uyển chuyển, mềm mại cho cảm giác cầm nắm dễ chịu, dễ dàng thao tác bằng một tay.', 2, 1),
(19, 'Iphone XS MAX 64GB', 26500000, 'ipxsmax.jpg', 'iPhone Xs Max xứng đáng là chiếc iPhone cao cấp nhất của Apple trong thời điểm hiện tại khi sở hữu lối thiết kế vô cùng tinh và thu hút với những đường cong mềm mại, đặc trưng và đầy tính biểu tượng từ những chiếc iPhone tiền nhiệm. Phần khung viền của iPhone Xs Max 64GB được làm từ thép không gỉ, mặt lưng là kính cường lực vừa đảm bảo tính thẩm mỹ cao vừa tạo sự an toàn tuyệt đối cho thiết bị.\r\niPhone XS MAX có một thân hình khá to, tương đương với kích thước của những chiếc iPhone dòng Plus trước đó nhằm chứa đựng một màn hình rộng đến 6.5 inches – màn hình lớn nhất từ trước đến nay được Apple trang bị cho iPhone. Màn hình này sử dụng công nghệ OLED, có độ phân giải 3.688 x 1.242 pixels với 3.3 triệu điểm ảnh cho khả năng hiển thị hình ảnh cực kỳ sống động và chân thực. Bên cạnh đó, Apple còn tích hợp trên iPhone XS MAX 64GB công nghệ hiển thị HDR10 giúp chất lượng hình ảnh được nâng cao và mượt mà hơn đáng kể.', 4, 1),
(20, 'Iphone XS 256GB', 28500000, 'ipxs.jpg', 'Về ngoại hình, iPhone XS 256GB giống hệt với iPhone X với màn hình khuyết được gọi là tai thỏ và 2 mặt kính cường lực cao cấp. Sản phẩm cũng không trang bị nút Home cứng, sở hữu phần khung làm từ thép không gỉ và bốn góc bo tròn tạo cảm giác cầm nắm thoải mái. Apple mang đến ba phiên bản màu sắc là bạc, xám và vàng ở dòng iPhone lần này.\r\n\r\nĐiểm gây bất ngờ và ấn tượng mạnh mẽ ở iPhone XS chính là màn hình Super Retina cao cấp và siêu sắc nét. Với kích thước 5.8 inch cùng tấm nền OLED, mang lại những trải nghiệm tuyệt vời cho người dùng khi xem phim hay lướt web cùng độ chi tiết cực cao và dài màu rộng sống động. Hơn thế nữa, chuyển động của máy rất mượt mà và hình ảnh được trung hòa màu sắc nhờ được hỗ trợ công nghệ hiển thị HDR10, Dolby Vision tần số quét 120 Hz và True Tone.', 4, 1),
(21, 'Oppo Reno 10x Zoom', 18990000, 'opporn2.jpg', 'Oppo Reno Zoom 10x có mặt kính Gorilla Glass 6 và màn hình AMOLED 6.6 inch\r\nĐầu tiên chúng ta sẽ nói về phần thiết kế, máy sở hữu cạnh viền cực mỏng gần như là không có khiến cho trải nghiệm trên màn hình của chúng ta hết sức đã mắt. Ngoài ra thì máy còn được phủ thêm một lớp satin càng giúp cho chiếc smartphone này toát lên vể sang trọng. Bên cạnh đó, người dùng sẽ không cần phải lo lắng quá nhiều về độ trầy xước của OPPO Reno Zoom 10x khi mà mắt sau của máy được trang bị Gorilla Glass 5 và mặt kính cảm ứng là Gorilla Glass 6 sẽ chịu trách nhiệm hoàn toàn bảo vệ chiếc điện thoại của bạn.', 3, 1),
(22, 'Oppo Reno 2', 14990000, 'oprn2.jpg', 'Oppo Reno 2 sở hữu 4 camera sau zoom 20x cùng camera selfie “vây cá mập” độc đáo\r\nDường như, camera selfie “vây cá mập” đã là đặc trưng và đặc điểm nhận diện của dòng Oppo Reno, được thiết kế bởi một hình tam giác giống như chiếc vây cá mập. Bên cạnh đó, còn được tích hợp một module có khả năng thò ra thụt vào khi cần thiết nhưng không phải toàn bộ mà chỉ nâng một bên và một bên cố định. Độ phân giải của camera selfie của Oppo Reno 2 lên đến 16 MP được tích hợp công nghệ làm đẹp AI hứa hẹn sẽ mang đến những bức ảnh selfie lung linh, sắc nét và sinh động cho người dùng. Tốc độ mở camera trước nhanh hơn 28.5% so với các tiền nhiệm giúp bạn không phải chờ đợi lâu khi sử dụng camera pop-up.', 3, 1),
(23, 'Oppo Reno 2F', 8990000, 'opporn2f.jpg', 'Oppo Reno 2F cùng với Oppo Reno 2 và Oppo Reno 2Z là 3 chiếc smartphone tầm trung thuộc dòng sản phẩm Reno thế hệ thứ 2 mới nhất vừa được ra mắt. Điện thoại vẫn mang trong mình phong cách thiết kế đặc biệt, được trang bị đến 4 camera sau, viên pin dung lượng lớn và có giá thành rẻ nhất trong dòng Reno tính đến thời điểm hiện tại.\r\n\r\nOppo Reno 2F với cảm biến vân tay dưới màn hình và được bảo vệ bằng kính Gorilla Glass 5\r\nReno 2F sở hữu màn hình lớn lên đến 6.53 inch độ phân giải Full HD+ (2340 x 1080 pixel) và tỷ lệ khung hình là 19.5:9. Tính năng cảm biến vân tay của máy cũng đã tích hợp phía dưới màn hình cho bạn dễ dàng thao tác hơn. Cùng với đó là chế độ bảo vệ mắt giúp giảm thiểu được tình trạng mỏi mắt của người dùng sau 1 khoảng thời gian dài sử dụng.', 3, 1),
(24, 'Huawei Mate 20', 15990000, 'huaweimate20.jpg', 'Huawei Mate 20 Chính hãng được trang bị lớp vỏ mặt sau bằng kim loại nguyên khối chắc chắc. Xung quanh các cạnh được bo tròn bốn góc giúp cho cảm giác cầm nắm trong thời gian dài được thoải mái. Máy cũng được trang bị cảm biến vân tay ở mặt sau.\r\nMàn hình của Mate 20 được trang bị kích thước 6.53 inch cùng với độ phân giải 2K đi kèm. Màn hình này sử dụng công nghệ tấm nền IPS giúp cho khả năng hiển thị màu sắc rõ ràng và sắc nét. Đồng thời khi sử dụng ngoài khu vực ánh sáng cao Mate 20 chính hãng có khả năng chống chói rất tốt. Các trải nghiệm xem phim, xem ảnh, chơi game trên màn hình này cũng cho trải nghiệm vô cùng thoải mái bởi độ rộng lớn của màn hình.\r\n\r\nHiệu năng mạnh mẽ trên Huawei Mate 20 Chính hãng', 5, 1),
(25, 'Huawei Novo 3i', 6299000, 'huaweinovo3i.jpg', 'Huawei nova 3i được hoàn thiện bởi mặt lưng kính cong 2.5D chuyển màu gradient sang trọng, kết hợp bộ khung kim loại chắc chắn mang lại vẻ đẹp bóng bẩy, sang trọng nhưng cũng không kém phần tinh tế. Các góc cạnh được bo cong nhẹ nhàng, nhằm đem lại cảm giác cầm nắm êm tai và dễ chịu hơn, kết hợp với màu sắc nổi bật, Nova 3i sẽ là một chiếc điện thoại mà bất kỳ đối tượng nào cũng mong muốn có. Nova 3i được hoàn thiện bằng bộ khung kim loại nguyên khối kết hợp với hai mặt kính bóng bẩy. Bên cạnh đó, chất lượng gia công cũng chính là một điểm cộng khi phần kính cong 2.5D và phần khung viền kim loại được xử lý liền mạch, giúp cầm nắm không cấn tay.', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `protypes`
--

CREATE TABLE IF NOT EXISTS `protypes` (
  `type_ID` int(11) NOT NULL,
  `type_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `type_img` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `protypes`
--

INSERT INTO `protypes` (`type_ID`, `type_name`, `type_img`) VALUES
(1, 'dien thoai', ''),
(2, 'laptop', ''),
(3, 'may tinh bang', ''),
(4, 'phu kien', ''),
(5, 'dong ho', '');

-- --------------------------------------------------------

--
-- Table structure for table `type_user`
--

CREATE TABLE IF NOT EXISTS `type_user` (
  `id` int(11) NOT NULL,
  `type_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_user`
--

INSERT INTO `type_user` (`id`, `type_user`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_user` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `username`, `password`, `type_user`) VALUES
(32, 'ga123', '123456', 1),
(18, 'anhcoi20044', '0908377920a', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_user`
--
ALTER TABLE `cart_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufactures`
--
ALTER TABLE `manufactures`
  ADD PRIMARY KEY (`manu_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `protypes`
--
ALTER TABLE `protypes`
  ADD PRIMARY KEY (`type_ID`);

--
-- Indexes for table `type_user`
--
ALTER TABLE `type_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_user`
--
ALTER TABLE `cart_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `protypes`
--
ALTER TABLE `protypes`
  MODIFY `type_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `type_user`
--
ALTER TABLE `type_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
