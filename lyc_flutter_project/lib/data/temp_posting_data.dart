import 'package:lyc_flutter_project/model/posting.dart';

class TempPostingData {
  final posting1 = Posting(1111, 1, -4, 'style이다', 0, 'c', 'content이다', 1, 1, 1);
  final posting2 = Posting(1112, 23, 12, 'style이다', 0, 'c', 'content이다', 1, 2, 1);
  final posting3 = Posting(1113, 1, -4, 'style이다', 0, 'c', 'content이다', 2, 2, 2);
  final posting4 = Posting(1114, 23, 12, 'style이다', 0, 'c', 'content이다', 2, 1, 2);

  late final List<Posting> postings;
  TempPostingData() {
    postings = [posting1, posting2, posting3, posting4];
  }
}