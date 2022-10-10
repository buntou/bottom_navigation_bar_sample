import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_01/src/pages/sample_page.dart';

class AppWithCupertinoScaffoldNavigationBar extends ConsumerWidget {
  AppWithCupertinoScaffoldNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(initialRoute: 'home', routes: {
      'home': ((context) => const CupertinoScaffoldNavigationBar()),
    });
  }
}

class CupertinoScaffoldNavigationBar extends ConsumerStatefulWidget {
  const CupertinoScaffoldNavigationBar({Key? key}) : super(key: key);

  @override
  CupertinoScaffoldNavigationBarState createState() =>
      CupertinoScaffoldNavigationBarState();
}

class CupertinoScaffoldNavigationBarState extends ConsumerState {
  int currentPageIndex = 0;
  final CupertinoTabController _tabController = CupertinoTabController();

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _pages = [
    const SamplePage(label: "Explore", pageColor: Colors.red),
    const SamplePage(label: "Commute", pageColor: Colors.amber),
    const SamplePage(label: "Saved", pageColor: Colors.blue),
  ];

  final List<BottomNavigationBarItem> navigationBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      label: 'Explore',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.commute),
      label: 'Commute',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_border),
      label: 'Saved',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        controller: _tabController,
        tabBar: CupertinoTabBar(
          items: navigationBarItem,
          onTap: (index) {
            manageNavigation(index);
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            // navigatorKey: _tabNavKeyList[index],
            builder: (BuildContext context) {
              return CupertinoPageScaffold(child: _pages[index]);
            },
          );
        });
  }

  void manageNavigation(int index) {
    _tabController.index = index;
  }
}

// class SamplePage extends StatelessWidget {
//   const SamplePage({
//     required this.label,
//     this.pageColor,
//     Key? key,
//   }) : super(key: key);
//   final String label;
//   final Color? pageColor;

//   @override
//   Widget build(BuildContext context) {
//     Color defaultColor = Colors.black;
//     if (pageColor != null) {
//       defaultColor = pageColor!;
//     }

//     logger.i("build sample page A");

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(label),
//       ),
//       body: Container(
//         color: defaultColor,
//         child: Center(
//           child: Text(label),
//         ),
//       ),
//     );
//   }
// }
