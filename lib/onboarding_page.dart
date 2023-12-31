import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoarding extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnBoarding(
      {super.key,

      
      required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const SizedBox(
          height: 20,
        ),
        Text(description),
        SvgPicture.asset(
          imagePath,
          height: 320,
        ),
      ],
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();

  List<OnBoarding> onBoardingList = [
    const OnBoarding(
        title: 'SEE THE BEST COURSE #1',
        description:
            'Tut app is an awesome flutter application using clean architecture #1',
        imagePath: 'assets/images/onboardingimg1.svg'),
    const OnBoarding(
        title: 'SEE THE BEST COURSE #2',
        description:
            'Tut app is an awesome flutter application using clean architecture #2',
        imagePath: 'assets/images/onboardingimg2.svg'),
    const OnBoarding(
        title: 'SEE THE BEST COURSE #3',
        description:
            'Tut app is an awesome flutter application using clean architecture #3',
        imagePath: 'assets/images/onboardingimg3.svg'),
    const OnBoarding(
        title: 'SEE THE BEST COURSE',
        description:
            'Tut app is an awesome flutter application using clean architecture #4',
        imagePath: 'assets/images/onboardingimag4.svg'),
  ];

  // ignore: prefer_final_fields
  var _currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          itemCount: onBoardingList.length,
          onPageChanged: (newPage) {
            setState(() {
                          _currentpage = newPage;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return onBoardingList[index];
          }),
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        color: Colors.amber,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text("Skip")),
              ],
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 InkWell(child: const Icon(Icons.arrow_back_ios,),onTap: () {
                  _pageController.animateToPage(
                    decreasePageNumber(_currentpage), duration: const Duration(milliseconds: 500), curve: Curves.linear);
                },
                ),
                for (int i = 0; i < onBoardingList.length; i++)
                  getproperbutton(i, _currentpage),
                InkWell(child: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _pageController.animateToPage(
                    increasePageNumber(_currentpage), duration: const Duration(milliseconds: 500) , curve: Curves.linear);
                },),
              ],
            ),
          ],
        ),
      ),
    );
  }

 Widget getproperbutton(int index, int currentpage) {
    if (index == currentpage) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/images/filled.png',
      
          height: 20,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/hollow.png',
          height: 20,
        ),
      );
    }
  }
  
  int decreasePageNumber(int currentpage) {
     --currentpage;
     if(currentpage<0){
      return onBoardingList.length-1;

     }
     return currentpage;
  }
  
  int increasePageNumber(int currentpage) {
    ++currentpage;
    if(currentpage==onBoardingList.length){
      return 0;
    }
    return currentpage;
  }
}
