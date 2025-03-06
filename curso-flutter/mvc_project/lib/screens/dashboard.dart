import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_project/screens/components/carousel_item.dart';
import 'package:mvc_project/screens/login.dart';
import 'package:mvc_project/screens/components/primary_button.dart';
import 'package:mvc_project/theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: AppBackgroundProperties.boxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/images/background.svg"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CarouselSlider(
                      items: const [
                        CarouselItem(
                          imageName: 'carousel-001.png',
                          label: 'Registre seus livros',
                        ),
                        CarouselItem(
                          imageName: 'carousel-002.png',
                          label: 'Faça anotações',
                        ),
                        CarouselItem(
                          imageName: 'carousel-003.png',
                          label: 'Visualize o seu progresso',
                        ),
                      ],
                      options: CarouselOptions(
                        height: 412,
                        aspectRatio: 1,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(
                          milliseconds: 5000,
                        ),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 1500,
                        ),
                        autoPlayCurve: Curves.easeInBack,
                        scrollDirection: Axis.horizontal,
                        reverse: false,
                      ),
                    ),
                    PrimaryButton(
                      text: "Entrar",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
