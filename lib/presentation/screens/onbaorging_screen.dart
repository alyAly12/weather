import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/presentation/screens/search_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/sky.png',
                fit: BoxFit.fitHeight,
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.1),
                              ]),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('images/cloudy-with-rain-2667017_1920.png'),
                        Text(
                          'Discover Forcast',
                          style: GoogleFonts.aclonica(
                              fontSize: 25, color: Colors.indigoAccent),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(200, 50),
                            minimumSize: const Size(200, 50),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchPage()));
                          },
                          child: Text(
                            'Get Start',
                            style: GoogleFonts.aclonica(fontSize: 20),
                          ),
                        ),
                      ],
                    )
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
