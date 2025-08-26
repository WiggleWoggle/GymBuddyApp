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
                'Stories',
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            StoryHeader(),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, bottom: 10),
              child: Text(
                'Friend Activity',
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            FriendProgressWidget(),
            FriendProgressWidget(),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, bottom: 10),
              child: Text(
                'Rank Progression',
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ProgressTrackerWidget(),
            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}

class FriendProgressWidget extends StatefulWidget {

  FriendProgressWidget({Key? key}) : super(key: key);

  @override
  State<FriendProgressWidget> createState() => _FriendProgressWidgetState();
}

class _FriendProgressWidgetState extends State<FriendProgressWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Container(
          width: 385,
          height: 90,
          decoration: BoxDecoration(
            color: Color.fromRGBO(42, 42, 42, 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.deepOrangeAccent,
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
                                child: Image.asset('assets/personcard/profileImage.png', fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                Padding(
                    padding: EdgeInsets.only(left:10, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alex',
                          style: TextStyle(
                            fontFamily: 'Glacial',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Benched 225 today!',
                          style: TextStyle(
                            fontFamily: 'Glacial',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 127),
                  child: Image.asset('assets/icons/messagesInactive.png', scale: 20),
                )
              ],
            ),
          )
      )
    );
  }
}

class ProgressTrackerWidget extends StatefulWidget {

  ProgressTrackerWidget({Key? key}) : super(key: key);

  @override
  State<ProgressTrackerWidget> createState() => _ProgressTrackerWidgetState();
}

class _ProgressTrackerWidgetState extends State<ProgressTrackerWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 385,
        height: 130,
        decoration: BoxDecoration(
          color: Color.fromRGBO(42, 42, 42, 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 385,
                height: 45,
                child: Row(
                  children: [
                    SizedBox(width: 21,),
                    Image.asset('assets/icons/dumbbell.png', scale: 24),
                    SizedBox(width: 12,),
                    Text(
                      'Track your progress',
                      style: TextStyle(
                        fontFamily: 'Glacial',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Stack(
                      children: [
                        Container(
                          width: 310,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(21, 21, 21, 1),
                            borderRadius: const BorderRadius.all(Radius.circular(90)),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: const BorderRadius.all(Radius.circular(90)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset('assets/icons/open.png', scale: 20),
                    )
                  ],
                )
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: 310,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Champion Lifter',
                          style: TextStyle(
                            fontFamily: 'Glacial',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Titan Lifter',
                          style: TextStyle(
                            fontFamily: 'Glacial',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            )
          ],
        )
      )
    );
  }
}

class StoryHeader extends StatefulWidget {

  StoryHeader({Key? key}) : super(key: key);

  @override
  State<StoryHeader> createState() => _StoryHeaderState();
}

class _StoryHeaderState extends State<StoryHeader> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StoryCircle(),
        StoryCircle(),
        StoryCircle(),
        StoryCircle()
      ],
    );
  }
}

class StoryCircle extends StatefulWidget {

  StoryCircle({Key? key}) : super(key: key);

  @override
  State<StoryCircle> createState() => _StoryCircleState();
}

class _StoryCircleState extends State<StoryCircle> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
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
                child: Image.asset('assets/personcard/profileImage.png', fit: BoxFit.cover,),
              ),
            ),
          ),
        ),
        SizedBox(height: 4,),
        Text(
          'Alex',
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontFamily: 'Glacial',
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}