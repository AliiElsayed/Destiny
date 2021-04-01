import 'package:flutter/material.dart';
import 'package:Destiny/story_mind.dart';

StoryMind storyMind = StoryMind();

void main() {
  runApp(Destiny());
}

class Destiny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body:Container(
//        decoration: BoxDecoration(
//        image: DecorationImage(
//        image: AssetImage('images/background.png'),
//    fit: BoxFit.cover,
//    ),
//    ),
//    padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
//    constraints: BoxConstraints.expand(),

      body: Stack(
       fit: StackFit.expand,
       //alignment: Alignment.center,
        children: [
          Image(image: AssetImage('images/background.png'),fit: BoxFit.fill,),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        storyMind.getStory(),
                        style: TextStyle(fontSize: 23.0),
                      ),
                    ),
                    flex: 12,
                  ),
                  Expanded(
                    child: FlatButton(
                      color: Colors.red,
                      child: Text(
                        storyMind.getFirstCh(),
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: (){
                        setState(() {
                          storyMind.getNextStory(1);
                        });

                      },
                    ),
                    flex: 2,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Visibility(
                    visible: storyMind.choice2ShouldBeVisible(),
                    child: Expanded(
                      child: FlatButton(
                        color: Colors.blue,
                        child: Text(
                          storyMind.getSecondCh(),
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        onPressed: (){
                          setState(() {
                            storyMind.getNextStory(2);
                          });

                        },
                      ),
                      flex: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),
    );
  }
}
