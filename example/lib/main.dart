import 'package:animated_appear/animated_appear.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color primaryColor = Color(0xFF0068FF);
  final Color lightColor = Color(0xFFF0F0F5);

  final double fontSize = 16;
  final BorderRadius chatMessageBorderRadius = BorderRadius.circular(12);
  final Border chatDefaultBorder =
      Border.all(color: Colors.grey, width: 0.8, style: BorderStyle.solid);

  final int baseDelayMilliseconds = 2000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: AnimatedAppear(
              delay: Duration(milliseconds: baseDelayMilliseconds ~/ 2),
              duration: Duration(milliseconds: 400),
              child: AppHeader(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              AnimatedAppear(
                delay: Duration(milliseconds: baseDelayMilliseconds),
                duration: Duration(milliseconds: 400),
                child: ChatMessage(
                  text: "[WEB 발신] 구독서비스가 갱신되었습니다",
                  border: chatDefaultBorder,
                  borderRadius: chatMessageBorderRadius,
                ),
              ),
              AnimatedAppear(
                delay: Duration(milliseconds: baseDelayMilliseconds + 1000),
                duration: Duration(milliseconds: 250),
                child: ChatMessage(
                  text: "??? 뭔데",
                  mainAxisAlignment: MainAxisAlignment.end,
                  backgroundColor: lightColor,
                  borderRadius: chatMessageBorderRadius,
                ),
              ),
              AnimatedAppear(
                delay: Duration(milliseconds: baseDelayMilliseconds + 1800),
                duration: Duration(milliseconds: 250),
                child: ChatMessage(
                  text: "하... 맞다...",
                  mainAxisAlignment: MainAxisAlignment.end,
                  backgroundColor: lightColor,
                  borderRadius: chatMessageBorderRadius,
                ),
              ),
              AnimatedAppear(
                delay: Duration(milliseconds: baseDelayMilliseconds + 2500),
                duration: Duration(milliseconds: 250),
                child: ChatMessage(
                  text: "이런 경험 다들 있으시죠?",
                  border: chatDefaultBorder,
                  borderRadius: chatMessageBorderRadius,
                ),
              ),
              AnimatedAppear(
                delay: Duration(milliseconds: baseDelayMilliseconds + 3500),
                duration: Duration(milliseconds: 250),
                child: ChatMessage(
                  text: "🤗 우리, 왓섭에서 편하게 알림받고 해지해요",
                  textColor: primaryColor,
                  backgroundColor: primaryColor.withOpacity(0.1),
                  borderRadius: chatMessageBorderRadius,
                ),
              ),
            ]),
          ),
          SliverFillRemaining(
            fillOverscroll: false,
            hasScrollBody: false,
            child: AnimatedAppear(
              delay: Duration(milliseconds: baseDelayMilliseconds + 5000),
              duration: Duration(milliseconds: 250),
              slideBeginOffset: const Offset(0, 0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\'동의 및 시작\'을 누르는 것으로 ',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          TextSpan(
                            text: '왓섭 필수 이용약관',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                                fontSize: 12),
                          ),
                          TextSpan(
                            text: ' 및\n',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          TextSpan(
                            text: '개인정보 이용방침',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                                fontSize: 12),
                          ),
                          TextSpan(
                            text: '에 동의하게 됩니다.',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(0, 48),
                          elevation: 0,
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('동의하고 시작하기'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  AppHeader({Key? key}) : super(key: key);

  final Color primaryColor = Color(0xFF0068FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: '내가 ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
            text: '어떤 서비스',
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
              text: '를\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
            text: '언제 구독',
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: '했더라?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.text,
    this.textColor = Colors.black,
    this.backgroundColor,
    this.alignment,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.border,
    this.borderRadius,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Alignment? alignment;
  final MainAxisAlignment mainAxisAlignment;
  final Border? border;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: border,
              borderRadius: borderRadius,
              color: backgroundColor,
            ),
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          )
        ],
      ),
    );
  }
}
