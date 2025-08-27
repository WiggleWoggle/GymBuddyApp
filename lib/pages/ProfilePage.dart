import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 21, 21, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 70),
                child: Image.asset('assets/icons/logo.png', scale: 6),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, bottom: 10),
              child: Text(
                'Your Profile',
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ProfileDisplayWidget()
          ],
        ),
      ),
    );
  }
}

class ProfileDisplayWidget extends StatefulWidget {

  ProfileDisplayWidget({Key? key}) : super(key: key);

  @override
  State<ProfileDisplayWidget> createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<ProfileDisplayWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Container(
            width: 385,
            height: 170,
            decoration: BoxDecoration(
              color: Color.fromRGBO(42, 42, 42, 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 80,
                          width: 370,
                          child: Stack(
                            children: [
                              ClipOval(
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 4,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/personcard/profileImage.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 80, top: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Alex',
                                          style: TextStyle(
                                            fontFamily: 'Glacial',
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            '@alexliftsalot',
                                            style: TextStyle(
                                              fontFamily: 'Glacial',
                                              color: Color.fromRGBO(142, 142, 142, 1),
                                              fontSize: 16,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            '100',
                                            style: TextStyle(
                                              fontFamily: 'Glacial',
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Text(
                                              'Following',
                                              style: TextStyle(
                                                fontFamily: 'Glacial',
                                                color: Color.fromRGBO(142, 142, 142, 1),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 25),
                                            child: Text(
                                              '100',
                                              style: TextStyle(
                                                fontFamily: 'Glacial',
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Text(
                                              'Followers',
                                              style: TextStyle(
                                                fontFamily: 'Glacial',
                                                color: Color.fromRGBO(142, 142, 142, 1),
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'My name is Alex and I’ve been lifting forover 5 years. I need a gym buddy to spotme and help me film gym content.',
                      style: TextStyle(
                        fontFamily: 'Glacial',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            ],
          )
        )
    );
  }
}

