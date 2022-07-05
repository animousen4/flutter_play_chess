import 'package:hive/hive.dart';
part 'user.g.dart';
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String accessToken;

  @HiveField(1)
  final String jwtToken;

  User({required this.accessToken,required this.jwtToken});

  @override
  String toString() {
    return "User(accessToken: $accessToken; jwtToken: $jwtToken)";
  }
  
}