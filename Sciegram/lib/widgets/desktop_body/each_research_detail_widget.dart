import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sciegram/controllers/each_research_controller.dart';
import '../../models/research_model.dart';
import '../../routers/app_routes.dart';

class EachResearchDetailWidget extends StatefulWidget {
  EachResearchDetailWidget({
    Key? key,
    required this.research_model,
  }) : super(key: key);
  Rx<ResearchModel> research_model;

  @override
  State<EachResearchDetailWidget> createState() =>
      _EachResearchDetailWidgetState();
}

class _EachResearchDetailWidgetState extends State<EachResearchDetailWidget> {
  final controller = Get.put(EachResearchController());

  //For Showing date and time correctly
  String getDateTime(DateTime t) {
    final DateFormat format = DateFormat('yyyy-MM-dd');
    String formatted = format.format(t);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
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
                                  '${getDateTime(widget.research_model.value.time!.toDate())}',
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
                              setState(() {
                                controller.vouteAppRaiting(
                                    widget.research_model.value.id,
                                    widget.research_model.value.email!);
                              });
                            },
                            child: FaIcon(FontAwesomeIcons.arrowUp),
                          ),
                          margin: EdgeInsets.only(left: 5, right: 5),
                        ),
                        Container(child: Obx(() {
                          return Text(
                              '${widget.research_model.value.raiting?.length ?? '0'}');
                        })),
                        Container(
                            child: InkWell(
                              onTap: () {
                                controller.vouteDownRaiting(
                                    widget.research_model.value.id,
                                    widget.research_model.value.email!);
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
                    '${widget.research_model.value.title}',
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
              child: Text('${widget.research_model.value.subject}'),
            ),
            //Comment Section
            Container(
              child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //IMage Section
                        Container(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('img/klon.jpg'),
                          ),
                        ),
                        //Name and Comment section
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cemil Gunaydin',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '07.05.2022/11:53',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.blueGrey),
                                    )
                                  ],
                                ),
                                Text(
                                  'Software Enginneer',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blueGrey),
                                ),
                                Container(
                                  color: Colors.black12,
                                  child: Text(
                                      'My Comment is this is very super action when l see'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
        //color: Colors.black,
      ),
    );
  }
}
