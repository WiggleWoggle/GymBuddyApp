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
            ProfileDisplayWidget(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, bottom: 10, top: 20),
              child: Text(
                'Pinned',
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  PinSectionWidget(workout: '315 lb Bench Press'),
                  SizedBox(width: 12),
                  PinSectionWidget(workout: '635 lb Deadlift'),
                  SizedBox(width: 12),
                  Image.asset('assets/icons/plusRounded.png', scale: 16,),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, bottom: 10, top: 40),
              child: Text(
                'Routine',
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            RoutineDropdownWidget(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, bottom: 10, top: 40),
              child: Text(
                'Body Metrics',
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            BodyMetricsWidget(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, bottom: 10, top: 40),
              child: Text(
                'Location',
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            LocationWidget(),
            SizedBox(height: 140,)
          ],
        ),
      ),
    );
  }
}

class LocationWidget extends StatefulWidget {

  LocationWidget({Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 70,
      decoration: BoxDecoration(
        color: Color.fromRGBO(42, 42, 42, 1),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(84, 84, 84, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        width: 85,
                        height: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 11),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      hintStyle: TextStyle(color: Colors.white70),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'City',
                  style: TextStyle(
                    fontFamily: 'Glacial',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(width: 40),
            Row(
              children: [
                Container(
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(84, 84, 84, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        width: 85,
                        height: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 9),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      hintStyle: TextStyle(color: Colors.white70),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'State',
                  style: TextStyle(
                    fontFamily: 'Glacial',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class BodyMetricsWidget extends StatefulWidget {

  BodyMetricsWidget({Key? key}) : super(key: key);

  @override
  State<BodyMetricsWidget> createState() => _BodyMetricsWidgetState();
}

class _BodyMetricsWidgetState extends State<BodyMetricsWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 70,
      decoration: BoxDecoration(
        color: Color.fromRGBO(42, 42, 42, 1),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(84, 84, 84, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        width: 30,
                        height: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 11),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      hintStyle: TextStyle(color: Colors.white70),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ft',
                  style: TextStyle(
                    fontFamily: 'Glacial',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(width: 40),
            Row(
              children: [
                Container(
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(84, 84, 84, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        width: 30,
                        height: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 9),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: '--',
                                      hintStyle: TextStyle(color: Colors.white70),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'in',
                  style: TextStyle(
                    fontFamily: 'Glacial',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(width: 30),
            Text(
              '|',
              style: TextStyle(
                fontFamily: 'Glacial',
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 30,
              ),
            ),
            const SizedBox(width: 30),
            Row(
              children: [
                Container(
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(84, 84, 84, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        width: 30,
                        height: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: '---',
                                      hintStyle: TextStyle(color: Colors.white70),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'lbs',
                  style: TextStyle(
                    fontFamily: 'Glacial',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoutineDropdownWidget extends StatefulWidget {

  RoutineDropdownWidget({Key? key}) : super(key: key);

  @override
  State<RoutineDropdownWidget> createState() => _RoutineDropdownWidgetState();
}

class _RoutineDropdownWidgetState extends State<RoutineDropdownWidget> {

  String? selectedRoutine;

  final List<String> presetRoutines = [
    'Push/Pull/Legs - 6 days a week',
    'Upper/Lower - 4 days a week',
    'Full Body - Every other day',
    'Bro Split - 5 days a week',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 70,
      decoration: BoxDecoration(
        color: Color.fromRGBO(42, 42, 42, 1),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Container(
        margin: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Color.fromRGBO(84, 84, 84, 1),
          borderRadius: const BorderRadius.all(Radius.circular(7)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: Color.fromRGBO(84, 84, 84, 1),
            borderRadius: BorderRadius.circular(12),
            value: selectedRoutine,
            hint: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Select Routine",
                style: TextStyle(
                  fontFamily: 'Glacial',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            isExpanded: true,
            items: presetRoutines.map((routine) {
              return DropdownMenuItem<String>(
                value: routine,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    routine,
                    style: TextStyle(
                      fontFamily: 'Glacial',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedRoutine = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class PinSectionWidget extends StatelessWidget {

  final String workout;

  const PinSectionWidget({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/pin_dark.png',
            scale: 28,
          ),
          const SizedBox(width: 5),
          Text(
            workout,
            style: const TextStyle(
              fontFamily: 'Glacial',
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
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
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 110),
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(84, 84, 84, 1),
                                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                                            ),
                                            child: Image.asset('assets/icons/moreDots.png', scale: 35),
                                          )
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
                      'My name is Alex and I’ve been lifting for over 5 years. I need a gym buddy to spot me and help me film gym content.',
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

