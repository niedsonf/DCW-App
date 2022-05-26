import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const PHOTO = 'photo';

  late String _id;
  late String _name;
  late String _photo;

  String get id => _id;
  String get name => _name;
  String get photo => _photo;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.get(NAME);
    _id = snapshot.get(ID);
    _photo = snapshot.get(PHOTO);
  }
}
