import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final Color? color;
  final String? label;
  final Function()? onTap;
  final Color? textColor;
  const ListTileWidget({
    Key? key,
    this.color,
    this.label,
    this.onTap,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          width: 318,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '20/11/2005',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'Tarefa 1',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
