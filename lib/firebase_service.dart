import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  saveValueToFirestore(String value) {
    var myData = {
      'isim': value,
    };

    firebaseFirestore
        .collection('collection')
        .add(myData)
        .then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));
  }

  getValuesFromFirestore() {
    return firebaseFirestore.collection('collection').snapshots();
  }

  updateValueFromFirestore(String key, String value) {
    firebaseFirestore
        .collection('collection')
        .doc('document')
        .update(({key: value}));
  }

  removeValueFromFirestore(String key) {
    firebaseFirestore.collection('collection').doc(key).delete();

    // firebaseFirestore
    //     .collection('collection')
    //     .doc('document')
    //     .update({key: FieldValue.delete()}).whenComplete(() {
    //   print('Field Deleted');
    // });
  }
}
