import 'package:chatting/config/palette.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  final _formkey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidatrion() {
    final isValid = _formkey.currentState!.validate();
    if(isValid) {
      _formkey.currentState!.save();
    //   모든 텍스트폼 필드가 가지고 있는 onSaved는 메소드를 동작시킨다.
    }
  }

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
                                text: isSignupScreen ? ' 어서와 친구' : ' 왔어 베프?!! ',
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
                        isSignupScreen ? "우리 오늘부터 1일?" : "어서와 보고싶었어!!",
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
          AnimatedPositioned(
            // 에니메이션구현
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: 180,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: EdgeInsets.all(20),
              height: isSignupScreen ? 280 : 250,
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
                  if(isSignupScreen)
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            key: ValueKey(1),
                            validator: (value) {
                              if(value!.isEmpty || value.length < 4) {
                                return '최소 4글자 이상 입력해주세요';
                              }
                              return null;
                            },
                            onSaved: (value){
                              userName = value!;
                            },
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
                            key: ValueKey(2),
                            validator: (value) {
                              if(value!.isEmpty || value.contains('@')) {
                                return 'E-Mail 형식에 맞게 작성해주세요';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userEmail = value!;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
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
                              hintText: 'E-Mail 입력하세용~!',
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
                            key: ValueKey(3),
                            validator: (value) {
                              if(value!.isEmpty ||  value.length < 6) {
                                return "최소 6글자 이상 입력해주세요";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userPassword = value!;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.password,
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
                              hintText: '비밀번호 입력하세용~!',
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
                  if(!isSignupScreen)
                  Container(
                    margin: EdgeInsets.only(
                      top: 20
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            key: ValueKey(4),
                            validator: (value) {
                              if(value!.isEmpty ||  value.length < 6) {
                                return "최소 6글자 이상 입력해주세요";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userEmail = value!;
                            },
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
                          SizedBox(height: 8),
                          TextFormField(
                            key: ValueKey(5),
                            validator: (value) {
                              if(value!.isEmpty ||  value.length < 6) {
                                return "최소 6글자 이상 입력해주세요";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userPassword = value!;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.password,
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
                              hintText: '비밀번호 입력하세용~!',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Palette.textColor1,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // 전송버튼
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: isSignupScreen ? 430 : 390,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 20, bottom: 20, right: 2, left: 2),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _tryValidatrion();
                    },
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
          ),

          Positioned(
            top: MediaQuery.of(context).size.height-125,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? ' or Signup with' : ' or Signin with'),
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
