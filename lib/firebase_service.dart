import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  saveValueToFirestore() {
    firebaseFirestore.collection('collection').doc('document').set({
      'isim': 'alperen',
    }, SetOptions(merge: true));
  }

  getValuesFromFirestore() {
    return firebaseFirestore
        .collection('collection')
        .doc('document')
        .snapshots();
  }

  updateValueFromFirestore(String key, String value) {
    firebaseFirestore
        .collection('collection')
        .doc('document')
        .update(({key: value}));
  }

  removeValueFromFirestore(String key) {
    firebaseFirestore
        .collection('collection')
        .doc('document')
        .update({key: FieldValue.delete()}).whenComplete(() {
      print('Field Deleted');
    });
  }
}
