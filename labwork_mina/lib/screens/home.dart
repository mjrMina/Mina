import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var itemholder = TextEditingController();
  List<String> itemshop = [];

  void add() async {
    await FirebaseFirestore.instance
        .collection("minaMJR")
        .add({"items": itemholder.text});
    itemholder.clear();
  }

  void get() async {
    Stream collectionStream =
        FirebaseFirestore.instance.collection('items').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab Work"),
      ),
      body: Container(
        child: SafeArea(
            child: Column(
          children: [
            Card(
              elevation: 10,
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: itemholder,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: add, child: Text("Add Item"))
                  ],
                ),
              ]),
            ),
            Expanded(child: StreamBuilder<QuerySnapshot>())
          ],
        )),
      ),
    );
  }
}
