import 'package:flutter_quill/flutter_quill.dart' as Quill;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciegram/controllers/post_research_controller.dart';
import 'package:sciegram/widgets/desktop_body/appbar_widget.dart';

class PostResearch extends GetView<PostResearchController> {
  PostResearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: Drawer(),
      body: Center(
        child: Container(
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
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: const Text(
                      'Choose Community',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 36, color: Colors.blueGrey),
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      )),
                      items: controller.items
                          .map(
                            (item) => DropdownMenuItem(
                              child: Text('${item}'),
                              value: item,
                            ),
                          )
                          .toList(),
                      onChanged: (item) {
                        controller.selectedItem = item.toString();
                      },
                    ),
                  ),
                ],
              ),
              //Title Field
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: TextField(
                    controller: controller.title_controller,
                    decoration: const InputDecoration(
                      hintText: 'Write Title Here',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                ),
              ),
              Quill.QuillToolbar.basic(controller: controller.text_controller),
              //Rich text Sections
              Expanded(
                child: Container(
                  child: Quill.QuillEditor.basic(
                    controller: controller.text_controller,
                    readOnly: false, // true for view only mode
                  ),
                ),
              ),
              //Button Sections
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.addResearch(
                            controller.selectedItem.toString(),
                            controller.title_controller.text,
                            controller
                                .text_controller.plainTextEditingValue.text);
                      },
                      icon: Icon(Icons.add),
                      label: Text('Post'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
