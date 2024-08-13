import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/model/image.dart';
import 'package:lyc_flutter_project/model/member.dart';
import 'package:lyc_flutter_project/model/posting.dart';
import 'package:lyc_flutter_project/services/temp_services.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:flutter_svg/svg.dart';

class PostingDetailScreen extends StatefulWidget {
  final int id;
  final bool isMyCoordi;

  const PostingDetailScreen(
      {super.key, required this.id, required this.isMyCoordi});

  @override
  _PostingDetailScreenState createState() => _PostingDetailScreenState();
}

class _PostingDetailScreenState extends State<PostingDetailScreen> {
  bool isSaved = false;
  bool isFavorite = false;

  late Posting posting;
  late PostingImage image;
  late Member writer;

  @override
  void initState() {
    super.initState();
    posting = TempServices.getPostingByPostingId(widget.id);
    image = TempServices.getImageByPostingId(widget.id);
    writer = TempServices.getMemberById(posting.writer_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              // 프로필, 날씨
              Container(
                height: 70,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        RoundImage(
                            image: TempServices.getMemberById(posting.from_id)
                                .profile_image),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: SvgPicture.asset(
                            'assets/icon_arrow.svg',
                          ),
                        ),
                        RoundImage(
                          image: TempServices.getMemberById(posting.to_id)
                              .profile_image,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          writer.nickname,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '@${writer.login_id}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      '${posting.min_temp}°C ~ ${posting.max_temp}°C',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              // 사진
              Hero(
                tag: posting.id,
                child: AspectRatio(
                  aspectRatio: (3/4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      image.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // 하트, 공유, 저장 버튼
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite; // 토글
                        });
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isSaved = !isSaved;
                            });
                          },
                          icon: SvgPicture.asset(
                            isSaved
                                ? 'assets/icon_saved.svg'
                                : 'assets/icon_save.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // 설명박스
              Container(
                width: double.infinity,
                height: 150,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('${posting.style}\n${posting.content}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
