import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_notes_app/model/notes.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;

  const NoteCard({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    //
    final color = _lightColors[index % _lightColors.length];

    final time = DateFormat.yMMMd().format(note.createdTime);

    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 5),
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
