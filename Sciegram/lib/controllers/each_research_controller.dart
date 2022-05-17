import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciegram/models/research_model.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;

class EachResearchController extends GetxController {
  //For working Research Model inside of controller
  late var research_model_object;
  //late Rx<ResearchModel> research_model_object;

  //Create Collection Referance
  final research_referance =
      FirebaseFirestore.instance.collection('researches_model');

  //For TextEditor Package controller
  Quill.QuillController text_controller = Quill.QuillController.basic();

  //Raiting Up
  Future<void> vouteAppRaiting(String? id, String email) async {
    try {
      final current_research = await research_referance.doc(id);
      await current_research.update({
        'raiting': FieldValue.arrayUnion([email])
      });
      print('tes');
    } catch (e) {
      print('upp error ${e}');
    }
  }

  //Raiting Up
  Future<void> vouteDownRaiting(String? id, String email) async {
    try {
      final current_research = await research_referance.doc(id);
      await current_research.update({
        'raiting': FieldValue.arrayRemove([email])
      });
      print('yes');
    } catch (e) {
      print('upp error ${e}');
    }
  }

  Future<void> addComment(String id, String email, String comment) async {
    try {
      print('bura girdi');
      print('current research id is ${id.toString()} and email is ${email} also ${comment}');
      final current_research = await research_referance.doc(id);
      print('research is : ${current_research.id}');
      await current_research.update({
        'comments': FieldValue.arrayUnion([
          {email: comment}
        ]),
      });
      print('can add comment section');
    } catch (e) {
      print('Error happen in here ${e.toString()}');
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getArticleWithIds(String id) {
    var current_article = research_referance.doc(id).get().asStream() ;
    // final sn = ResearchModel.readDataOne(current_article as Map<String, dynamic>);
    //final sn = current_article as Map<String, dynamic>;
    final some = current_article as ResearchModel;
    //print(some.id);
    //print(some.title);
    return current_article;
  }

  //Read with article id
  Future<Rx<ResearchModel>> getArticleWithId(String id) async {
    final current_article = await research_referance.doc(id);
    final snapshot = await current_article.get();
    research_model_object = await ResearchModel.readData(snapshot).obs;
    return research_model_object;
  }
}
