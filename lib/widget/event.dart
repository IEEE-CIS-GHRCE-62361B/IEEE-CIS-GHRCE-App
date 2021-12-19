import 'package:flutter/material.dart';

class event_widget extends StatelessWidget {
  event_widget({Key? key, this.eventdata}) : super(key: key);
  final dynamic eventdata;

  @override
  Widget build(BuildContext context) {
    final name = eventdata['name'];
    final desc = eventdata['desc'];
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
          leading: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"),
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
