import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      builder: (context) => Data(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        title: 'Provider Test',
        home: Level1(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<Data>(context, listen: false).data),
      ),
      body: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level3();
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (inputString) {
              Provider.of<Data>(context).changeString(inputString);
            },
          ),
          Center(
            child: Text(
              Provider.of<Data>(context).data,
              style: TextStyle(
                fontSize: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'some data fjjfjf';

  void changeString(newString) {
    data = newString;
    notifyListeners();
  }
}
