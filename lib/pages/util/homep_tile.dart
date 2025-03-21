import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Fruit_Page/fruit_page.dart';

class HomepTile extends StatelessWidget {
  const HomepTile(
    {
      super.key, 
      required this.date, 
      required this.quantity, 
      required this.fruitname
    }
  );

  final int date;
  final int quantity;
  final String fruitname;

  Color backgroundColorPick(int date){
    Color x;

    if (date < 3){
      x = Colors.red.withOpacity(0.2);
    } else if (date < 5){
      x = Colors.yellow.withOpacity(0.2);
    } else {
      x = Colors.green.withOpacity(0.2);
    }

    return x;
  }

  Color textColorPick(int date){
    Color x;

    if (date < 5){
      x = Colors.red;
    } else {
      x = Colors.black;
    }

    return x;
  }

  @override
  Widget build(BuildContext context) {
    String datestring = date.toString();
    String quantitystring = quantity.toString();
    return Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 20),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FruitPage())),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    color: backgroundColorPick(date)
                ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Row(
                                children: [
                                  Text(fruitname,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text(quantitystring,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          Flexible(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 50, left: 20),
                                  child: Text("Expiring in $datestring days",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: textColorPick(date)
                                    ),
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
                );
  }
}