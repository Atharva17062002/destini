import 'package:flutter/material.dart';
import 'Story.dart';
import 'Story_brain.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StoryPage(),
    );
  }
}
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(flex: 12,
                  child: Center(
                   child: Text(
                     //'Story Text will go here',
                     storyBrain.getStory(),
                      style: TextStyle(
                       fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                    ),
                    onPressed:(){
                    //Choice 1 made by user.
                      storyBrain.nextStory(1);
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    child: Text(
                    storyBrain.getChoice1(),
                    //'Choice 1',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  flex: 2,
                  //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                    child: Visibility(
                      visible: storyBrain.buttonShouldBeVisible(),
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
                        ),
                        onPressed: (){
                        //Choice 2 made by user.
                          storyBrain.nextStory(2);
                          setState(() {
                            storyBrain.nextStory(2);
                          });
                      },
                        child: Text(
                          storyBrain.getChoice2(),
                          //'Choice 2',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                          ),
                      ),),
                    ),
                )
              ],
            ),
          ),
      ),
    );
  }
}

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
