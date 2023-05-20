import 'package:chatting/config/palette.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          // 배경을 위한 포지션
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/red.jpg'), fit: BoxFit.cover),
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Kiwi',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: ' Chatting App',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Signup to continue",
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 텍스트 폼 필드
          Positioned(
            top: 180,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 280,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isSignupScreen
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            // 밑줄관리가 가능하다.
                            if (!isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.pink,
                              )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSignupScreen
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.pink,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Palette.iconColor,
                              ),
                              //둥근 태두리 만들기
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              hintText: '아이디 입력하세용~!',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Palette.textColor1,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Palette.iconColor,
                              ),
                              //둥근 태두리 만들기
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              hintText: '아이디 입력하세용~!',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Palette.textColor1,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Palette.iconColor,
                              ),
                              //둥근 태두리 만들기
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              hintText: '아이디 입력하세용~!',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Palette.textColor1,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 전송버튼
          Positioned(
            top: 430,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20, right: 2, left: 2),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent,
                          Colors.pink,
                        ],
                        // 그라데이션의 방향 설정
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          // 지접에서 다른 지점까지의 거리
                          offset: Offset(0,2),
                        ),
                      ],
                    ),
                    child: Icon(Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height-125,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(' or Signup wuth'),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(155, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Palette.googleColor,
                      ),
                      icon: Icon(Icons.add),
                      label: Text('Google'),),
                ],
              )
          ),
        ],
      ),
    );
  }
}
