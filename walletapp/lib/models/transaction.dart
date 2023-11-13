import 'package:hive/hive.dart';

part 'transaction.g.dart';

// Definición del modelo Transaction
@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double quantity;
  @HiveField(3)
  final String transactionType;
  @HiveField(4)
  final DateTime dateTime;

  Transaction(
      this.id, this.name, this.quantity, this.transactionType, this.dateTime);
}
