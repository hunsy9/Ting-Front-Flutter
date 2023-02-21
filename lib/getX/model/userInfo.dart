import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userInfo.g.dart';

@JsonSerializable()
class UserModel {
  int? userId;
  String? kakaoEmail;
  int? teamId;
  int? matchId;
  List<String>? states;
  String? nickname;
  int? schoolId;
  String? phone;
  String? major;
  String? schoolNum;
  String? birthday;
  int? success;
  int? fail;
  RxList<FriendModel> friends = RxList<FriendModel>();
  Rx<TeamModel> team = Rx<TeamModel>(TeamModel());
  RxList<MatchModel> matches = RxList<MatchModel>();

  UserModel({
     this.userId,
     this.kakaoEmail,
     this.teamId,
     this.matchId,
     this.states,
     this.nickname,
     this.schoolId,
     this.phone,
     this.major,
     this.schoolNum,
     this.birthday,
     this.success,
     this.fail,
     List<FriendModel>? friends,
     TeamModel? team,
     List<MatchModel>? matches,
  }) {
    this.friends.addAll(friends ?? []);
    this.team.value = team ?? TeamModel();
    this.matches.addAll(matches ?? []);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class TeamModel {
  int? teamId;
  int? member1;
  int? member2;
  int? member3;
  List<String>? preference;
  int? isMatching;

  TeamModel({
     this.teamId,
     this.member1,
     this.member2,
     this.member3,
     this.preference,
     this.isMatching,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}

@JsonSerializable()
class MatchModel {
  String? nickname;
  int? gender;
  int? age;
  String? major;
  String? image;
  String? schoolNum;

  MatchModel({
     this.nickname,
     this.gender,
     this.age,
     this.major,
     this.image,
     this.schoolNum,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}

@JsonSerializable()
class FriendModel {
  String? nickname;
  int? gender;
  int? age;
  String? major;
  String? image;
  String? schoolNum;
  int? isHidden;

  FriendModel({
     this.nickname,
     this.gender,
     this.age,
     this.major,
     this.image,
     this.schoolNum,
     this.isHidden,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) => _$FriendModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendModelToJson(this);
}


