import 'package:dine/models/review_model.dart';

class RecipeModel {
  final String imageUrl;
  final String name;
  final String time;
  final String description;
  final List<String> ingredients;
  final List<String> tutorial;
  final List<ReviewModel> reviews;

  RecipeModel(
      {required this.imageUrl,
      required this.name,
      required this.time,
      required this.description,
      required this.ingredients,
      required this.tutorial,
      required this.reviews});

  static final List<RecipeModel> dummyData = [
    RecipeModel(
        imageUrl: 'images/sample_food.png',
        name: 'Traditional Fufu',
        time: '2hrs',
        description: 'Delicious, spicy and healthy',
        ingredients: [
          'Ingredient 1',
          'Ingredient 2',
          'Ingredient 3',
          'Ingredient 4'
        ],
        tutorial: [
          'Lorem ipsum dolor sit amet',
          'consectetur adipiscing elit',
          'eiusmod tempor incididunt ut labore det dolore magna aliqua.',
          'Ut enim ad minim veniam, quis nostreud exercitation ullamco laboris nisi utaliquip ex ea commodo consequat.',
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        ],
        reviews: ReviewModel.dummyData),
        RecipeModel(
        imageUrl: 'images/sample_food.png',
        name: 'Traditional Fufu',
        time: '2hrs',
        description: 'Delicious, spicy and healthy',
        ingredients: [
          'Ingredient 1',
          'Ingredient 2',
          'Ingredient 3',
          'Ingredient 4'
        ],
        tutorial: [
          'Lorem ipsum dolor sit amet',
          'consectetur adipiscing elit',
          'eiusmod tempor incididunt ut labore det dolore magna aliqua.',
          'Ut enim ad minim veniam, quis nostreud exercitation ullamco laboris nisi utaliquip ex ea commodo consequat.',
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        ],
        reviews: ReviewModel.dummyData),
        RecipeModel(
        imageUrl: 'images/sample_food.png',
        name: 'Traditional Fufu',
        time: '2hrs',
        description: 'Delicious, spicy and healthy',
        ingredients: [
          'Ingredient 1',
          'Ingredient 2',
          'Ingredient 3',
          'Ingredient 4'
        ],
        tutorial: [
          'Lorem ipsum dolor sit amet',
          'consectetur adipiscing elit',
          'eiusmod tempor incididunt ut labore det dolore magna aliqua.',
          'Ut enim ad minim veniam, quis nostreud exercitation ullamco laboris nisi utaliquip ex ea commodo consequat.',
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        ],
        reviews: ReviewModel.dummyData),
        RecipeModel(
        imageUrl: 'images/sample_food.png',
        name: 'Traditional Fufu',
        time: '2hrs',
        description: 'Delicious, spicy and healthy',
        ingredients: [
          'Ingredient 1',
          'Ingredient 2',
          'Ingredient 3',
          'Ingredient 4'
        ],
        tutorial: [
          'Lorem ipsum dolor sit amet',
          'consectetur adipiscing elit',
          'eiusmod tempor incididunt ut labore det dolore magna aliqua.',
          'Ut enim ad minim veniam, quis nostreud exercitation ullamco laboris nisi utaliquip ex ea commodo consequat.',
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        ],
        reviews: ReviewModel.dummyData),
        RecipeModel(
        imageUrl: 'images/sample_food.png',
        name: 'Traditional Fufu',
        time: '2hrs',
        description: 'Delicious, spicy and healthy',
        ingredients: [
          'Ingredient 1',
          'Ingredient 2',
          'Ingredient 3',
          'Ingredient 4'
        ],
        tutorial: [
          'Lorem ipsum dolor sit amet',
          'consectetur adipiscing elit',
          'eiusmod tempor incididunt ut labore det dolore magna aliqua.',
          'Ut enim ad minim veniam, quis nostreud exercitation ullamco laboris nisi utaliquip ex ea commodo consequat.',
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        ],
        reviews: ReviewModel.dummyData),
  ];
}
