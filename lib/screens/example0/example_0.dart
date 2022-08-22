import 'package:flutter/material.dart';

class Example0 extends StatefulWidget {
  const Example0({Key? key}) : super(key: key);

  @override
  State<Example0> createState() => _Example0State();
}

class _Example0State extends State<Example0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Layout Builder"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 450) {
            return Center(
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.red,
              ),
            );
          } else {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.yellow,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// class TestScreen extends StatefulWidget {
//   const TestScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Test Screen"),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             width: 330,
//             height: 512,
//             child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                 print(constraints.maxWidth);
//                 print(constraints.minHeight);
//                 print(constraints.maxHeight);
//                 return constraints.maxWidth > 450
//                     ? Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.blue,
//                 )
//                     : Text(
//                   "dagfbj",
//                   style: TextStyle(
//                     fontSize:
//                     Theme.of(context).textTheme.headline1!.fontSize,
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
