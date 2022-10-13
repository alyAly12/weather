import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_app/presentation/controller/weathers_bloc.dart';

import '../../core/service_locator.dart';
import '../../core/utils/request_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeathersBloc(sl())..add(GetWeatherEvent()),
      child: BlocBuilder<WeathersBloc, WeathersState>(
        builder: ( context, state) {
          switch(state.weatherState){
            case RequestState.loading:
              return const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
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
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'location',
                                      style: GoogleFonts.aclonica(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  state.getWeatherByCity!.cityName,
                                  style: GoogleFonts.aclonica(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  '${state.getWeatherByCity!.temperature}°',
                                  style: GoogleFonts.aclonica(
                                      fontSize: 80, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.sunny,size: 80,color: Colors.white,),
                                    Text(
                                     state.getWeatherByCity!.main,
                                      style: GoogleFonts.aclonica(
                                          fontSize: 40,
                                          color: Colors.yellowAccent),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Center(
                                  child: Text(
                                    state.getWeatherByCity!.descriptions,
                                    style: GoogleFonts.aclonica(
                                        fontSize: 60, color: Colors.yellowAccent),
                                  ),
                                )
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
            case RequestState.error:
              return SizedBox(
                  height: 400,
                  child: Center(child: Text(state.message)));
          }

        },
      ),
    );
  }
}
