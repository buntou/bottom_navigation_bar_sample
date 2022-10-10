import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_01/src/pages/sample_page.dart';
import '../utils/debug_logger.dart';

class AppWithMaterialScaffoldNavigationBar extends ConsumerWidget {
  AppWithMaterialScaffoldNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(initialRoute: 'home', routes: {
      'home': ((context) => const MaterialScaffoldNavigationBar()),
    });
  }
}

class MaterialScaffoldNavigationBar extends ConsumerStatefulWidget {
  const MaterialScaffoldNavigationBar({Key? key}) : super(key: key);

  @override
  MaterialScaffoldNavigationBarState createState() =>
      MaterialScaffoldNavigationBarState();
}

class MaterialScaffoldNavigationBarState extends ConsumerState {
  int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _pages = [
    const SamplePage(label: "Explore", pageColor: Colors.red),
    const SamplePage(label: "Commute", pageColor: Colors.amber),
    const SamplePage(label: "Saved", pageColor: Colors.blue),
  ];

  final List<NavigationDestination> navigationBarItem = [
    const NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
    const NavigationDestination(icon: Icon(Icons.commute), label: 'Commute'),
    const NavigationDestination(
        selectedIcon: Icon(Icons.bookmark),
        icon: Icon(Icons.bookmark_border),
        label: 'Saved'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            manageNavigation(index);
          },
          selectedIndex: currentPageIndex,
          destinations: navigationBarItem),
      body: _pages[currentPageIndex],
    );
  }

  void manageNavigation(int index) {
    setState(() {
      logger.i("tapped index: ${index}");
      currentPageIndex = index;
    });
  }
}
