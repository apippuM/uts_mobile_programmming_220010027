import 'package:flutter/material.dart';
import 'package:uts_mobile_programmming/models/hewan.dart';
import 'package:uts_mobile_programmming/resources/dimension.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({
    super.key,
    required this.hewan,
    required this.onDelete,
    required this.onUpdate
    });

  final Hewan hewan;
  final Function(String speciesName) onDelete;
  final Function(String speciesName) onUpdate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: extraLargeSize, right: extraLargeSize, bottom: mediumSize),
      title: Text(
        hewan.indonesianName,
        style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white70, shadows: [Shadow(color: Colors.black, offset: Offset(1, 1))]),
      ),
      subtitle: Text(
        hewan.description,
        style: const TextStyle(color: Colors.white70, shadows: [Shadow(color: Color.fromARGB(108, 0, 0, 0), offset: Offset(1, 1),)]),
      ),
      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == 'Edit') {
            onUpdate(hewan.speciesName);
          } else if (value == 'Delete') {
            onDelete(hewan.speciesName);
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'Edit',
            child: Text('Edit')
          ),
          const PopupMenuItem(
            value: 'Delete',
            child: Text('Delete')
          )
        ],
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.5),
          child: const Icon(
            Icons.more_vert,
            color: Colors.white54)),
      ),
      tileColor: Colors.white70,
    );
  }
}
