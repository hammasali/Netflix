import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive_ui.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffSet;

  const CustomAppBar({Key key, this.scrollOffSet = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        color: Colors.black
            .withOpacity((scrollOffSet / 350).clamp(0, 1).toDouble()),
        child: ResponsiveUI(
          mobile: _CustomAppBarMobile(),
          desktop: _CustomAppBarDesktop(),
        ));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image(image: AssetImage(Assets.netflixLogo0)),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _AppBarButtons(
                  title: "Tv Shows",
                  onTap: () => print('Tv'),
                ),
                _AppBarButtons(
                  title: "Movies",
                  onTap: () => print('movie'),
                ),
                _AppBarButtons(
                  title: "My List",
                  onTap: () => print('Tv'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image(image: AssetImage(Assets.netflixLogo1)),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _AppBarButtons(
                  title: "Home",
                  onTap: () => print('Home'),
                ),
                _AppBarButtons(
                  title: "Tv Shows",
                  onTap: () => print('Tv'),
                ),
                _AppBarButtons(
                  title: "Movies",
                  onTap: () => print('movie'),
                ),
                _AppBarButtons(
                  title: "Latest",
                  onTap: () => print('lastes'),
                ),
                _AppBarButtons(
                  title: "My List",
                  onTap: () => print('myList'),
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(Icons.search),
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    iconSize: 28.0,
                    onPressed: () {}),
                _AppBarButtons(
                  title: "KIDS",
                  onTap: () => print('Home'),
                ),
                _AppBarButtons(
                  title: "DVD",
                  onTap: () => print('Tv'),
                ),
                IconButton(
                    icon: Icon(Icons.card_giftcard),
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    iconSize: 28.0,
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.notifications),
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    iconSize: 28.0,
                    onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButtons extends StatelessWidget {
  String title;
  final Function onTap;

  _AppBarButtons({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
