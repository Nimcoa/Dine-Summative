import 'package:dine/models/recipe_model.dart';
import 'package:dine/utils/Auth.dart';
import 'package:flutter/material.dart';

final Auth _auth = Auth();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final snackBar = SnackBar(content: Text(
  //'Click on the search button to discover more',
  //style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  //),
  //backgroundColor: Colors.red,);
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         backgroundColor: Colors.red,
  //         title: Text(
  //           'Click on the search button to discover more',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Click on the search button to discover more',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    });

    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Ready to dine?',
          style: TextStyle(
              color: Color(0xFF951212),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF3F9FB),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.account_circle,
              color: Color(0xFF951212),
            ),
            iconSize: 30,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
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
                  if (_auth.currentUser == null) {
                    Navigator.of(context).popAndPushNamed('/welcome');
                  }
                });
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: 'What would you like to eat?',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/search');
                            },
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)))),
                      child: const Icon(Icons.filter_alt_outlined),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Delicious today'),
                  TextButton(onPressed: () {}, child: const Text('See all'))
                ],
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: RecipeModel.dummyData.length,
                    itemBuilder: (context, index) {
                      RecipeModel model = RecipeModel.dummyData[index];
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/details', arguments: model);
                            },
                            child: Card(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Container(
                                  constraints:
                                  const BoxConstraints(maxWidth: 200),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(model.imageUrl),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.name,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Today's recomendation based on your taste"),
                  TextButton(onPressed: () {}, child: const Text('See all'))
                ],
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: RecipeModel.dummyData.length,
                    itemBuilder: (context, index) {
                      RecipeModel model = RecipeModel.dummyData[index];
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/details', arguments: model);
                            },
                            child: Card(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Container(
                                  constraints:
                                  const BoxConstraints(maxWidth: 200),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(model.imageUrl),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.name,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
