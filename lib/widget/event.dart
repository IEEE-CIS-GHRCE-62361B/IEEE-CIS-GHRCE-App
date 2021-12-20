import 'package:flutter/material.dart';

class event_widget extends StatelessWidget {
  event_widget({Key? key, this.eventdata}) : super(key: key);
  final dynamic eventdata;

  @override
  Widget build(BuildContext context) {
    final name = eventdata['name'];
    final desc = eventdata['desc'];
    final logo = eventdata['logo'];
    final completeDate = DateTime.fromMillisecondsSinceEpoch(eventdata['date']);
    final regularDate = "${completeDate.day}" +
        "-" +
        "${completeDate.month}" +
        "-" +
        "${completeDate.year}";
    final regularTime = "${completeDate.hour}" + ":" + "${completeDate.minute}";
    return Card(
        child: Column(
      children: [
        ListTile(
          leading: Image.network(logo),
          title: Text(name),
          subtitle: Text(desc),
        ),
        ButtonBar(alignment: MainAxisAlignment.start, children: [
          TextButton(
            onPressed: () {
              // Perform some action
            },
            child: const Text('Register'),
          ),
        ]),
      ],
    ));
  }
}
