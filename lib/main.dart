import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:placeverse/auth/auth_view.dart';
import 'firebase_options.dart';
import 'auth/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
// ...

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
var db = FirebaseFirestore.instance;

class AddData extends StatefulWidget {
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  var i = 1;
  final TextEditingController t1 = TextEditingController();
  String key = 't';
  String? val;

  @override
  void dispose() {
    // TODO: implement dispose
    t1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("geeksforgeeks"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'document name',
            ),
            onChanged: (text) {
              setState(() {
                key = text;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Country',
            ),
            onChanged: (text) {
              setState(() {
                val = text;
              });
              print(key);
              print(val);
            },
          ),
          Center(
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
              onPressed: () {
                print(key);
                // FirebaseFirestore.instance
                //     .collection('mydata')
                //     .add({'name': 'data added through app 3'});
                // FirebaseFirestore.instance.collection('newCollection').add({'new': 'yash1'});
                // FirebaseFirestore.instance.collection('Coll').add({'Coll': 'Yash2'});
                FirebaseFirestore.instance.collection('Coll').add({key: val});
                // FirebaseFirestore.instance.collection('coll').doc()

                // FirebaseFirestore.instance.collection('data').;
                final cities = db.collection("cities");
                final data1 = <String, dynamic>{
                  "name": val,
                  "state": "CA",
                  "country": "USA",
                  "capital": false,
                  "population": 860000,
                  "regions": ["west_coast", "norcal"]
                };
                // FirebaseFirestore.instance.collection('cities').doc(key).set(data1);
                cities.doc(key).set(data1);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReadData extends StatefulWidget {
  @override
  State<ReadData> createState() => _ReadDataState();
}


class _ReadDataState extends State<ReadData> {
  var docRef = db.collection("cities").doc("SF");
  var data = {};
  var s='null';
  var d='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("geeksforgeeks"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // snapshot.data!.docs.map((document) {
          //     // return Container(
          //     //   child: Center(child: Text(document['Coll'])),
          //     // );
          //     print("atadsddsa: "+document['Coll']);
          //   });
          // print(snapshot.data!.docs.map(document));
          docRef.get().then(
            (DocumentSnapshot doc) {
                print(doc.data());
                setState(() {
                data = doc.data() as Map<String, dynamic>;
              });
              // print(data);
              // ...
            },
            onError: (e) => print("Error getting document: $e"),
          );
          // return ListView(
          //   children: snapshot.data!.docs.map((document) {
          //     return Container(
          //       child: Center(child: Text(document['text'])),
          //     );
          //   }).toList(),
          // );
          // return Text(
          //   data["name"],
          // );
          return Column(

            children: [
             TextField(
            decoration: const InputDecoration(
              hintText: 'Country',
            ),
            onChanged: (text) {
              setState(() {
                s = text;
              });
            },
          ),
              ElevatedButton(onPressed: (){
                setState(() {
                  d=(data[s]).toString();
                });
                print(d);
              }, child: Text('Show')),
              Text(d),
            ],
          );
        },
      ),
    );
  }
}

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ReadData()));
              },
              child: Text("Read")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AddData()));
              },
              child: Text("Write"))
        ],
      ),
    );
  }
}
