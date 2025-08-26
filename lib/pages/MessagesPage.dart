import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
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
                  mostRecentMessage: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
                ),
                MessageTab(
                  notificationCount: 1,
                  profileName: 'Alex',
                  profilePicture: 'assets/personcard/profileImage.png',
                  mostRecentMessage: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
                ),
                MessageTab(
                  notificationCount: 10,
                  profileName: 'Alex',
                  profilePicture: 'assets/personcard/profileImage.png',
                  mostRecentMessage: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
                ),
                MessageTab(
                  notificationCount: 0,
                  profileName: 'Alex',
                  profilePicture: 'assets/personcard/profileImage.png',
                  mostRecentMessage: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
                ),
                MessageTab(
                  notificationCount: 0,
                  profileName: 'Alex',
                  profilePicture: 'assets/personcard/profileImage.png',
                  mostRecentMessage: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
                ),
                MessageTab(
                  notificationCount: 0,
                  profileName: 'Alex',
                  profilePicture: 'assets/personcard/profileImage.png',
                  mostRecentMessage: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
                ),
                MessageTab(
                  notificationCount: 0,
                  profileName: 'Alex',
                  profilePicture: 'assets/personcard/profileImage.png',
                  mostRecentMessage: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in neque a dolor placerat fringilla. Duis pulvinar, purus eu hendrerit dapibus, libero tortor scelerisque nibh, eu placerat neque metus ut nunc. Duis ac mattis turpis, sit amet iaculis eros. Suspendisse ac lobortis quam, sed auctor quam. Donec sed ante ac nisi maximus tempor. Sed varius ex a neque aliquet vulputate. Donec blandit rutrum elit quis aliquet.',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MessageTab extends StatefulWidget {

  final int notificationCount;
  final String profilePicture;
  final String profileName;
  final String mostRecentMessage;

  MessageTab({Key? key, required this.notificationCount, required this.profilePicture, required this.profileName, required this.mostRecentMessage}) : super(key: key);

  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.89,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: const Border(
          bottom: BorderSide(
            color: Color.fromRGBO(50, 50, 50, 1),
            width: 2.0,
          ),
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
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
                  borderRadius: const BorderRadius.all(
                    Radius.circular(90),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.notificationCount > 9 ? '9+' : widget.notificationCount.toString(),
                    style: TextStyle(
                      fontFamily: 'Glacial',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )
              ),
            ),
        ],
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: ClipOval(
                    child: Image.asset('assets/personcard/profileImage.png', fit: BoxFit.cover),
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
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              )
            ],
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