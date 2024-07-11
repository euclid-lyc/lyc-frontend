import 'package:flutter/material.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {

  @override
  void initState() {
    super.initState();
    //_tabController.addListener(tabListner);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Column(
        children: [
          // 상단 베이지 박스
          Container(
            height: 250,
            color: Color(0xffC4BAA2),
            padding: EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 30),
            child: Column(
              children: [
                // 프로필 박스(사진, 이름 등)
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 사진
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/ex_profile.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // 이름, 아이디, 팔로워, 팔로잉
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Karina',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              // 이름
                              Text('@katarinabluu'),
                              // 아이디
                              SizedBox(height: 10),
                              Text(
                                '팔로워: 1,350만',
                                style: TextStyle(color: Color(0xff414141)),
                              ),
                              // 팔로워
                              Text('팔로잉: 245',
                                  style: TextStyle(color: Color(0xff414141))),
                              // 팔로잉
                            ],
                          ),
                        ),
                      ),
                      // 공유, P 아이콘
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.local_parking,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                // 버튼 박스(스탬프, 리뷰, 출석체크)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 스탬프 버튼
                    Container(
                      height: 40,
                      width: 100,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xffF1F1F1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: Text(
                            '스탬프',
                            style: TextStyle(
                                color: Color(0xff8D8371), fontSize: 16),
                          )),
                    ),
                    // 리뷰 버튼
                    Container(
                      height: 40,
                      width: 100,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xffF1F1F1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: Text(
                            '리뷰',
                            style: TextStyle(
                                color: Color(0xff8D8371), fontSize: 16),
                          )),
                    ),
                    // 출석체크 버튼
                    Container(
                      height: 40,
                      width: 100,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xffF1F1F1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: Text(
                            '출석체크',
                            style: TextStyle(
                                color: Color(0xff8D8371), fontSize: 16),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 하단부
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              children: [
                // 네비게이터 --> 버튼 조절하기!
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      // 나의 코디
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff8D8371),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            child: Text(
                              '나의 코디',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // 저장한 코디
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff8D8371),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            child: Text(
                              '저장한 코디',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // 나의 옷장
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff8D8371),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            child: Text(
                              '나의 옷장',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                // 갤러리
                // GridView로 구현
              ],
            ),
          ),
        ],
      ),
    );
  }
}
