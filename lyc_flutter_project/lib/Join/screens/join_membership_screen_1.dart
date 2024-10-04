import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/Join/Screens/join_membership_screen_2.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:lyc_flutter_project/widget/controller.dart';
import '../../common/widget/normal_appbar.dart';

class JoinMembershipScreen1 extends StatefulWidget {
  JoinMembershipScreen1({super.key});

  @override
  State<JoinMembershipScreen1> createState() {
    return JoinMembershipScreenState1();
  }
}

class JoinMembershipScreenState1 extends State<JoinMembershipScreen1> {
  final Controller _controller1 = Controller();
  final Controller _controller2 = Controller();
  final Controller _controller3 = Controller();
  final Controller _controller4 = Controller();
  final Controller _controller5 = Controller();

  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String id = '';
  String email = '';
  String pw = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(
        title: "회원가입",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(29, 28.5, 29, 33),
                width: 296,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Step 1. 아이디 비밀번호 설정',
                          style: app_text_style.littleTitle,
                        ),
                      ),
                      buildNameField(),
                      buildIdField(),
                      buildEmailField(),
                      buildPwField(),
                      buildPwCheckField(),
                      Padding(
                        padding: EdgeInsets.only(top: 30.5), // 위아래 여백 설정
                        child: TextButton(
                          onPressed: () {
                            _tryValidation();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const JoinMembershipScreen2()),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColor.brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: SizedBox(
                            width: 230,
                            child: Text(
                              '다음',
                              style: app_text_style.button,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20), // 위아래 여백 설정
                child: TextButton(
                  onPressed: () {
                    // 다른 계정으로 회원가입 버튼 눌렀을 때의 동작 구현
                  },
                  child: Text(
                    '다른 계정으로 회원가입',
                    style: app_text_style.otherLoginTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0), // 위아래 여백 설정
                child: SizedBox(
                  width: 166,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/icon_naver.png',
                          width: 35,
                          height: 35,
                        ),
                        onPressed: () {
                          // 네이버 로그인 버튼 눌렀을 때의 동작 구현
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/icon_kakao.png',
                          width: 35,
                          height: 35,
                        ),
                        onPressed: () {
                          // 카카오톡 로그인 버튼 눌렀을 때의 동작 구현
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/icon_google.png',
                          width: 35,
                          height: 35,
                        ),
                        onPressed: () {
                          // 구글 로그인 버튼 눌렀을 때의 동작 구현
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4.5),
            alignment: Alignment.topLeft,
            child: Text(
              '이름',
              style: app_text_style.labelTextStyle,
            ),
          ),
          Container(
            width: 230, // 너비 설정
            height: 40, // 높이 설정
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 15), // 좌우 및 상하 여백 설정
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    key: ValueKey(2),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return '이름은 두 글자 이상이어야 합니다.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userName = value!;
                    },
                    controller: _controller1.controller,
                    decoration:
                        getDecoration('이름을 입력해 주세요', app_text_style.hint),
                    keyboardType: TextInputType.text,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget buildIdField() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4.5),
            alignment: Alignment.topLeft,
            child: Text(
              '아이디',
              style: app_text_style.labelTextStyle,
            ),
          ),
          Container(
            width: 230, // 너비 설정
            height: 40, // 높이 설정
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 15), // 좌우 및 상하 여백 설정
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    key: ValueKey(1),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '아이디를 입력해 주세요.';
                      } else if (value.length < 6) {
                        return '아이디는 6글자 이상이어야 합니다.';
                      } else if (RegExp(
                              r'^(?=.*[a-zA-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$')
                          .hasMatch(value)) {
                        return '아이디에는 영어와 특수문자가 포함되어야 합니다.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      id = value!;
                    },
                    controller: _controller2.controller,
                    decoration:
                        getDecoration('아이디를 입력해 주세요', app_text_style.hint),
                    keyboardType: TextInputType.text,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget buildEmailField() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4.5),
            alignment: Alignment.topLeft,
            child: Text(
              '이메일',
              style: app_text_style.labelTextStyle,
            ),
          ),
          Container(
            width: 230, // 너비 설정
            height: 40, // 높이 설정
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 15), // 좌우 및 상하 여백 설정
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    key: ValueKey(3),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '이메일을 입력해주세요.';
                      } else if (!value.contains('@')) {
                        return '형식이 올바르지 않습니다.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                    controller: _controller3.controller,
                    decoration:
                        getDecoration('이름을 입력해 주세요', app_text_style.hint),
                    keyboardType: TextInputType.text,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget buildPwField() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4.5),
            alignment: Alignment.topLeft,
            child: Text(
              '비밀번호',
              style: app_text_style.labelTextStyle,
            ),
          ),
          Container(
            width: 230, // 너비 설정
            height: 40, // 높이 설정
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 15), // 좌우 및 상하 여백 설정
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    key: ValueKey(4),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '비밀번호를 입력해 주세요.';
                      } else if (value.length < 8) {
                        return '비밀번호는 8글자 이상이어야 합니다.';
                      } else if (RegExp(
                              r'^(?=.*[a-zA-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$')
                          .hasMatch(value)) {
                        return '비밀번호에는 영어와 특수문자가 포함되어야 합니다.';
                      }
                      return null;
                    },
                    controller: _controller4.controller,
                    decoration:
                        getDecoration('비밀번호를 입력해 주세요', app_text_style.hint),
                    keyboardType: TextInputType.text,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget buildPwCheckField() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4.5),
            alignment: Alignment.topLeft,
            child: Text(
              '비밀번호 확인',
              style: app_text_style.labelTextStyle,
            ),
          ),
          Container(
            width: 230, // 너비 설정
            height: 40, // 높이 설정
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 15), // 좌우 및 상하 여백 설정
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    key: ValueKey(5),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '비밀번호를 입력해 주세요.';
                      } else if (value != _controller3.controller.text) {
                        return '비밀번호가 일치하지 않습니다.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      pw = value!;
                    },
                    controller: _controller5.controller,
                    decoration:
                        getDecoration('비밀번호를 다시 입력해 주세요', app_text_style.hint),
                    keyboardType: TextInputType.text,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  static InputDecoration getDecoration(String hint, TextStyle hintTextStyle) {
    return InputDecoration(
      hintText: hint,
      hintStyle: hintTextStyle,
      border: InputBorder.none,
    );
  }
}
