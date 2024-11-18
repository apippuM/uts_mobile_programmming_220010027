import 'package:flutter/material.dart';
import 'package:uts_mobile_programmming/models/hewan.dart';
import 'package:uts_mobile_programmming/resources/dimension.dart';
import 'package:uts_mobile_programmming/widgets/card_title.dart';

class CardItem extends StatelessWidget {
  const CardItem({
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
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: largeSize,
          vertical: largeSize,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(extraLargeSize),
          image: DecorationImage(
            // image: AssetImage('assets/images/moments_background_dark.png'),
            image: NetworkImage(hewan.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CardTitle(
              hewan: hewan, onDelete: onDelete, onUpdate: onUpdate
            ),
          ],
        )
      )
    );
  }
}