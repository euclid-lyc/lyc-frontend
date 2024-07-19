import '../model/image.dart';

class TempImage {
  final image1 = Image(2221, 'assets/ex_myCoordi1.jpg', 1111);
  final image2 = Image(2222, 'assets/ex_myCoordi2.jpg', 1112);
  final image3 = Image(2223, 'assets/ex_userCoordi1.jpg', 1113);
  final image4 = Image(2224, 'assets/ex_userCoordi2.jpg', 1114);

  late final List<Image> images;
  TempImage() {
    images = [image1, image2, image3, image4];
  }
}