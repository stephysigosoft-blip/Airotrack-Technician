import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../assets/resources/strings.dart';
import 'clock_widget.dart';

class HomeWelcomeCard extends StatelessWidget {
  final String userName;

  const HomeWelcomeCard({
    super.key,required this.userName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        margin: const EdgeInsets.only(
            top: 30, left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
            color: colorPrimary,
            border: Border.all(color: colorPrimary),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {

                },
                child: Container(
                    margin: const EdgeInsets.only(
                        left: 15, top: 25),
                    child: const Text(
                      Strings.welcome,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Regular'),
                    )),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 15, top: 15),
                  child: Text(
                     userName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Bold'),
                  )),
              Container(
                margin: const EdgeInsets.only(
                    top: 25, left: 15),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/calendar.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('dd MMM yyyy')
                              .format(DateTime.now()),
                          style: const TextStyle(
                              fontFamily:
                              'Poppins-Regular',
                              fontSize: 15,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/schedulewhite.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const ClockWidget(),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}