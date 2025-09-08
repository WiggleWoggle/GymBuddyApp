import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_buddy_app/Users.dart';

class ConnectionsPage extends StatefulWidget {
  ConnectionsPage({Key? key}) : super(key: key);

  @override
  State<ConnectionsPage> createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage> {

  List<User> users = mockUsers;
  List<User> displayedUsers = [];
  int currentIndex = 0;
  final int maxVisibleCards = 2;

  @override
  void initState() {
    super.initState();
    displayedUsers = users.take(maxVisibleCards).toList();
    users.remove(displayedUsers);
    currentIndex = maxVisibleCards;
  }

  void updateStack() {
    currentIndex++;

    displayedUsers.removeLast();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 21, 21, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: PersonPanelStackWidget()
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

class PersonPanelStackWidget extends StatefulWidget {

  const PersonPanelStackWidget({super.key});

  @override
  State<PersonPanelStackWidget> createState() => _PersonPanelStackWidgetState();
}

class _PersonPanelStackWidgetState extends State<PersonPanelStackWidget> {

  int index = 1;
  List<User> displayedUsers = mockUsers.take(1).toList();

  void moveStackUp() {
    if (index < mockUsers.length) {
      setState(() {
        displayedUsers[0] = mockUsers[index];
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 300,
      child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            transitionBuilder: (child, animation) {
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutBack,
              );

              final offsetAnimation = Tween<Offset>(
                begin: const Offset(0, -1.14),
                end: Offset.zero,
              ).animate(curvedAnimation);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            child: displayedUsers.isNotEmpty
                ? PersonPanelSwipeableWidget(
              key: ValueKey(displayedUsers[0].id),
              user: displayedUsers[0],
              isTopCard: true,
              onSwipeLeft: moveStackUp,
              onSwipeRight: moveStackUp,
            )
                : const SizedBox.shrink(),
          )
      )
    );
  }
}

class PersonPanelSwipeableWidget extends StatefulWidget {

  const PersonPanelSwipeableWidget({super.key, required this.onSwipeLeft, required this.onSwipeRight, required this.user, required this.isTopCard, this.onDragUpdate});

  final User user;
  final bool isTopCard;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;
  final ValueChanged<double>? onDragUpdate;

  @override
  State<PersonPanelSwipeableWidget> createState() => _PersonPanelSwipeableWidgetState();

}

class _PersonPanelSwipeableWidgetState extends State<PersonPanelSwipeableWidget> with SingleTickerProviderStateMixin {
  Offset cardOffset = Offset.zero;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  void _swipeCard(Offset targetOffset, VoidCallback onComplete) {
    if (widget.isTopCard)
      _animation = Tween<Offset>(begin: cardOffset, end: targetOffset)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
        ..addListener(() {
          setState(() {
            cardOffset = _animation.value;
          });
        });

      _controller.forward(from: 0).then((_) => onComplete());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          if (widget.isTopCard)
            cardOffset += details.delta;

          final screenWidth = MediaQuery.of(context).size.width;
          final progress = (cardOffset.dx / (screenWidth * 0.5)).clamp(-1.0, 1.0);
          widget.onDragUpdate?.call(progress);
        });
      },
      onPanEnd: (details) {
        if (cardOffset.dx > 150) {
          _swipeCard(Offset(screenWidth, 0), widget.onSwipeRight);
        } else if (cardOffset.dx < -150) {
          _swipeCard(Offset(-screenWidth, 0), widget.onSwipeLeft);
        } else {
          _swipeCard(Offset.zero, () {});
        }
      },
      child: Transform.translate(
        offset: cardOffset,
        child: Transform.rotate(
          angle: cardOffset.dx * 0.0003,
          child: Stack(
            children: [
              PersonCard(user: widget.user, isTopCard: widget.isTopCard),
              Padding(
                padding: EdgeInsets.only(
                    left: 20,
                  top: 27
                ),
                child: IgnorePointer(
                  ignoring: true,
                  child: Opacity(
                    opacity: (cardOffset.dx.abs() / 200).clamp(0, 1),
                    child: Container(
                      width: screenWidth * 0.91,
                      height: MediaQuery.of(context).size.height * 0.62,
                      decoration: BoxDecoration(
                        color: cardOffset.dx > 0
                            ? Colors.green.withOpacity(0.4)
                            : Colors.red.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Image.asset(
                          cardOffset.dx > 0
                              ? 'assets/icons/accept.png'
                              : 'assets/icons/discard.png',
                          scale: 4,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PersonCard extends StatefulWidget {
  PersonCard({Key? key, required this.user, required this.isTopCard}) : super(key: key);

  final User user;
  final bool isTopCard;

  @override
  State<PersonCard> createState() => _PersonPanelState();
}

class _PersonPanelState extends State<PersonCard> {

  bool personCardExpand = false;

  @override
  Widget build(BuildContext context) {

    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 0),
          child: AnimatedSlide(
            duration: Duration(milliseconds: 100),
            offset: widget.isTopCard ? Offset.zero : Offset(0, -0.01),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              height: MediaQuery.of(context).size.height * 0.62,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            widget.user.profilePicturePath,
                            fit: BoxFit.cover,
                          ),
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
                          ),
                        ),
                      ],
                    ),

                    AnimatedSlide(
                      offset: personCardExpand
                          ? const Offset(-1, 0)
                          : Offset.zero,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                bottom: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.user.profileName +
                                        ', ' +
                                        widget.user.age
                                            .toString(),
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
                                      Text(
                                        widget.user.town +
                                            ', ' +
                                            widget.user.city,
                                        style: const TextStyle(
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
                                      Text(
                                        widget.user.height +
                                            ", " +
                                            widget.user.weight,
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
                                'assets/icons/medal.png',
                                scale: 18,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                widget.user.division.name +
                                    ' Lifter',
                                style: const TextStyle(
                                  fontFamily: 'Glacial',
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
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
                            child: Image.asset(
                              'assets/icons/more.png',
                              scale: 12,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedSlide(
                          offset: personCardExpand
                              ? Offset(0, 0)
                              : const Offset(2, 0),
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
                                    overflow: TextOverflow.clip,
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
                                    Image.asset(
                                      'assets/icons/pin.png',
                                      scale: 28,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '315 lb Bench Press',
                                      style: const TextStyle(
                                        fontFamily: 'Glaical',
                                        color: Colors.white,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/pin.png',
                                      scale: 28,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '635 lb Deadlift',
                                      style: const TextStyle(
                                        fontFamily: 'Glaical',
                                        color: Colors.white,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip,
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
                                    Image.asset(
                                      'assets/icons/clock.png',
                                      scale: 28,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Push / Pull / Legs - 6 Days',
                                      style: const TextStyle(
                                        fontFamily: 'Glaical',
                                        color: Colors.white,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
          child: StatsPanel(workoutName: "Bench Press", pounds: 315),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StatsPanel(workoutName: "Deadlift", pounds: 635),
        ),
      ],
    );
  }
}

class StatsPanel extends StatelessWidget {
  final String workoutName;
  final int pounds;

  const StatsPanel({
    super.key,
    required this.workoutName,
    required this.pounds,
  });

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
