import 'package:cis_office/loginscreens/authentication_service.dart';
import 'package:cis_office/loginscreens/user_login.dart';
import 'package:cis_office/user/profile.dart';
import 'package:cis_office/widget/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cis_office/ticket/scanner/ticket_scanner.dart';
import 'package:cis_office/ticket/generator/generate_ticket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/src/provider.dart';
import '../helper.dart';

class home_user extends StatefulWidget {
  @override
  State<home_user> createState() => _home_userState();
}

class _home_userState extends State<home_user> {
  Stream<QuerySnapshot> upcoming_events =
      FirebaseFirestore.instance.collection('events').snapshots();
  final email = FirebaseAuth.instance.currentUser!.email;

  void getEvents() async {
    upcoming_events =
        await FirebaseFirestore.instance.collection('events').snapshots();
  }

  @override
  void initState() {
    getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              final result =
                  await context.read<AuthenticationService>().signOut();
              if (result == "Signed out") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext) => login_user(),
                  ),
                  (Route<dynamic> route) => false,
                );
              } else {
                showSnackbar(context, result!);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: false,
            child: ElevatedButton(
              onPressed: () async {
                //some action
              },
              child: Text("Add Event"),
            ),
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: upcoming_events,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
        ],
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
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => user_profile()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
