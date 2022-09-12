// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       theme: ThemeData(
//         // Add the 5 lines from here...
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//         ),
//       ), // ... to here.
//       home: const RandomWords(),
//       // home: Scaffold(
//       //   appBar: AppBar(
//       //     title: const Text('App'),
//       //   ),
//       //   body: const Center(
//       //     // Drop the const, and
//       //     //child: Text('Hello World'),        // Replace this text...
//       //     child: RandomWords(),
//       //   ),
//       // ),
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   const RandomWords({super.key});

//   @override
//   State<RandomWords> createState() => _RandomWordsState();
// }

// class _RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _saved = <WordPair>{}; // NEW
//   final _biggerFont = const TextStyle(fontSize: 18);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: const Text('Startup Name Generator'),
//         // ),
//         appBar: AppBar(
//           title: const Text('Startup Name Generator'),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.list),
//               onPressed: _pushSaved,
//               tooltip: 'Saved Suggestions',
//             ),
//           ],
//         ),
//         // body: _buildSuggestions(),
//         body: const Center(
//           child: Image(
//               image: AssetImage(
//             'images/IMG_5665.jpg',
//           )),
//         ));
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(
//       // Add lines from here...
//       MaterialPageRoute<void>(
//         builder: (context) {
//           final tiles = _saved.map(
//             (pair) {
//               return ListTile(
//                 title: Text(
//                   pair.asPascalCase,
//                   style: _biggerFont,
//                 ),
//               );
//             },
//           );
//           final divided = tiles.isNotEmpty
//               ? ListTile.divideTiles(
//                   context: context,
//                   tiles: tiles,
//                 ).toList()
//               : <Widget>[];

//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Saved Suggestions'),
//             ),
//             body: ListView(children: divided),
//           );
//         },
//       ), // ...to here.
//     );
//   }

//   Widget _buildSuggestions() {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemBuilder: (BuildContext context, int i) {
//         if (i.isOdd) {
//           return const Divider();
//         }
//         final int index = i ~/ 2;
//         if (index >= _suggestions.length) {
//           _suggestions.addAll(generateWordPairs().take(10));
//         }
//         final alreadySaved = _saved.contains(_suggestions[index]); // NEW
//         return _buildRow(_suggestions[index], alreadySaved);
//       },
//     );
//   }

//   Widget _buildRow(WordPair pair, bool alreadySaved) {
//     return ListTile(
//       title: Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//       trailing: Icon(
//         // NEW from here ...
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//         semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
//       ),
//       onTap: () {
//         // NEW from here ...
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegScreen(),
    );
  }
}

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  void startChat() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      username: _nameController.text.trim(),
                    )));
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFEAEFF2),
          height: size.height,
          width: size.width,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    width: size.width * 0.80,
                    child: TextField(
                      controller: _nameController,
                      cursorColor: Colors.black,
                      autofocus: false,
                      style: const TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your username',
                        hintStyle: const TextStyle(fontSize: 15),
                        labelStyle: const TextStyle(
                            fontSize: 15, color: const Color(0xFF271160)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xFF271160))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xFF271160))),
                        disabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xFF271160))),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  width: size.width * 0.80,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF271160)),
                    onPressed: startChat,
                    child: _isLoading
                        ? Transform.scale(
                            scale: 0.7,
                            child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 2.5),
                          )
                        : Text('Start Chat',
                            style: const TextStyle(
                                fontSize: 17, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
