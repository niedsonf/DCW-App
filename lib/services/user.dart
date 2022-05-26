import 'package:getmage/controllers/menu_controller.dart';
import 'package:getmage/helpers/constants.dart';
import 'package:getmage/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  static String collection = 'users';
  static String liked = 'liked';

  void createUser({required String id, String? name, String? photo}) {
    var userPath = firebaseFirestore.collection(collection).doc(id);
    userPath.set({'name': name, 'id': id, 'photo': photo});
    userPath.collection(liked).doc(DogMenuItem.toLowerCase()).set({'urls': []});
    userPath.collection(liked).doc(CatMenuItem.toLowerCase()).set({'urls': []});
    userPath
        .collection(liked)
        .doc(WaifuMenuItem.toLowerCase())
        .set({'urls': []});
  }

  Future<UserModel> getUserById(String id) => firebaseFirestore
      .collection(collection)
      .doc(id)
      .get()
      .then((doc) => UserModel.fromSnapshot(doc));

  Future<bool> doesUserExist(String id) => firebaseFirestore
      .collection(collection)
      .doc(id)
      .get()
      .then((value) => value.exists);

  Future<List<UserModel>> getAll() =>
      firebaseFirestore.collection(collection).get().then((value) {
        List<UserModel> users = [];
        for (DocumentSnapshot user in value.docs) {
          users.add(UserModel.fromSnapshot(user));
        }
        return users;
      });

  static void addFavorite(
      {required String id, required String category, required String url}) {
    List urlList = [];
    var userPath = firebaseFirestore.collection(collection).doc(id)
      ..collection(liked).doc(category).get().then((data) {
        urlList = [...data.get('urls'), url];
        firebaseFirestore
            .collection(collection)
            .doc(id)
            .collection(liked)
            .doc(category)
            .set({'urls': urlList});
      });
  }

  static Future<List> getFavorites(
          {required String id, required String category}) =>
      firebaseFirestore
          .collection(collection)
          .doc(id)
          .collection(liked)
          .doc(category)
          .get()
          .then((snapshot) => snapshot.get('urls'));

  static Future<List> getAllFavorites({required String id}) async {
    var dogsFavorites =
        await getFavorites(id: id, category: DogMenuItem.toLowerCase());
    var catsFavorites =
        await getFavorites(id: id, category: CatMenuItem.toLowerCase());
    var waifusFavorites =
        await getFavorites(id: id, category: WaifuMenuItem.toLowerCase());
    return Future(() => [dogsFavorites, catsFavorites, waifusFavorites]);
  }
  /*var userPath = firebaseFirestore.collection(collection).doc(id);
    Future<List> favoriteList = userPath
        .collection(liked)
        .doc(category)
        .get()
        .then((snapshot) => snapshot.get('urls'));
    return favoriteList;*/

}
