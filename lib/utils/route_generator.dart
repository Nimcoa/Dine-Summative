import 'package:dine/models/recipe_model.dart';
import 'package:dine/screens/account_screen.dart';
import 'package:dine/screens/details_screen.dart';
import 'package:dine/screens/home_screen.dart';
import 'package:dine/screens/login_screen.dart';
import 'package:dine/screens/register_screen.dart';
import 'package:dine/screens/search_screen.dart';
import 'package:dine/screens/splash_screen.dart';
import 'package:dine/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = RecipeModel.dummyData[0];

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case '/account':
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      case '/details':
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(
                  data: args,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
