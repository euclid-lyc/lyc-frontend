import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/model/coordi.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoordiDetailScreen extends StatefulWidget {
  final Coordi coordi;
  final bool isMyCoordi;


  const CoordiDetailScreen(
      {super.key, required this.coordi, required this.isMyCoordi});
  @override
  _CoordiDetailScreenState createState() => _CoordiDetailScreenState();
}

class _CoordiDetailScreenState extends State<CoordiDetailScreen> {
  bool isSaved = false;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          backgroundColor: AppColor.beige,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Spacer(),
                      if (widget.isMyCoordi)
                        IconButton(
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // delete
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
                        AspectRatio(
                          aspectRatio: 1,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/ex_profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/ex_profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.coordi.posterName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '@${widget.coordi.posterId}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      widget.coordi.weather,
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
                tag: widget.coordi,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/${widget.coordi.image}.jpg',
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

                          ),),
                      ],
                    )
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                height: 150,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(widget.coordi.style.join(' ')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
