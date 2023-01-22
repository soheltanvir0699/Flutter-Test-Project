import 'dart:convert';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeViewdata extends StatefulWidget {
  const HomeViewdata({Key? key}) : super(key: key);

  @override
  State<HomeViewdata> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeViewdata> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest api call'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context, index) {
          final user = users[index];
          final email = user["email"];
          final name = user['name']['first'];
          final image = user['picture']['thumbnail'];
          final age = user['dob']['age'];
          print(image);
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:
                  Image.network("https://picsum.photos/150/150")
              ),
              title: Text(name),
              subtitle: Text(email),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers,),
    );
  }
  void fetchUsers() async {
    Loader.show(context,
        isSafeAreaOverlay: false,
        isBottomBarOverlay: false,
        overlayFromBottom: 80,
        overlayColor: Colors.black26,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
        themeData: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))
    );
    print('fetch users');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    Loader.hide();
  }
}
