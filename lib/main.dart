import 'package:emulator4/story_brain.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';


void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}


StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/background.png"),
          )
          ),
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
               Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);

                      });

                    },
                    child: Text(
                      storyBrain.getChoice1(),
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      child: Text(
                        storyBrain.getChoice2(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}