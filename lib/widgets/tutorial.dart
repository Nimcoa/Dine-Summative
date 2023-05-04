import 'package:flutter/material.dart';

class Turorial extends StatelessWidget {
  final List<String> data;
  const Turorial({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.asMap().entries.map((entry) {
            return Text('${entry.key}. ${entry.value}');
          }).toList(),
        ),
      ),
    );
  }
}
