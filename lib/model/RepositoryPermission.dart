import 'package:json_annotation/json_annotation.dart';

part 'RepositoryPermission.g.dart';

@JsonSerializable()
class RepositoryPermission{


 bool admin;
 bool push;
 bool pull;

 RepositoryPermission(this.admin, this.push, this.pull);

 factory RepositoryPermission.fromJson(Map<String,dynamic> json) => _$RepositoryPermissionFromJson(json);

 Map<String,dynamic> toJson() => _$RepositoryPermissionToJson(this);

}