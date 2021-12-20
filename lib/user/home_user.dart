import 'package:cis_office/widget/event.dart';
import 'package:flutter/material.dart';
import 'package:cis_office/ticket/scanner/ticket_scanner.dart';
import 'package:cis_office/ticket/generator/generate_ticket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home_user extends StatelessWidget {
  final Stream<QuerySnapshot> upcoming_events =
      FirebaseFirestore.instance.collection('events').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: upcoming_events,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var eventdata = snapshot.data!.docs[index].data();
                      return event_widget(eventdata: eventdata);
                    },
                    itemCount: snapshot.data!.docs.length,
                  )
                : SizedBox.square();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
              },
            ),
            ListTile(
              title: const Text('Ticket Scanner'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketScan()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
