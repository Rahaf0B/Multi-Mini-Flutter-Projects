import 'package:flutter/material.dart';
import 'Screens/Calculator.dart';
import 'Screens/loading_screen.dart';
import 'Screens/result_page.dart';
import 'Screens/DestiniProject.dart';
import 'Screens/QuizzlerProject.dart';

void main() => runApp(MultiProject());
const btnStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
);
const textStyle = TextStyle(
  color: Colors.orange,
  fontSize: 20.0,
);

class MultiProject extends StatelessWidget {
  const MultiProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/QuizPro': (context) => QuizPage(), '/story':(context)=>Destini()
      ,'/calculator':(context)=>BMICalculator(), '/weather':(context)=>LoadingScreen()},
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Expanded(
                //     child:
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ProjectButton(
                            btnText: "Quiz Project", route: '/QuizPro')),
                    Expanded(child: ProjectButton(btnText: "Story Project", route: '/story',))
                  ],
                ),
          // ),
                // Expanded(
                //   child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: ProjectButton(btnText: "Calculator Project",route: '/calculator',)),
                      Expanded(child: ProjectButton(btnText: "Weather Project",route: '/weather',))
                    ],
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectButton extends StatelessWidget {
  // const ProjectButton({
  //   super.key,
  // });
  final String btnText;
  final String route;
  const ProjectButton({super.key, required this.btnText, this.route = '/'});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          style: btnStyle,
          onPressed: () {
            Navigator.pushNamed(context, route);
            print("object");
          },
          child: Text(btnText, style: textStyle),
        ));
  }
}
