

import 'package:flutter/material.dart';
import 'package:sciegram/widgets/desktop_body/post_research_widget.dart';

import '../../widgets/desktop_body/common_research_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Main Side
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width*0.5,
              child: Column(
                children: [
                  postResearchWidget(),
                  CommonResearchWidget(),
                ],
              ),
            ),
            //Right Side
            Container(
              margin: EdgeInsets.only(top:20),
              width: MediaQuery.of(context).size.width*0.20,
              height: MediaQuery.of(context).size.height*1,
              color: Colors.green,
              child: Column(
                children: [

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
