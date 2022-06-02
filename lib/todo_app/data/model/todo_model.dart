import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class TodoModel extends HiveObject implements Equatable{
  TodoModel(this.id, this.title, this.description, this.completed);

  @HiveField(0)
  @JsonKey(name: 'task_id')
  String id;

  @HiveField(1)
  @JsonKey(name: 'todo_title')
  String title;

  @HiveField(2)
  @JsonKey(name: 'todo_des')
  String description;

  @HiveField(3)
  @JsonKey(name: 'completed', defaultValue: false)
  bool completed;

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  @override
  bool operator ==(Object other) => other is TodoModel && other.id == id;

  @override
  List<Object?> get props => [id];

  @override
  bool? get stringify => true;

  @override
  // TODO: implement hashCode
  int get hashCode => id.hashCode;

}