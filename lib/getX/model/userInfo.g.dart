// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as int?,
      kakaoEmail: json['kakaoEmail'] as String?,
      teamId: json['teamId'] as int?,
      matchId: json['matchId'] as int?,
      states:
          (json['states'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['image'] as String?,
      nickname: json['nickname'] as String?,
      schoolName: json['schoolName'] as String?,
      phone: json['phone'] as String?,
      major: json['major'] as String?,
      schoolNum: json['schoolNum'] as String?,
      birthday: json['birthday'] as String?,
      success: json['success'] as int?,
      fail: json['fail'] as int?,
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => FriendModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      team: json['team'] == null
          ? null
          : TeamModel.fromJson(json['team'] as Map<String, dynamic>),
      matches: (json['matches'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'kakaoEmail': instance.kakaoEmail,
      'teamId': instance.teamId,
      'matchId': instance.matchId,
      'states': instance.states,
      'image': instance.image,
      'nickname': instance.nickname,
      'schoolName': instance.schoolName,
      'phone': instance.phone,
      'major': instance.major,
      'schoolNum': instance.schoolNum,
      'birthday': instance.birthday,
      'success': instance.success,
      'fail': instance.fail,
      'friends': instance.friends,
      'team': instance.team,
      'matches': instance.matches,
    };

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => TeamModel(
      teamId: json['teamId'] as int?,
      leaderId: json['leaderId'] as int?,
      member1Id: json['member1Id'] as int?,
      member2Id: json['member2Id'] as int?,
      preference: (json['preference'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isMatching: json['isMatching'] as int?,
      teamMatchState: json['teamMatchState'] as String?,
    );

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'teamId': instance.teamId,
      'leaderId': instance.leaderId,
      'member1Id': instance.member1Id,
      'member2Id': instance.member2Id,
      'preference': instance.preference,
      'isMatching': instance.isMatching,
      'teamMatchState': instance.teamMatchState,
    };

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      userId: json['userId'] as int?,
      nickname: json['nickname'] as String?,
      gender: json['gender'] as int?,
      age: json['age'] as int?,
      major: json['major'] as String?,
      image: json['image'] as String?,
      schoolNum: json['schoolNum'] as String?,
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'age': instance.age,
      'major': instance.major,
      'image': instance.image,
      'schoolNum': instance.schoolNum,
    };

FriendModel _$FriendModelFromJson(Map<String, dynamic> json) => FriendModel(
      userId: json['userId'] as String?,
      nickname: json['nickname'] as String?,
      kakaoName: json['kakaoName'] as String?,
      gender: json['gender'] as int?,
      age: json['age'] as int?,
      birthday: json['birthday'] as String?,
      major: json['major'] as String?,
      image: json['image'] as String?,
      schoolNum: json['schoolNum'] as String?,
      isHidden: json['isHidden'] as int?,
    );

Map<String, dynamic> _$FriendModelToJson(FriendModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'kakaoName': instance.kakaoName,
      'gender': instance.gender,
      'age': instance.age,
      'birthday': instance.birthday,
      'major': instance.major,
      'image': instance.image,
      'schoolNum': instance.schoolNum,
      'isHidden': instance.isHidden,
    };
