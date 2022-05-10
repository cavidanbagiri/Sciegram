
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;
import 'package:sciegram/services/research_service.dart';

class PostResearchController extends GetxController{

  //Create PostResearchService for getting Database Operations
  final _research_service = ResearchService();
  //For Community Section
  List<String> items = ['Information Technology', 'Software Development', 'Contruction', 'Design'];
  //For Selected Community
  String? selectedItem = 'One';
  //For TextEditor Package controller
  Quill.QuillController text_controller = Quill.QuillController.basic();
  //For Research Title
  late final title_controller;

  //First Installing Functions
  @override
  void onInit() {
    title_controller = TextEditingController();
    super.onInit();
  }

  //Adding Research to Firebase
  Future <void> addResearch(String community, String title, String subject)async{
    await _research_service.createResearch(community, title, subject);
  }

}
