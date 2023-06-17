import 'package:flutter/material.dart';
import '../Misc/hexcolor.dart';

class ChartW extends StatefulWidget {
  final List<double> values;

  const ChartW({Key? key, required this.values}) : super(key: key);

  @override
  _ChartWState createState() => _ChartWState();
}

class _ChartWState extends State<ChartW> {
  List<Color> containerColors = [];
  List<double> values1 = [];
  List<double> values2 = [];

  @override
  void initState() {
    super.initState();

    final List<double> values = widget.values;

    values1 = values.sublist(0, 5); // Updated to have 5 values
    values2 = values.sublist(5); // Updated to have remaining values

    containerColors = List<Color>.filled(values.length, HexColor("#2A3645"));
  }

  void changeContainerColor(int index) {
    setState(() {
      if (containerColors[index] == HexColor("#2A3645")) {
        // Change to selected color when not selected
        containerColors[index] = Colors.red; // Example: changing to red
      } else {
        // Change back to default color when already selected
        containerColors[index] = HexColor("#2A3645");
      }

      // Reset other container colors
      for (int i = 0; i < containerColors.length; i++) {
        if (i != index) {
          containerColors[i] = HexColor("#2A3645");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(values1.length, (index) {
                return GestureDetector(
                  onTap: () {
                    changeContainerColor(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: 15,
                      height: values1[index],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: containerColors[index],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 6), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          ///
          ///
          ///
          Container(
            width: double.infinity,
            height: 10,
            decoration: BoxDecoration(
              color: HexColor("#2A3645"),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 6), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),

          ///
          ///
          ///
          Padding(
            padding: const EdgeInsets.only(right: 145),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(values2.length, (index) {
                return GestureDetector(
                  onTap: () {
                    changeContainerColor(index + values1.length);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Container(
                        width: 15,
                        height: values2[index],
                        color: containerColors[index + values1.length],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
