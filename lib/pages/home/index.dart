import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Kausala extends StatelessWidget {
  CollectionReference get countries => Firestore.instance.collection('country');

  Future<Null> _addCountry() async {
    final DocumentReference document = countries.document();
    document.setData(<String, dynamic>{
      'cities': 'Hello Jöhn!',
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Firestore Example'),
      ),
      body: new CountryList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addCountry,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

@override
class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('country').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int messageCount = snapshot.data.documents.length;
        return new ListView.builder(
          itemCount: messageCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            return new ListTile(
              title: new Text(document['cities'] ?? '<No message retrieved>'),
              subtitle: new Text('Message ${index + 1} of $messageCount'),
            );
          },
        );
      },
    );
  }
}
