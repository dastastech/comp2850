import 'package:hive/hive.dart';
import 'package:walletapp/models/transaction.dart';

part 'account.g.dart';

// Definición del modelo Account
@HiveType(typeId: 0)
class Account extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String number;
  @HiveField(3)
  final double balance;
  @HiveField(4)
  final double incomes;
  @HiveField(5)
  final double expenses;

  @HiveField(6)
  List<Transaction> transactions;

  Account(this.id, this.title, this.number, this.balance, this.incomes,
      this.expenses, this.transactions);
}
