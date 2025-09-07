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
            FriendProgressWidget(
              challenge: true,
              workout: 'Benched',
              weight: 225,
              timePeriod: 'Today',
            ),
            FriendProgressWidget(
              challenge: false,
              workout: 'Deadlift',
              weight: 315,
              timePeriod: 'Yesterday',
            ),
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
            const SizedBox(height: 15),
            WeekProgressWidget(
              previousBenchWeight: 205,
              newBenchWeight: 225,
              previousDeadliftWeight: 325,
              newDeadliftWeight: 315,
            ),
            const SizedBox(height: 140),
          ],
        ),
      ),
    );
  }
}

class FriendProgressWidget extends StatefulWidget {
  FriendProgressWidget({Key? key, required this.challenge, required this.workout, required this.weight, required this.timePeriod}) : super(key: key);

  final bool challenge;
  final String workout;
  final int weight;
  final String timePeriod;

  @override
  State<FriendProgressWidget> createState() => _FriendProgressWidgetState();
}

class _FriendProgressWidgetState extends State<FriendProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            width: 385,
            height: widget.challenge ? 150 : 90,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Color.fromRGBO(42, 42, 42, 1),
            ),
          ),
          Column(
            children: [
              Container(
                width: 385,
                height: 90,
                decoration: BoxDecoration(
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
                                      child: Image.asset(
                                        'assets/personcard/profileImage.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 18),
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
                              '${widget.workout} ${widget.weight} lbs ${widget.timePeriod}!',
                              style: TextStyle(
                                fontFamily: 'Glacial',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 13),
                        child: Image.asset(
                          'assets/icons/emojiPrompt.png',
                          scale: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (widget.challenge)
                Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.deepOrangeAccent,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Challenge',
                      style: TextStyle(
                        fontFamily: 'Glacial',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeekProgressWidget extends StatelessWidget {

  final int previousBenchWeight;
  final int newBenchWeight;

  final int previousDeadliftWeight;
  final int newDeadliftWeight;

  const WeekProgressWidget({super.key, required this.previousBenchWeight, required this.newBenchWeight, required this.previousDeadliftWeight, required this.newDeadliftWeight});

  int getPercentValue(int newValue, int previousValue) {

    int difference = newValue - previousValue;
    double percentDifference = (difference / previousValue) * 100;

    return percentDifference.round();
  }

  bool isValueIncrease(int percentValue) {

    return percentValue >= 0;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 385,
      height: 180,
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
                    SizedBox(width: 21),
                    Image.asset('assets/icons/barChart.png', scale: 24),
                    SizedBox(width: 12),
                    Text(
                      'Recent progress',
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
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last week',
                            style: TextStyle(
                              fontFamily: 'Glacial',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            previousBenchWeight.toString() + ' lb Bench Press',
                            style: TextStyle(
                              fontFamily: 'Glacial',
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            previousDeadliftWeight.toString() + ' lb Deadlift',
                            style: TextStyle(
                              fontFamily: 'Glacial',
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ),
                    SizedBox(width: 16,),
                    Container(
                        width: 140,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'This week',
                              style: TextStyle(
                                fontFamily: 'Glacial',
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              newBenchWeight.toString() + ' lb Bench Press',
                              style: TextStyle(
                                fontFamily: 'Glacial',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              newDeadliftWeight.toString() + ' lb Deadlift',
                              style: TextStyle(
                                fontFamily: 'Glacial',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                        width: 60,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: isValueIncrease(getPercentValue(newBenchWeight, previousBenchWeight)) ? Colors.green : Colors.redAccent,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Text(
                                  '${isValueIncrease(getPercentValue(newBenchWeight, previousBenchWeight)) ? "+" : "-"}' + getPercentValue(newBenchWeight, previousBenchWeight).toString() + "%",
                                  style: const TextStyle(
                                    fontFamily: 'Glacial',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 7,),
                            Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: isValueIncrease(getPercentValue(newDeadliftWeight, previousDeadliftWeight)) ? Colors.green : Colors.redAccent,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Text(
                                  '${ isValueIncrease(getPercentValue(newDeadliftWeight, previousDeadliftWeight)) ? "+" : ""}' + getPercentValue(newDeadliftWeight, previousDeadliftWeight).toString() + "%",
                                  style: const TextStyle(
                                    fontFamily: 'Glacial',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
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
                    SizedBox(width: 21),
                    Image.asset('assets/icons/dumbbell.png', scale: 24),
                    SizedBox(width: 12),
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
                  SizedBox(width: 20),
                  Stack(
                    children: [
                      Container(
                        width: 310,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(21, 21, 21, 1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(90),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(90),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset('assets/icons/open.png', scale: 20),
                  ),
                ],
              ),
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
              ),
            ),
          ],
        ),
      ),
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
      children: [SelfStoryCircle(), StoryCircle(), StoryCircle(), StoryCircle()],
    );
  }
}

class SelfStoryCircle extends StatefulWidget {

  SelfStoryCircle({Key? key}) : super(key: key);

  @override
  State<SelfStoryCircle> createState() => _SelfStoryCircleCircleState();
}

class _SelfStoryCircleCircleState extends State<SelfStoryCircle> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(
                    'assets/personcard/profileImage.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 45, top: 45),
                child: Center(
                  child: Image.asset('assets/icons/plusRounded.png', scale: 22,),
                )
              )
            ],
          )
        ),
        SizedBox(height: 4),
        Text(
          'Your Story',
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
            border: Border.all(color: Colors.blue, width: 4),
          ),
          child: Center(
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  'assets/personcard/profileImage.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
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
