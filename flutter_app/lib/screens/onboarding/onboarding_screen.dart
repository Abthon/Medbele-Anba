import 'package:flutter/material.dart';
import 'views/second_screen.dart';
import 'views/third_screen.dart';
import 'widgets/get_started_button.dart';
import 'views/first_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (pageNumber) {
                  setState(() {
                    currentPage = pageNumber;
                  });
                },
                children: const [
                  FirstScreen(),
                  SecondScreen(),
                  ThirdScreen(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 13.0,
              width: size.width,
              margin: EdgeInsets.only(
                  left: (size.width / 2) - 55, right: 120, bottom: 10.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: currentPage == index ? 35 : 13,
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? const Color.fromARGB(255, 133, 128, 234)
                            : Colors.black12,
                        borderRadius: BorderRadius.circular(
                            currentPage == index ? 5 : 13),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 140,
              width: size.width,
              child: GetStartedButton(),
            ),
          ],
        ),
      ),
    );
  }
}
