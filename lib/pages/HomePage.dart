import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 21, 21, 1),
      body:
      Padding(
        padding: EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 20, top: 30),
                  child: Image.asset('assets/icons/logo.png', scale: 6,),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20, top: 20),
                child: FilterWidget(),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 80),
                  child: Stack(
                    children: [
                      PersonCard(),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatefulWidget {

  FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidget();
}

class _FilterWidget extends State<FilterWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Image.asset('assets/icons/filter.png', scale: 15,),
    );
  }
}




class PersonCard extends StatefulWidget {

  PersonCard({Key? key}) : super(key: key);

  @override
  State<PersonCard> createState() => _PersonPanel();
}

class _PersonPanel extends State<PersonCard> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 560,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/personcard/profileImage.png',
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.4],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alex, 21',
                      style: const TextStyle(
                        fontFamily: 'League',
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 0),
                    Row(
                      children: [
                        Image.asset('assets/icons/location.png', scale: 30),
                        const SizedBox(width: 7),
                        const Text(
                          'Austin, Texas',
                          style: TextStyle(
                            fontFamily: 'Glacial',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset('assets/icons/information.png', scale: 30),
                        const SizedBox(width: 7),
                        const Text(
                          '5\'11, 180',
                          style: TextStyle(
                            fontFamily: 'Glacial',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  bottom: 20
                ),
                child: Image.asset('assets/icons/more.png', scale: 12),
              )
            )
          ],
        ),
      )
    );
  }
}