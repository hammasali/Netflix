import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubits/appBar/app_bar_cubit.dart';
import 'package:flutter_netflix_responsive_ui/screens/home_screens.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive_ui.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    //The key is provided to stop the page from rendring and maintain the state
    HomeScreen(
      key: PageStorageKey('homescreen'),
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icon = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
          create: (_) => AppBarCubit(), child: _screens[_currentIndex]),
      bottomNavigationBar: !ResponsiveUI.isDesktop(context)
          ? BottomNavigationBar(
              items: _icon
                  .map((title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(
                          icon,
                          size: 30.0,
                        ),
                        title: Text(title),
                      )))
                  .values
                  .toList(),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 10.0,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : null,
    );
  }
}
