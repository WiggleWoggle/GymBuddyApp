import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectionsPage extends StatefulWidget {
  ConnectionsPage({Key? key}) : super(key: key);

  @override
  State<ConnectionsPage> createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 21, 21, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.107),
                  child: PersonCard(),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LikeButtonWidget(),
                      CheerButtonWidget(),
                      SkipButtonWidget()
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 20, top: 30),
                  child: Image.asset('assets/icons/logo.png', scale: 6),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 27),
                  child: FilterWidget(),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class LikeButtonWidget extends StatefulWidget {
  LikeButtonWidget({Key? key}) : super(key: key);

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(90)),
      ),
      child: Image.asset('assets/icons/plus.png', scale: 20),
    );
  }
}

class CheerButtonWidget extends StatefulWidget {
  CheerButtonWidget({Key? key}) : super(key: key);

  @override
  State<CheerButtonWidget> createState() => _CheerButtonWidgetState();
}

class _CheerButtonWidgetState extends State<CheerButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(90)),
      ),
      child: Image.asset('assets/icons/star.png', scale: 20),
    );
  }
}

class SkipButtonWidget extends StatefulWidget {
  SkipButtonWidget({Key? key}) : super(key: key);

  @override
  State<SkipButtonWidget> createState() => _SkipButtonWidgetState();
}

class _SkipButtonWidgetState extends State<SkipButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(90)),
      ),
      child: Image.asset('assets/icons/x.png', scale: 20    ),
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
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Image.asset('assets/icons/filter.png', scale: 20),
    );
  }
}

class PersonCard extends StatefulWidget {
  PersonCard({Key? key}) : super(key: key);

  @override
  State<PersonCard> createState() => _PersonPanel();
}

class _PersonPanel extends State<PersonCard> {
  bool personCardExpand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.91,
        height: MediaQuery.of(context).size.height * 0.6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset('assets/personcard/profileImage.png', fit: BoxFit.cover,),
                    ),

                    Positioned.fill(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black, Colors.transparent],
                              stops: [0.0, personCardExpand ? 1.0 : 0.4],
                            ),
                          ),
                        )
                    ),
                  ]
              ),

              AnimatedSlide(
                offset: personCardExpand ? const Offset(-1, 0) : Offset.zero,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Stack(
                  children: [
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
                                Image.asset(
                                  'assets/icons/location.png',
                                  scale: 30,
                                ),
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
                                Image.asset(
                                  'assets/icons/information.png',
                                  scale: 30,
                                ),
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
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Container(
                    width: 145,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(60),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/medal.png', scale: 18),
                          Padding(
                            padding: EdgeInsets.only(left: 3),
                            child: Text(
                              'Titan Lifter',
                              style: TextStyle(
                                fontFamily: 'Glacial',
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        personCardExpand = !personCardExpand;
                      });
                    },
                    child: AnimatedRotation(
                      turns: personCardExpand ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Image.asset('assets/icons/more.png', scale: 12),
                    ),
                  ),
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Align(
                    alignment: Alignment.center,
                    child: AnimatedSlide(
                        offset: personCardExpand ? Offset(0, 0) : const Offset(2, 0),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Container(
                          width: 330,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bio',
                                style: const TextStyle(
                                  fontFamily: 'League',
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              Text(
                                'My name is Alex and I’ve been lifting forover 5 years. I need a gym buddy to spotme and help me film gym content.',
                                style: const TextStyle(
                                    fontFamily: 'Glaical',
                                    color: Colors.white,
                                    fontSize: 16,
                                    overflow: TextOverflow.clip
                                ),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                'Pinned Stats',
                                style: const TextStyle(
                                  fontFamily: 'League',
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Image.asset('assets/icons/pin.png', scale: 28),
                                  const SizedBox(width: 10),
                                  Text(
                                    '315 lb Bench Press',
                                    style: const TextStyle(
                                        fontFamily: 'Glaical',
                                        color: Colors.white,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.asset('assets/icons/pin.png', scale: 28),
                                  const SizedBox(width: 10),
                                  Text(
                                    '635 lb Deadlift',
                                    style: const TextStyle(
                                        fontFamily: 'Glaical',
                                        color: Colors.white,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Text(
                                'Routine',
                                style: const TextStyle(
                                  fontFamily: 'League',
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Image.asset('assets/icons/clock.png', scale: 28),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Push / Pull / Legs - 6 Days',
                                    style: const TextStyle(
                                        fontFamily: 'Glaical',
                                        color: Colors.white,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatsPanelGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: StatsPanel(
            workoutName: "Bench Press",
            pounds: 315,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StatsPanel(
            workoutName: "Deadlift",
            pounds: 635,
          ),
        ),
      ],
    );
  }
}

class StatsPanel extends StatelessWidget {

  final String workoutName;
  final int pounds;

  const StatsPanel({super.key, required this.workoutName, required this.pounds});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),

    );
  }
}
