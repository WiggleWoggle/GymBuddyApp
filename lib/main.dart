import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:gym_buddy_app/pages/ConnectionsPage.dart';
import 'package:gym_buddy_app/pages/HomePage.dart';
import 'package:gym_buddy_app/pages/MessagesPage.dart';

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

  int selectedIndex = 0;

  final pages = [
    HomePage(),
    ConnectionsPage(),
    MessagesPage(),
    ConnectionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: Container(
              width: 300,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(60)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
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
              ),
            ),
          ),
        ),
      ],
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
          scale: widget.selected ? 1.0 : 0.9, // scale up when selected
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
