
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sciegram/models/research_model.dart';

class CommonResearchController extends GetxController{

  //Creating Important Instance about Firebase;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Create Collection Referance
  final research_referance = FirebaseFirestore.instance.collection('researches_model');

  //Read Data From Firebase
  Stream<List<ResearchModel>>? getResearchs(){
    try{
      return research_referance.snapshots().map((snapshot){
        return snapshot.docs.map((doc){
          return ResearchModel.readData(doc);
        } ).toList();
      });
    }catch(e){
      print('Error happen inside Read Data ${e.toString()}');
      return null;
    }
  }

}
