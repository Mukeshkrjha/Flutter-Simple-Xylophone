import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Xylophone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Click on colors to Play',
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                ),
              ),
            ),
            buildXyloKey(color: Colors.red, soundName: 'note1.wav'),
            buildXyloKey(color: Colors.orange, soundName: 'note2.wav'),
            buildXyloKey(color: Colors.yellow, soundName: 'note3.wav'),
            buildXyloKey(color: Colors.green, soundName: 'note4.wav'),
            buildXyloKey(color: Colors.teal, soundName: 'note5.wav'),
            buildXyloKey(color: Colors.blue, soundName: 'note6.wav'),
            buildXyloKey(color: Colors.purple, soundName: 'note7.wav'),
          ],
        ),
      ),
    );
  }

  Expanded buildXyloKey({Color color, String soundName}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundName: soundName);
        },
      ),
    );
  }

  //Parameterised function with option to provide parameter name (by wrapping function parameter inside {parameter}) in where we are calling from.
  void playSound({String soundName}) {
    final audioPlayer = AudioCache();
    audioPlayer.play(soundName);
  }
}
