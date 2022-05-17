import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sciegram/controllers/each_research_controller.dart';
import 'package:sciegram/models/research_model.dart';
import '../../widgets/desktop_body/appbar_widget.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;

class EachResearchPage extends StatefulWidget {
  EachResearchPage({Key? key}) : super(key: key);

  @override
  State<EachResearchPage> createState() => _EachResearchPageState();
}

class _EachResearchPageState extends State<EachResearchPage> {
  final controller = Get.put(EachResearchController());

  //For Showing date and time correctly
  String getDateTime(DateTime t) {
    final DateFormat format = DateFormat('yyyy-MM-dd');
    String formatted = format.format(t);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    //For updating each raiting and comments sections
    late Future<Rx<ResearchModel>> dataFuture =
        controller.getArticleWithId(Get.arguments.toString());

    return Scaffold(
        appBar: AppBarWidget(),
        drawer: const Drawer(),
        //with future builder
        //     body: FutureBuilder<Rx<ResearchModel>>(
        //   future: dataFuture,
        //   builder: (context, snapshots) {
        //     if (snapshots.hasError) {
        //       return Text('Something is Wrong ${snapshots.error}');
        //     }
        //     if (snapshots.hasData) {
        //       var data = snapshots.data;
        //       return SingleChildScrollView(
        //         child: Center(
        //           child: Container(
        //             width: MediaQuery.of(context).size.width * 0.65,
        //             margin: EdgeInsets.only(top: 20),
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: const BorderRadius.only(
        //                   topLeft: Radius.circular(10),
        //                   topRight: Radius.circular(10),
        //                   bottomLeft: Radius.circular(10),
        //                   bottomRight: Radius.circular(10)),
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey.withOpacity(0.5),
        //                   spreadRadius: 5,
        //                   blurRadius: 7,
        //                   offset:
        //                   const Offset(0, 3), // changes position of shadow
        //                 ),
        //               ],
        //             ),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 //Main Research Section
        //                 Container(
        //                   margin: EdgeInsets.all(8),
        //                   height: 60,
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Container(
        //                         child: Row(
        //                           children: [
        //                             Container(
        //                               margin:
        //                               EdgeInsets.only(left: 10, right: 10),
        //                               child: Badge(
        //                                 badgeContent: const Text(
        //                                   '',
        //                                 ),
        //                                 position: BadgePosition.bottomEnd(),
        //                                 child: CircleAvatar(
        //                                   backgroundImage:
        //                                   AssetImage('/img/klon.jpg'),
        //                                 ),
        //                               ),
        //                             ),
        //                             Container(
        //                               padding: const EdgeInsets.only(left: 10),
        //                               child: Column(
        //                                 mainAxisAlignment:
        //                                 MainAxisAlignment.spaceAround,
        //                                 crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                                 children: [
        //                                   Container(
        //                                     child: const Text(
        //                                       'Cavidan Bagirli',
        //                                       style: TextStyle(
        //                                           fontWeight: FontWeight.bold),
        //                                     ),
        //                                   ),
        //                                   Container(
        //                                     child: const Text(
        //                                       'Flutter Developer',
        //                                       style: TextStyle(
        //                                           color: Colors.blueGrey),
        //                                     ),
        //                                   ),
        //                                   Container(
        //                                     child: Text(
        //                                       '${getDateTime(data!.value.time!.toDate())}',
        //                                       style: TextStyle(
        //                                           fontSize: 12,
        //                                           color: Colors.blueGrey),
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                       Container(
        //                         child: Row(
        //                           children: [
        //                             Container(
        //                               child: InkWell(
        //                                 onTap: () {
        //                                   controller.vouteAppRaiting(
        //                                       data.value.id, data.value.email!);
        //                                   setState(() {
        //                                     dataFuture =
        //                                         controller.getArticleWithId(
        //                                             Get.arguments.toString());
        //                                   });
        //                                 },
        //                                 child: FaIcon(FontAwesomeIcons.arrowUp),
        //                               ),
        //                               margin:
        //                               EdgeInsets.only(left: 5, right: 5),
        //                             ),
        //                             Container(child: Obx(() {
        //                               return Text(
        //                                   '${data.value.raiting?.length ?? '0'}');
        //                             })),
        //                             Container(
        //                                 child: InkWell(
        //                                   onTap: () {
        //                                     controller.vouteDownRaiting(
        //                                         data.value.id,
        //                                         data.value.email!);
        //                                     setState(() {
        //                                       dataFuture =
        //                                           controller.getArticleWithId(
        //                                               Get.arguments.toString());
        //                                     });
        //                                   },
        //                                   child: FaIcon(
        //                                       FontAwesomeIcons.arrowDown),
        //                                 ),
        //                                 margin:
        //                                 EdgeInsets.only(left: 5, right: 5)),
        //                           ],
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 //Title Section
        //                 Container(
        //                   margin: EdgeInsets.only(left: 10),
        //                   //padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
        //                   child: Row(
        //                     children: [
        //                       Text(
        //                         '${data.value.title}',
        //                         textAlign: TextAlign.start,
        //                         style: TextStyle(
        //                           fontWeight: FontWeight.bold,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 //Subject Section
        //                 Container(
        //                   margin: EdgeInsets.all(10),
        //                   padding: EdgeInsets.all(10),
        //                   child: Text('${data.value.subject}'),
        //                 ),
        //                 //For Getting Comment
        //                 Quill.QuillToolbar.basic(
        //                     controller: controller.text_controller),
        //                 Container(
        //                   child: Row(
        //                     crossAxisAlignment: CrossAxisAlignment.end,
        //                     children: [
        //                       Expanded(
        //                         child: Container(
        //                           margin: EdgeInsets.only(left: 10, right: 5),
        //                           padding: EdgeInsets.all(8),
        //                           decoration: BoxDecoration(
        //                             color: Colors.white,
        //                             borderRadius: const BorderRadius.only(
        //                                 topLeft: Radius.circular(10),
        //                                 topRight: Radius.circular(10),
        //                                 bottomLeft: Radius.circular(10),
        //                                 bottomRight: Radius.circular(10)),
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 color: Colors.grey.withOpacity(0.5),
        //                                 spreadRadius: 5,
        //                                 blurRadius: 7,
        //                                 offset: const Offset(
        //                                     0, 3), // changes position of shadow
        //                               ),
        //                             ],
        //                           ),
        //                           height: 300,
        //                           child: Quill.QuillEditor.basic(
        //                             controller: controller.text_controller,
        //                             readOnly: false, // true for view only mode
        //                           ),
        //                         ),
        //                       ),
        //                       Container(
        //                           child: ElevatedButton(
        //                               onPressed: () {
        //                                 controller.addComment(
        //                                     data.value.id.toString(),
        //                                     data.value.email.toString(),
        //                                     controller.text_controller
        //                                         .plainTextEditingValue.text);
        //                                 setState(() {
        //                                   dataFuture =
        //                                       controller.getArticleWithId(
        //                                           Get.arguments.toString());
        //
        //                                 });
        //                               },
        //                               child: Text('Comment'))),
        //                     ],
        //                   ),
        //                 ),
        //                 //Comment Section
        //
        //                 Container(
        //                   child: ListView.builder(
        //                     itemCount: data.value.comments?.length,
        //                     shrinkWrap: true,
        //                     itemBuilder: (context, index) {
        //                       return Container(
        //                         margin: const EdgeInsets.only(top: 5),
        //                         padding: EdgeInsets.all(10),
        //                         child: Row(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             //IMage Section
        //                             Container(
        //                               child: CircleAvatar(
        //                                 backgroundImage:
        //                                 AssetImage('img/klon.jpg'),
        //                               ),
        //                             ),
        //                             //Name and Comment section
        //                             Expanded(
        //                               child: Container(
        //                                 margin: const EdgeInsets.only(left: 5),
        //                                 child: Column(
        //                                   crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                                   mainAxisAlignment:
        //                                   MainAxisAlignment.start,
        //                                   children: [
        //                                     Row(
        //                                       mainAxisAlignment:
        //                                       MainAxisAlignment
        //                                           .spaceBetween,
        //                                       children: [
        //                                         Text(
        //                                           'Cemil Gunaydin',
        //                                           style: TextStyle(
        //                                               fontWeight:
        //                                               FontWeight.bold),
        //                                         ),
        //                                         Text(
        //                                           '07.05.2022/11:53',
        //                                           style: TextStyle(
        //                                               fontSize: 12,
        //                                               color: Colors.blueGrey),
        //                                         )
        //                                       ],
        //                                     ),
        //                                     Text(
        //                                       'Software Enginneer',
        //                                       style: TextStyle(
        //                                           fontSize: 12,
        //                                           color: Colors.blueGrey),
        //                                     ),
        //                                     Container(
        //                                         color: Colors.black12,
        //                                         child: Text('${data.value.comments?[index].values.join(')')}')
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 )
        //               ],
        //             ),
        //             //color: Colors.black,
        //           ),
        //         ),
        //       );
        //     } else {
        //       return const CircularProgressIndicator();
        //     }
        //   },
        // ));
        //with stream builder but another formar
        body: StreamBuilder(
          stream: controller.research_referance
              .doc(Get.arguments.toString())
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something is Wrong ${snapshot.error}');
            }
            if (snapshot.hasData) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Badge(
                                        badgeContent: const Text(
                                          '',
                                        ),
                                        position: BadgePosition.bottomEnd(),
                                        child: CircleAvatar(
                                          backgroundImage:
                                              AssetImage('/img/klon.jpg'),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: const Text(
                                              'Cavidan Bagirli',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            child: const Text(
                                              'Flutter Developer',
                                              style: TextStyle(
                                                  color: Colors.blueGrey),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              '${getDateTime(data['time'].toDate())}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey),
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
                                              snapshot.data!.id, data['email']);
                                        },
                                        child: FaIcon(FontAwesomeIcons.arrowUp),
                                      ),
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                    ),
                                    Container(
                                        child: Text(
                                            '${data['raiting']?.length ?? '0'}')),
                                    Container(
                                        child: InkWell(
                                          onTap: () {
                                            controller.vouteDownRaiting(
                                                snapshot.data?.id,
                                                data['email']);
                                          },
                                          child: FaIcon(
                                              FontAwesomeIcons.arrowDown),
                                        ),
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5)),
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
                                '${data['title']}',
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
                          child: Text('${data['subject']}'),
                        ),
//For Getting Comment
                        Quill.QuillToolbar.basic(
                            controller: controller.text_controller),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 5),
                                  padding: EdgeInsets.all(8),
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
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  height: 300,
                                  child: Quill.QuillEditor.basic(
                                    controller: controller.text_controller,
                                    readOnly: false, // true for view only mode
                                  ),
                                ),
                              ),
                              Container(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        try {
                                          // print(
                                          //     'id is ${snapshot.data?['id']}');
                                          controller.addComment(
                                              snapshot.data!.id,
                                              data['email'].toString(),
                                              controller.text_controller
                                                  .plainTextEditingValue.text);
                                        } catch (e) {
                                          print(
                                              'Error inside of the button ${e.toString()}');
                                        }
                                      },
                                      child: Text('Comment'))),
                            ],
                          ),
                        ),
