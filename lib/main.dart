import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/firebase_config.dart';
import 'package:flutter_firebase/firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.platformOptions, name: "qnbfinansbank");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FirebaseFirestoreService firestoreService = FirebaseFirestoreService();

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("collection").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    Spacer(),
                    TextField(
                      controller: textEditingController,
                    ),
                    ElevatedButton(
                        onPressed: () => firestoreService
                            .saveValueToFirestore(textEditingController.text),
                        child: const Text('veriyi kaydet')),
                    ElevatedButton(
                        onPressed: () =>
                            firestoreService.updateValueFromFirestore(
                                'deneme', 'update edildi'),
                        child: const Text('güncelle button')),
                    ElevatedButton(
                        onPressed: () => firestoreService
                            .removeValueFromFirestore('document2'),
                        child: const Text('sil button')),
                    Container(
                      height: 250,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot values = snapshot.data!.docs[index];

                          return Column(
                            children: [
                              Text(values.get('isim')),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
