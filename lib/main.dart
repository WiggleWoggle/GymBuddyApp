import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:gym_buddy_app/pages/ConnectionsPage.dart';
import 'package:gym_buddy_app/pages/HomePage.dart';
import 'package:gym_buddy_app/pages/MessagesPage.dart';
import 'package:gym_buddy_app/pages/ProfilePage.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageSwitcher());
  }
}

class PageSwitcher extends StatefulWidget {

  const PageSwitcher({super.key});

  @override
  State<PageSwitcher> createState() => _PageSwitcher();
}

class _PageSwitcher extends State<PageSwitcher> {

  late bool switcherMessageContainer = false;

  int selectedIndex = 0;

  void _setMessageContainer(bool value) {
    setState(() {
      switcherMessageContainer = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    final pages = [
      HomePage(),
      ConnectionsPage(),
      MessagesPage(onDirectMessageToggle: _setMessageContainer),
      ProfilePage(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: KeyedSubtree(
              key: ValueKey<int>(selectedIndex),
              child: pages[selectedIndex],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  width: switcherMessageContainer ? 400 : 300,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Container(
                      width: switcherMessageContainer ? 400 : 300,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: switcherMessageContainer ? Color.fromRGBO(21, 21, 21, 1) : Colors.black,
                        borderRadius: const BorderRadius.all(Radius.circular(60)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Stack(
                            children: [
                              AnimatedOpacity(
                                opacity: switcherMessageContainer ? 0.0 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: IgnorePointer(
                                    ignoring: switcherMessageContainer,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: List.generate(4, (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() => selectedIndex = index);
                                          },
                                          child: UnderlinePageIcon(
                                            selected: selectedIndex == index,
                                            activePageIconpath: [
                                              'assets/icons/homeActive.png',
                                              'assets/icons/connectionActive.png',
                                              'assets/icons/messagesActive.png',
                                              'assets/icons/profileActive.png',
                                            ][index],
                                            inactivePageIconpath: [
                                              'assets/icons/homeInactive.png',
                                              'assets/icons/connectionInactive.png',
                                              'assets/icons/messagesInactive.png',
                                              'assets/icons/profileInactive.png',
                                            ][index],
                                          ),
                                        );
                                      }),
                                    ),
                                  )
                                ),
                              ),
                              IgnorePointer(
                                ignoring: !switcherMessageContainer,
                                child: AnimatedOpacity(
                                  opacity: switcherMessageContainer ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: const TextStyle(
                                              fontFamily: 'Glacial',
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                            decoration: const InputDecoration(
                                              hintText: 'Message...',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Glacial',
                                                color: Color.fromRGBO(142, 142, 142, 1),
                                                fontSize: 18,
                                              ),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                            ),
                                            cursorColor: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/icons/gallery.png',
                                              scale: 13,
                                            ),
                                            const SizedBox(width: 10),
                                            Image.asset(
                                              'assets/icons/camera.png',
                                              scale: 13,
                                            ),
                                            const SizedBox(width: 10),
                                            AnimatedScale(
                                              scale: 1.0,
                                              duration: Duration(milliseconds: 100),
                                              child: Image.asset(
                                                'assets/icons/send.png',
                                                scale: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ),
                                ),
                              )
                            ],
                          )
                      )
                  ),
                )
            ),
          ),
        ],
      )
    );
  }
}

class UnderlinePageIcon extends StatefulWidget {

  final bool selected;
  final String activePageIconpath;
  final String inactivePageIconpath;

  UnderlinePageIcon({Key? key, required this.selected, required this.activePageIconpath, required this.inactivePageIconpath}) : super(key: key);

  @override
  State<UnderlinePageIcon> createState() => _UnderlinePageIcon();
}

class _UnderlinePageIcon extends State<UnderlinePageIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedScale(
          scale: widget.selected ? 1.0 : 0.9,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Image.asset(
            widget.selected ? widget.activePageIconpath : widget.inactivePageIconpath,
            fit: BoxFit.cover,
            scale: 17,
          ),
        ),
        const SizedBox(height: 6),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: 15,
          height: 4,
          decoration: BoxDecoration(
            color: widget.selected ? Colors.white : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(60)),
          ),
        ),
      ],
    );
  }
}
