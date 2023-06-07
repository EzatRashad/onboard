import 'package:dress_onboarding/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class Onbarding extends StatefulWidget {
  const Onbarding({super.key});

  @override
  State<Onbarding> createState() => _OnbardingState();
}

class _OnbardingState extends State<Onbarding> {
  List<BoardingModel> board = [
    BoardingModel(
      image: 'assets/images/b3.svg',
      title: 'SHOP BETTER, LOOK GOOD.',
      body:
          'You can connect with the people around \n the city for find your dress, connections \n with them.',
    ),
    BoardingModel(
      image: 'assets/images/b1.svg',
      title: 'SELL ON, JOIN US.',
      body:
          'With a lot of members, you\'ll be sure \n you find someone who loves your \n items.',
    ),
    BoardingModel(
      image: 'assets/images/b2.svg',
      title: 'GET UPDATES ON ITEMS YOU \n BUY AND SELL.',
      body:
          'Get notifications about activity on your \n listings and price drops on items you \n love.',
    ),
  ];

  var boardControllar = PageController();
  bool isLast = false;
  void submit() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xffF1BCB9),
              Colors.white,
              Color.fromRGBO(255, 255, 255, 0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardControllar,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildBoardItem(board[index]),
                  itemCount: board.length,
                  onPageChanged: (index) {
                    if (index == board.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      isLast = false;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardControllar,
                    count: board.length,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Color(0xff2e3f47),
                      dotHeight: 11,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 4,
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardControllar.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                    },
                    backgroundColor: const Color(0xff2e3f47),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBoardItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SvgPicture.asset(model.image),
          ),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff2e3f47)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ],
      );
}