//Comment Section

                        Container(
                          child: ListView.builder(
                            itemCount: data['comments']?.length,
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
                                        backgroundImage:
                                            AssetImage('img/klon.jpg'),
                                      ),
                                    ),
//Name and Comment section
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Cemil Gunaydin',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '07.05.2022/11:53',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.blueGrey),
                                                )
                                              ],
                                            ),
                                            Text(
                                              'Software Enginneer',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey),
                                            ),
                                            Container(
                                                color: Colors.black12,
                                                child: Text(
                                                    '${data['comments']?[index].values.join(')')}')),
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
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}

//***************************************************With Stream Builder ******************************

// body: StreamBuilder(
//   stream: controller.getArticleWithIds(Get.arguments.toString()),
//   // stream: controller.research_referance
//   //     .doc(Get.arguments.toString())
//   //     .get()
//   //     .asStream(),
//   // stream: controller.getArticleWithIds(Get.arguments.toString()),
//   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//     if (snapshot.hasData) {
//       // ResearchModel? data = snapshot.data as ResearchModel;
//        var data = snapshot.data?.data() as Map<String, dynamic>;
//       // data.get()
//       return Text('${data['subject']} ${snapshot.data?.id}');
//       // return Text('some');
//     }
//     if (snapshot.hasError) {
//       return Text('Error happen in has error');
//     } else {
//       return Text('Something wrong');
//     }
//   },
// ));
