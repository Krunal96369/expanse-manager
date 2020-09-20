import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletTransaction;
  TransactionList(this.transactions, this.deletTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => Column(
                  children: [
                    Text(
                      'No transaction yet!!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                ))
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  leading: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(7),
                    child: Text(
                      '₹ ${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: MediaQuery.of(context).size.width < 450
                      ?IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () =>
                              deletTransaction(transactions[index].id),
                        ): RaisedButton.icon(
                        textColor: Colors.red,
                          onPressed: ()=>deletTransaction(transactions[index].id),
                          icon: Icon(Icons.delete),
                          label: Text('Delete'))
                      
                ),
              );
            },
          );
  }
}
