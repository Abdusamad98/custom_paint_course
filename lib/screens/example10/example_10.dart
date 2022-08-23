
import 'package:custom_paint_course/widgets/donut_chart_item.dart';
import 'package:flutter/material.dart';



class Example10 extends StatefulWidget {
  const Example10({Key? key}) : super(key: key);

  @override
  State<Example10> createState() => _Example10State();
}

class _Example10State extends State<Example10> with SingleTickerProviderStateMixin {
  static const pal = [
    Colors.green,
    Colors.red,
    Colors.brown,
    Colors.blueAccent,
    Colors.black26
  ];
  List<DataItem> dataset = [
    DataItem(value: 0.125, color: pal[0], label: "12.5%"),
    DataItem(value: 0.25, color: pal[1], label: "25.0%"),
    DataItem(value: 0.375, color: pal[2], label: "37.5%"),
    DataItem(value: 0.125, color: pal[3], label: "12.5%"),
    DataItem(value: 0.125, color: pal[4], label: "12.5%"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Painter: Example"),
      ),
      body:  Stack(
        children: [
          DonutChartWidget(dataset: dataset),
          Positioned(
            top: MediaQuery.of(context).size.width / 2 - 50,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                   Icon(
                    Icons.wallet,
                    size: 30,
                  ),
                  Text(
                    "Statistics",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
