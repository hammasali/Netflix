import 'package:flutter/material.dart';

class ResponsiveUI extends StatelessWidget {
  final Widget mobile, tablet, desktop;

  const ResponsiveUI({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth >= 1200)
        return desktop;
      else if (constraint.maxWidth >= 800) {
        return tablet ?? mobile;
      } else
        return mobile;
    });
  }
}
