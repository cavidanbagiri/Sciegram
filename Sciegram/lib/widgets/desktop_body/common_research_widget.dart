import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciegram/controllers/common_research_controller.dart';
import 'package:sciegram/models/research_model.dart';
import 'package:sciegram/widgets/desktop_body/each_research_widget.dart';

class CommonResearchWidget extends GetView<CommonResearchController> {
  CommonResearchWidget({Key? key}) : super(key: key);
  final contoller = Get.put(CommonResearchController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ResearchModel>>(
        stream: controller.getResearchs(),
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data ;
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:data?.length,
            itemBuilder: (context, index) {
            return EachResearchWidget(research_model: data?[index],);
        });
      } else if (snapshot.hasError) {
        return Text('There is an Error here ${snapshot.error.toString()}');
      } else {
        if(snapshot.data == null){
          return Text('Nothing To Show');
        }
        return Center(child: CircularProgressIndicator(),);
      }
    });
  }
}

// Container(
// child: ListView.builder(
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// itemCount: 2,
// itemBuilder: (context, index) {
// return EachResearchWidget();
// },
// ),
// );
