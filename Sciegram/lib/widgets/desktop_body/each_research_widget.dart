import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sciegram/controllers/each_research_controller.dart';
import '../../models/research_model.dart';
import '../../routers/app_routes.dart';

class EachResearchWidget extends GetView<EachResearchController> {
  EachResearchWidget({
    Key? key,
    required this.research_model,
  }) : super(key: key);
  final controller = Get.put(EachResearchController());
  var research_model;

  String getDateTime(DateTime t) {
    final DateFormat format = DateFormat('yyyy-MM-dd');
    String formatted = format.format(t);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.RESEARCH, arguments: research_model.id);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Main Research Section
            Container(
              margin: EdgeInsets.all(8),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Badge(
                            badgeContent: const Text(
                              '',
                            ),
                            position: BadgePosition.bottomEnd(),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('/img/klon.jpg'),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: const Text(
                                  'Cavidan Bagirli',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: const Text(
                                  'Flutter Developer',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${getDateTime(research_model.time!.toDate())}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blueGrey),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              controller.vouteAppRaiting(
                                  research_model.id, research_model.email);
                            },
                            child: FaIcon(FontAwesomeIcons.arrowUp),
                          ),
                          margin: EdgeInsets.only(left: 5, right: 5),
                        ),
                        Container(
                          child:
                              Text('${research_model.raiting?.length ?? '0'}'),
                        ),
                        Container(
                            child: InkWell(
                              onTap: () {
                                controller.vouteDownRaiting(
                                    research_model.id, research_model.email);
                              },
                              child: FaIcon(FontAwesomeIcons.arrowDown),
                            ),
                            margin: EdgeInsets.only(left: 5, right: 5)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Title Section
            Container(
              margin: EdgeInsets.only(left: 10),
              //padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
              child: Row(
                children: [
                  Text(
                    '${research_model.title}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //Subject Section
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Text('${research_model.subject}'),
            ),
          ],
        ),
        //color: Colors.black,
      ),
    );
  }
}
