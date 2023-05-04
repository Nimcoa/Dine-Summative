import 'dart:async';
import 'package:dine/models/recipe_model.dart';
import 'package:dine/widgets/ingredients.dart';
import 'package:dine/widgets/reviews.dart';
import 'package:dine/widgets/tutorial.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final RecipeModel data;
  const DetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 20,
        elevation: 0.0,
        toolbarHeight: 200,
        flexibleSpace: Image(
          image: AssetImage(data.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 20,
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name),
                      Text(
                        data.description,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Text(
                    data.time,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Ingredients',
                ),
                Tab(
                  text: 'Tutorial',
                ),
                Tab(
                  text: 'Review',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Ingredients(data: data.ingredients),
              Turorial(data: data.tutorial),
              Reviews(data: data.reviews),
            ],
          ),
        ),
      ),
    );
  }
}
