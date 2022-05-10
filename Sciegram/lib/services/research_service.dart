import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sciegram/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class ResearchService {
  //Create Login Controller for checking is login or not
  final login_controller = Get.put(LoginPageController());

  //Creating Important Instance about Firebase;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Create Collection Referance
  final research_referance =
      FirebaseFirestore.instance.collection('researches_model');

  //Create new Research Add in Firebase
  Future<void> createResearch(
      String community, String title, String subject) async {
    try {
      await research_referance.add({
        'community': community,
        'title': title,
        'subject': subject,
        'email': login_controller.googleAccount.value?.email,
        'raiting': [],
        'comments': [],
        'time': DateTime.now()
      });
      Get.snackbar('Research Added', 'Research Added',
          titleText: const Text('Research Succesfully Added'),
          messageText: const Text('Research Successfully added'),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Research cant Added', 'Research cant Added',
          titleText: const Text('Research cant Added'),
          messageText: const Text('Research cant added'),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}
