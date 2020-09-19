import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPrcntTotal;

  ChartBar({this.label, this.spending, this.spendingPrcntTotal});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context,constraints) {
      return  Column(
      children: [
        Container(
          height: constraints.maxHeight*0.15,
          child: FittedBox(
            child: Text(
              '₹ ${spending.toStringAsFixed(0)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight*0.05,
        ),
        Container(
          height: constraints.maxHeight*0.6,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPrcntTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: constraints.maxHeight*0.05,
        ),
        Container(height: constraints.maxHeight*0.15,child: FittedBox(child: Text(label))),
      ],
    );
    });
   
  }
}
