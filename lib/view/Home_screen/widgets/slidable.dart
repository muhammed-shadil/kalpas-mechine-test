import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kalbas_mechine_test/view/Home_screen/widgets/maintile.dart';

class MySlidableCard extends StatelessWidget {
  MySlidableCard({
    super.key,
    required this.index,
    required this.child,
  });
  final Widget child;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              key: ValueKey(index),
              flex: 1,
              onPressed: (_) {},
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.red,
              icon: Icons.favorite,
              label: 'Add to Favourites',
            ),
          ],
        ),
        child: child);
  }
}
