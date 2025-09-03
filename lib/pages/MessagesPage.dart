import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_buddy_app/UserDirectMessages.dart';

class MessagesPage extends StatefulWidget {

  final Function(bool) onDirectMessageToggle;

  const MessagesPage({Key? key, required this.onDirectMessageToggle}) : super(key: key);


  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> with SingleTickerProviderStateMixin {
  bool _showDirectMessage = false;
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<Offset> _backgroundSlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _backgroundSlideAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(-1, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void openDirectMessage() {
    setState(() {
      _showDirectMessage = true;
      _controller.forward();
      widget.onDirectMessageToggle(true);
    });
  }

  void goBackToMessages() {
    _controller.reverse().then((_) {
      setState(() {
        _showDirectMessage = false;
        widget.onDirectMessageToggle(false);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(21, 21, 21, 1),
        body: AnimatedContainer(
        duration: Duration(milliseconds: 100),
          color: _showDirectMessage ?  Colors.black :  Color.fromRGBO(21, 21, 21, 1),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 70),
                          child: Image.asset('assets/icons/logo.png', scale: 6),
                        ),
                      ),
                      SingleChildScrollView(
                          child:
                          SlideTransition(
                            position: _backgroundSlideAnimation,
                            child: MessagesDefaultView(onMessageTap: openDirectMessage),
                          )
                      )
                    ],
                  ),

                  if (_showDirectMessage)
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: SlideTransition(
                          position: _slideAnimation,
                          child: DirectMessageView(onTap: goBackToMessages)
                      ),
                    )
                ],
              ),
            ),
            if (_showDirectMessage)
              SlideTransition(
                  position: _slideAnimation,
                  child: Stack(
                    children: [
                      Container(
                        color: Color.fromRGBO(21, 21, 21, 1),
                        height: 201,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, top: 70),
                                child: Image.asset('assets/icons/logo.png', scale: 6),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100,
                              color: const Color.fromRGBO(21, 21, 21, 1),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: goBackToMessages,
                                    child: Container(
                                      width: 40,
                                      height: 60,
                                      child: Image.asset('assets/icons/back.png', scale: 24),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(shape: BoxShape.circle),
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/personcard/testPfp.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 1,
                                          right: 0,
                                          child: Container(
                                            width: 19,
                                            height: 19,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.black, width: 2),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Aditya',
                                        style: TextStyle(
                                          fontFamily: 'Glacial',
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Active now',
                                        style: TextStyle(
                                          fontFamily: 'Glacial',
                                          color: Color.fromRGBO(200, 200, 200, 1),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: PopupMenuButton<String>(
                                      onSelected: (value) {
                                        if (value == 'block') {
                                        } else if (value == 'report') {
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      color: const Color.fromRGBO(42, 42, 42, 1),
                                      tooltip: "",
                                      splashRadius: 0,
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                            value: 'mute',
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: SizedBox(
                                                width: 90,
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/icons/mute.png', scale: 28),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      'Mute',
                                                      style: TextStyle(
                                                        fontFamily: 'Glacial',
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                        ),
                                        PopupMenuItem(
                                          value: 'report',
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                              width: 90,
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/icons/report.png', scale: 28),
                                                  const SizedBox(width: 10),
                                                  const Text(
                                                    'Report',
                                                    style: TextStyle(
                                                      fontFamily: 'Glacial',
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ),
                                        PopupMenuItem(
                                            value: 'block',
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: SizedBox(
                                                width: 90,
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/icons/block.png', scale: 28),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      'Block',
                                                      style: TextStyle(
                                                        fontFamily: 'Glacial',
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                        ),
                                      ],
                                      child: Image.asset(
                                        'assets/icons/moreDots.png',
                                        scale: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ),
          ],
        )
      )
    );
  }
}

class DirectMessageView extends StatelessWidget {
  final VoidCallback? onTap;

  DirectMessageView({Key? key, required this.onTap}) : super(key: key);

  List<Message> messageView = mockMessages;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: Column(
        children: [
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color.fromRGBO(50, 50, 50, 1), width: 1),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: ConversationColumn(messages: messageView,)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConversationColumn extends StatelessWidget {
  final List<Message> messages;

  const ConversationColumn({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    final grouped = groupMessagesByDate(messages);

    final sortedDates = grouped.keys.toList()..sort((a, b) => a.compareTo(b));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: sortedDates.map((date) {
        final messagesForDate = grouped[date]!;
        final dayLabel = getDayLabel(date);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  dayLabel,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: 'Glacial',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            ...messagesForDate.map((msg) => SentMessage(
              messageContent: msg.messageContent,
              sent: msg.isSent,
            )),
          ],
        );
      }).toList(),
    );
  }
}

class SentMessage extends StatefulWidget {

  final String messageContent;
  final bool sent;

  const SentMessage({super.key, required this.messageContent, required this.sent});

  @override
  State<SentMessage> createState() => _SentMessageState();
}

class _SentMessageState extends State<SentMessage> {

  bool _heldDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => setState(() => _heldDown = !_heldDown),
      //onLongPressEnd: (_) => setState(() => _heldDown = false),
      child: AnimatedScale(
        duration: _heldDown ? Duration(milliseconds: 150) : Duration(milliseconds: 250),
        scale: _heldDown ? 1.2 : 1.0,
        curve: _heldDown ? Curves.easeInOut : Curves.easeInBack,
        alignment: widget.sent ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment:
            widget.sent ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 40,
                    left: widget.sent ? null : 0,
                    right: widget.sent ? 0 : null,
                    child: AnimatedScale(
                      duration: Duration(milliseconds: 300),
                      scale: _heldDown ? 1.0 : 0.0,
                      curve: _heldDown ? Curves.easeInOutBack : Curves.easeInBack,
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 300),
                        offset: _heldDown ? Offset(0, -0.3) : Offset(0, 1.0),
                        curve: _heldDown ? Curves.easeInOutBack : Curves.easeInBack,
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(84, 84, 84, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AnimatedScale(
                                duration: const Duration(milliseconds: 400),
                                scale: _heldDown ? 1.0 : 0.0,
                                curve: Curves.easeInOutBack,
                                child: Text("😂"),
                              ),
                              AnimatedScale(
                                duration: const Duration(milliseconds: 400),
                                scale: _heldDown ? 1.0 : 0.0,
                                curve: Curves.easeInOutBack,
                                child: Text("👍"),
                              ),
                              AnimatedScale(
                                duration: const Duration(milliseconds: 400),
                                scale: _heldDown ? 1.0 : 0.0,
                                curve: Curves.easeInOutBack,
                                child: Text("🔥"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    constraints: const BoxConstraints(maxWidth: 250),
                    decoration: BoxDecoration(
                      color: widget.sent
                          ? Colors.blue
                          : Color.fromRGBO(84, 84, 84, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15),
                        bottomLeft:
                        widget.sent ? const Radius.circular(15) : const Radius.circular(0),
                        bottomRight:
                        widget.sent ? const Radius.circular(0) : const Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      widget.messageContent,
                      style: const TextStyle(
                        fontFamily: 'Glacial',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesDefaultView extends StatefulWidget {
  final Function() onMessageTap;

  const MessagesDefaultView({Key? key, required this.onMessageTap}) : super(key: key);

  @override
  State<MessagesDefaultView> createState() => _MessagesDefaultViewState();
}

class _MessagesDefaultViewState extends State<MessagesDefaultView> {
  Map<String, bool> activeFilters = {
    "Online": false,
    "Unread": false,
    "Muted": false,
    "Streaks": false,
  };

  void toggleFilter(String name) {
    setState(() {
      activeFilters[name] = !activeFilters[name]!;
    });
  }

  List<MessageTabData> get filteredMessages {
    return messageData.where((msg) {
      if (activeFilters["Online"] == true && !msg.online) return false;
      if (activeFilters["Unread"] == true && msg.notificationCount == 0) return false;
      if (activeFilters["Streaks"] == true && msg.streakLength == 0) return false;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 25, top: 19),
          child: Text(
            'Messages',
            style: TextStyle(
              fontFamily: 'Glacial',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: activeFilters.keys.map((name) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: MessagesFilter(
                  filterName: name,
                  selected: activeFilters[name]!,
                  onTap: () => toggleFilter(name),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: filteredMessages.map((msg) {
            return MessageTab(
              profileName: msg.profileName,
              profilePicture: msg.profilePicture,
              online: msg.online,
              notificationCount: msg.notificationCount,
              streakLength: msg.streakLength,
              mostRecentMessage: msg.mostRecentMessage,
              onTap: widget.onMessageTap,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class MessageTab extends StatefulWidget {
  final int notificationCount;
  final int streakLength;
  final String profilePicture;
  final String profileName;
  final String mostRecentMessage;
  final bool online;
  final VoidCallback? onTap;

  MessageTab({
    Key? key,
    required this.online,
    required this.streakLength,
    required this.notificationCount,
    required this.profilePicture,
    required this.profileName,
    required this.mostRecentMessage,
    this.onTap,
  }) : super(key: key);

  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.89,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ClipOval(
                                child: Image.asset(
                                  widget.profilePicture,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          if (widget.online)
                            Positioned(
                              bottom: 1,
                              right: 0,
                              child: Container(
                                width: 19,
                                height: 19,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.profileName,
                        style: const TextStyle(
                          fontFamily: 'Glacial',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      if (widget.notificationCount > 0)
                        Text(
                          trimMessageToFit(widget.mostRecentMessage),
                          style: const TextStyle(
                            fontFamily: 'Glacial',
                            color: Color.fromRGBO(200, 200, 200, 1),
                            fontSize: 18,
                          ),
                        ),
                      if (widget.notificationCount <= 0)
                        Text(
                          trimMessageToFit(widget.mostRecentMessage),
                          style: const TextStyle(
                            fontFamily: 'Glacial',
                            color: Color.fromRGBO(142, 142, 142, 1),
                            fontSize: 18,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.streakLength > 0)
              Positioned(
                top: 35,
                right: 0,
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(42, 42, 42, 1),
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/streak.png', scale: 32),
                        const SizedBox(width: 4),
                        Text(
                          widget.streakLength.toString(),
                          style: const TextStyle(
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
            if (widget.notificationCount > 0)
              Positioned(
                top: 35,
                right: widget.streakLength > 0 ? 62 : 0,
                child: Container(
                  width: 40,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                  ),
                  child: Center(
                    child: Text(
                      widget.notificationCount > 9
                          ? '9+'
                          : widget.notificationCount.toString(),
                      style: const TextStyle(
                        fontFamily: 'Glacial',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String trimMessageToFit(String message) {
    //TODO: change based on screen size
    double screenWidth = MediaQuery.of(context).size.width;

    int maxLength = (screenWidth / 20).floor();

    if (message.length <= maxLength) {
      return message;
    }
    return '${message.substring(0, maxLength)}...';
  }
}

class MessagesFilterRowHeader extends StatefulWidget {

  MessagesFilterRowHeader({Key? key}) : super(key: key);

  @override
  State<MessagesFilterRowHeader> createState() => _MessagesFilterRowHeaderState();
}

class _MessagesFilterRowHeaderState extends State<MessagesFilterRowHeader> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          MessagesFilter(filterName: 'Online', selected: false, onTap: () {  },),
          SizedBox(width: 12),
          MessagesFilter(filterName: 'Unread', selected: false, onTap: () {  },),
          SizedBox(width: 12),
          MessagesFilter(filterName: 'Muted', selected: false, onTap: () {  },),
          SizedBox(width: 12),
          MessagesFilter(filterName: 'Streaks', selected: false, onTap: () {  },),
        ],
      ),
    );
  }
}

class MessagesFilter extends StatelessWidget {
  final String filterName;
  final bool selected;
  final VoidCallback onTap;

  MessagesFilter({
    required this.filterName,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 70),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Color.fromRGBO(42, 42, 42, 1),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          filterName,
          style: TextStyle(
            fontFamily: 'Glacial',
            color: selected ? Colors.black : Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}