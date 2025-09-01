import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(shape: BoxShape.circle),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/personcard/profileImage1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Alex',
                                        style: TextStyle(
                                          fontFamily: 'Glacial',
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Active 15m ago',
                                        style: TextStyle(
                                          fontFamily: 'Glacial',
                                          color: Color.fromRGBO(200, 200, 200, 1),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: Column(
        children: [
          SizedBox(height: 70),
          // Fixed Header
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
          ),
          // Scrollable Messages Container
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
                child: Column(
                  children: const [
                    SentMessage(messageContent: "Hello", sent: false),
                    SentMessage(messageContent: "Hi there!", sent: true),
                    SentMessage(messageContent: "How's it going?", sent: false),
                    SentMessage(messageContent: "Good, thanks!", sent: true),
                    // Add more messages here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SentMessage extends StatelessWidget {

  final String messageContent;
  final bool sent;

  const SentMessage({super.key, required this.messageContent, required this.sent});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sent ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          constraints: const BoxConstraints(
            maxWidth: 250,
          ),
          decoration: BoxDecoration(
            color: sent ? Colors.blue : Color.fromRGBO(84, 84, 84, 1),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
              bottomLeft: sent ? const Radius.circular(15) : const Radius.circular(0),
              bottomRight: sent ? const Radius.circular(0) : const Radius.circular(15),
            ),
          ),
          child: Text(
            messageContent,
            style: const TextStyle(
              fontFamily: 'Glacial',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        )
      )
    );
  }
}

class MessagesDefaultView extends StatelessWidget {
  final Function() onMessageTap;

  const MessagesDefaultView({Key? key, required this.onMessageTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 25, bottom: 10),
          child: Text(
            'Online',
            style: TextStyle(
              fontFamily: 'Glacial',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        OnlineFriendsHeader(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 25, top: 30),
          child: Text(
            'Messages',
            style: TextStyle(
              fontFamily: 'Glacial',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Column(
          children: [
            MessageTab(
              notificationCount: 0,
              profileName: 'Alex',
              profilePicture: 'assets/personcard/profileImage.png',
              mostRecentMessage:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
              onTap: () => onMessageTap(),
            ),
            MessageTab(
              notificationCount: 1,
              profileName: 'Alex',
              profilePicture: 'assets/personcard/profileImage.png',
              mostRecentMessage:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
              onTap: () => onMessageTap(),
            ),
            MessageTab(
              notificationCount: 10,
              profileName: 'Alex',
              profilePicture: 'assets/personcard/profileImage.png',
              mostRecentMessage:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
              onTap: () => onMessageTap(),
            ),
            MessageTab(
              notificationCount: 0,
              profileName: 'Alex',
              profilePicture: 'assets/personcard/profileImage.png',
              mostRecentMessage:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
              onTap: () => onMessageTap(),
            ),
            MessageTab(
              notificationCount: 0,
              profileName: 'Alex',
              profilePicture: 'assets/personcard/profileImage.png',
              mostRecentMessage:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
              onTap: () => onMessageTap(),
            ),
            MessageTab(
              notificationCount: 0,
              profileName: 'Alex',
              profilePicture: 'assets/personcard/profileImage.png',
              mostRecentMessage:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
              onTap: () => onMessageTap(),
            ),
            MessageTab(
              notificationCount: 0,
              profileName: 'Alex',
              profilePicture: 'assets/personcard/profileImage.png',
              mostRecentMessage:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
              onTap: () => onMessageTap(),
            ),
          ],
        ),
      ],
    );
  }
}

class MessageTab extends StatefulWidget {
  final int notificationCount;
  final String profilePicture;
  final String profileName;
  final String mostRecentMessage;
  final VoidCallback? onTap;

  MessageTab({
    Key? key,
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
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      widget.profilePicture,
                      fit: BoxFit.cover,
                    ),
                  ),
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
            if (widget.notificationCount > 0)
              Positioned(
                top: 35,
                right: 0,
                child: Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(90)),
                  ),
                  child: Center(
                    child: Text(
                      widget.notificationCount > 9
                          ? '9+'
                          : widget.notificationCount.toString(),
                      style: TextStyle(
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

    int maxLength = (screenWidth / 15).floor();

    if (message.length <= maxLength) {
      return message;
    }
    return '${message.substring(0, maxLength)}...';
  }
}

class OnlineFriendsHeader extends StatefulWidget {
  OnlineFriendsHeader({Key? key}) : super(key: key);

  @override
  State<OnlineFriendsHeader> createState() => _OnlineFriendsHeaderState();
}

class _OnlineFriendsHeaderState extends State<OnlineFriendsHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: OnlineFriendCircle(),
          );
        },
      ),
    );
  }
}

class OnlineFriendCircle extends StatefulWidget {
  OnlineFriendCircle({Key? key}) : super(key: key);

  @override
  State<OnlineFriendCircle> createState() => _OnlineFriendCircleState();
}

class _OnlineFriendCircleState extends State<OnlineFriendCircle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/personcard/profileImage.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
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
