// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:kalbas_mechine_test/utils/resources/constands.dart';

class MySlidableCard extends StatelessWidget {
  const MySlidableCard({
    super.key,
    required this.child,
    required this.index,
    this.onPressed,
  });
  final Widget child;
  final int index;
  final Function(BuildContext)? onPressed;
  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              key: ValueKey(index),
              flex: 1,
              onPressed: onPressed,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Constants.lightred,
              foregroundColor: Constants.red,
              icon: Icons.favorite,
              label: 'Add to Favourites',
            ),
          ],
        ),
        child: child);
  }
}
