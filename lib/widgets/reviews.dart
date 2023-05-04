import 'package:dine/models/review_model.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  final List<ReviewModel> data;
  const Reviews({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data
              .map((entry) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.userName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(entry.comment),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
