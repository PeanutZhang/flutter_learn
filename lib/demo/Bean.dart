
import 'package:json_annotation/json_annotation.dart';

//part 'bean.g.dart';
@JsonSerializable()
class Bean {

  String name;
  String email;
  String age;

//  factory Bean.fromJson(Map<String,dynamic> json) =>_$BeanFromJson(json);
//  Map<String,dynamic> toJson()=>_$BeanToJson(this);

  Bean();
}