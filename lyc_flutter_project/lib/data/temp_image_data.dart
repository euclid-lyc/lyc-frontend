import '../model/image.dart';

class TempImage {
  final image1 = PostingImage(2221, 'assets/ex_myCoordi1.jpg', 1111);
  final image2 = PostingImage(2222, 'assets/ex_myCoordi2.jpg', 1112);
  final image3 = PostingImage(2223, 'assets/ex_userCoordi1.jpg', 1113);
  final image4 = PostingImage(2224, 'assets/ex_userCoordi2.jpg', 1114);

  late final List<PostingImage> images;
  TempImage() {
    images = [image1, image2, image3, image4];
  }
}