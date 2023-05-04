import 'package:dine/models/recipe_model.dart';
import 'package:dine/utils/Auth.dart';
import 'package:flutter/material.dart';

final Auth _auth = Auth();

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: const Text(
          'Search',
          style: TextStyle(
              color: Color(0xFF951212),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF3F9FB),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SizedBox(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                labelText: 'What would you like to eat?',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.account_circle,
              color: Color(0xFF951212),
            ),
            iconSize: 30,
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Edit account'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Log out',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
            onSelected: (value) async {
              if (value == 0) {
                Navigator.of(context).pushNamed('/account');
              } else if (value == 1) {
                await _auth.signOut().then((value) {
                  Navigator.of(context).popAndPushNamed('/welcome');
                }).catchError((e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.message),
                  ));
                });
                print("Logout");
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: RecipeModel.dummyData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              RecipeModel _model = RecipeModel.dummyData[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/details', arguments: _model);
                },
                child: Card(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(_model.imageUrl),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              _model.name,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
