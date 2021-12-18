import 'package:flutter/material.dart';
import 'package:cis_office/ticket/scanner/ticket_scanner.dart';
import 'package:cis_office/ticket/generator/generate_ticket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home_user extends StatelessWidget {
  final Stream<QuerySnapshot> events =
      FirebaseFirestore.instance.collection('events').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
          child: /*StreamBuilder<QuerySnapshot>(stream: events
      .where())*/
              Column(children: [
        Text(
          "\n Upcoming Events",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.announcement_rounded, color: Colors.pink),
                title: const Text('AI Summit 2022'),
                subtitle: Text(
                  '10th & 11th Jan 2022',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    textColor: const Color(0xFF6200EE),
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.announcement_rounded, color: Colors.pink),
                title: const Text('AI Summit 2022'),
                subtitle: Text(
                  '10th & 11th Jan 2022',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    textColor: const Color(0xFF6200EE),
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ])),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('IEEE CIS GHRCE'),
        ),
        ListTile(
            title: const Text('Book Ticket'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookTicket()),
              );
            }),
        ListTile(
            title: const Text('Ticket Scanner'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicketScan()),
              );
            }),
      ])),
    );
  }
}
