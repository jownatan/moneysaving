import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../../Misc/hexcolor.dart";
import "../../Widgets/ChartW.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CurrentAmount = 2500.74;
    final SavingAmountMonth = 243.00;

    final currencyFormatter =
        NumberFormat.currency(locale: 'en_US', symbol: '\$');
    final CurrentformattedAmount = currencyFormatter.format(CurrentAmount);

    final currencyFormatter2 =
        NumberFormat.currency(locale: 'en_US', symbol: '\$');
    final MonthSavingformattedAmount =
        currencyFormatter.format(SavingAmountMonth);
    return Scaffold(
      backgroundColor: HexColor("#ABD4C2"),
      body: Column(
        children: [
          //
          // User
          //
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                //
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NAOMI",
                        style: TextStyle(
                          fontFamily: 'code',
                          fontSize: 25,
                          color: HexColor("#2A3645"),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      //
                      Text(
                        "I like kind people.",
                        style: TextStyle(
                          fontFamily: 'code',
                          fontSize: 15,
                          color: HexColor("#2A3645"),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Container(
                    width: 63,
                    height: 63,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: HexColor("#F4D4C8"),
                        width: 1.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/b3/1c/2f/b31c2f4290f2cc433df70786ea4fa48a.jpg"),
                    ),
                  ),
                )
              ],
            ),
          ),
          //
          // Money
          //
          SizedBox(
            height: 100,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                CurrentformattedAmount,
                style: TextStyle(
                  fontFamily: 'code',
                  fontSize: 48,
                  color: HexColor("#2A3645"),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          //Money desc
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Saved + " + MonthSavingformattedAmount + " this ",
                style: TextStyle(
                  fontFamily: 'code',
                  fontSize: 25,
                  color: HexColor("#2A3645"),
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "month!",
                style: TextStyle(
                  fontFamily: 'code',
                  fontSize: 25,
                  color: HexColor("#C08AAC"),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ChartW(values: [20, 50, 80, 30, 60]),
        ],
      ),
    );
  }
}
