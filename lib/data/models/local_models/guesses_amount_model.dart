import 'package:hive/hive.dart';

part 'guesses_amount_model.g.dart';

@HiveType(typeId: 4)
class GuessesAmountModel {
  @HiveField(0)
  int total;
  @HiveField(1)
  int success;
  @HiveField(2)
  int failed;

  GuessesAmountModel({required this.total, required this.success, required this.failed});
}
