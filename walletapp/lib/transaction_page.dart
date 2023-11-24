import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/account.dart';
import 'models/transaction.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final _accounts = Hive.box('accountsBox'); // Accounts Tables (Box)

  final _name = TextEditingController();
  final _quantity = TextEditingController()..text = '0';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Cierra la caja
    _accounts.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Transactions'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _accounts.listenable(),
              builder: (context, accountsBox, _) {
                return ListView.builder(
                  itemCount: accountsBox.length,
                  itemBuilder: (context, index) {
                    final Account account = accountsBox.getAt(index) as Account;
                    return Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 10.0, right: 10.0),
                        title: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Icon(
                                  Icons.wallet,
                                  color: Colors.indigo,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            account.title.toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.indigo,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 30),
                                          Text(
                                            '\$${account.balance}',
                                            style: const TextStyle(
                                              color: Colors.indigo,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 20),
                                      child: Text(
                                        account.number,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green.shade200),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(2.0),
                                        ),
                                        color: Colors.green[300]),
                                    child: Column(
                                      children: [
                                        const Text('INCOMES',
                                            style: TextStyle(
                                                color: Colors.white70)),
                                        const SizedBox(height: 3),
                                        Text('\$${account.incomes}',
                                            style: const TextStyle(
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red.shade200),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(2.0),
                                      ),
                                      color: Colors.red[300],
                                    ),
                                    child: Column(
                                      children: [
                                        const Text('EXPENSES',
                                            style: TextStyle(
                                                color: Colors.white70)),
                                        const SizedBox(height: 3),
                                        Text('\$${account.expenses}',
                                            style: const TextStyle(
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton.filled(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 34,
                          ),
                          alignment: Alignment.topRight,
                          onPressed: () {
                            accountsBox.delete(account.id);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _accountModal(context, 0);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _accountModal(BuildContext ctx, int? accountKey) async {
    showModalBottomSheet<void>(
      context: ctx,
      elevation: 5,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            top: 15,
            left: 15,
            right: 15,
          ),
          color: Colors.white70,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _name,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _quantity,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(hintText: 'Quatity'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.pop(ctx),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_name.text.isNotEmpty) {
                          var nextItem = _accounts.values.length + 1;

                          final today = DateTime.now();

                          List<Transaction> transactions = [];
                          Transaction transaction = Transaction(
                              1,
                              _name.text,
                              double.parse(_quantity.text),
                              "Debit",
                              today,
                              nextItem);

                          var createdAccount = _accounts.get(nextItem);
                          createdAccount.transactions.add(transaction);
                          createdAccount.save();

                          _name.clear();
                          _quantity.clear();

                          Navigator.pop(ctx);
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
