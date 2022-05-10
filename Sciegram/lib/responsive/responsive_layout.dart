import 'package:flutter/material.dart';
import 'package:sciegram/utils/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout(
      {Key? key, required this.desktopBody, required this.mobileBody})
      : super(key: key);

  Widget desktopBody;
  Widget mobileBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth <= max_width){
        return mobileBody;
      }
      else{
        return desktopBody;
      }
    });
  }
}
