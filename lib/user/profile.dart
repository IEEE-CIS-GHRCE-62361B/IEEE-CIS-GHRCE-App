import 'package:cis_office/ticket/generator/generate_ticket.dart';
import 'package:cis_office/ticket/scanner/ticket_scanner.dart';
import 'package:flutter/material.dart';

class user_profile extends StatelessWidget {
  const user_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Text("Profile"),
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
