import 'package:hive/hive.dart';

part 'wand_local_model.g.dart';

@HiveType(typeId: 2)
class WandLocalModel {
  @HiveField(0)
  String? wood;
  @HiveField(1)
  String? core;
  @HiveField(2)
  double? length;

  WandLocalModel({this.wood, this.core, this.length});
}
