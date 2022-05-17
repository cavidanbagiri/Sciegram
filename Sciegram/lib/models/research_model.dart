

import 'package:cloud_firestore/cloud_firestore.dart';

class ResearchModel {

  String ? id;
  String ? email;
  String ? community;
  String ? title;
  String ? subject;
  List ? raiting;
  List ? comments;
  Timestamp ? time;

  ResearchModel(this.id, this.email, this.community, this.title, this.subject, this.raiting, this.comments, this.time);

  ResearchModel.readData(DocumentSnapshot snapshot){
    this.id = snapshot.id;
    this.email = snapshot['email'];
    this.community = snapshot['community'];
    this.title = snapshot['title'];
    this.subject = snapshot['subject'];
    this.raiting = snapshot['raiting'];
    this.comments = snapshot['comments'];
    this.time = snapshot['time'];
  }

  ResearchModel.readDataOne(var snapshot){
    this.id = snapshot.id;
    this.email = snapshot['email'];
    this.community = snapshot['community'];
    this.title = snapshot['title'];
    this.subject = snapshot['subject'];
    this.raiting = snapshot['raiting'];
    this.comments = snapshot['comments'];
    this.time = snapshot['time'];
  }

}
