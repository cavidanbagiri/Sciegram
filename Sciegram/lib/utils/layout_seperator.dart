

import 'package:flutter/material.dart';
import 'package:sciegram/responsive/desktopbody.dart';
import 'package:sciegram/responsive/mobilebody.dart';
import 'package:sciegram/responsive/responsive_layout.dart';

class LayoutSeperator extends StatelessWidget {
  const LayoutSeperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(desktopBody: DesktopBody(), mobileBody: MobileBody());
  }
}
