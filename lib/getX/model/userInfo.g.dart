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
      nickname: json['nickname'] as String?,
      schoolId: json['schoolId'] as int?,
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
      'nickname': instance.nickname,
      'schoolId': instance.schoolId,
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
      member1: json['member1'] as int?,
      member2: json['member2'] as int?,
      member3: json['member3'] as int?,
      preference: (json['preference'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isMatching: json['isMatching'] as int?,
    );

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'teamId': instance.teamId,
      'member1': instance.member1,
      'member2': instance.member2,
      'member3': instance.member3,
      'preference': instance.preference,
      'isMatching': instance.isMatching,
    };

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      nickname: json['nickname'] as String?,
      gender: json['gender'] as int?,
      age: json['age'] as int?,
      major: json['major'] as String?,
      image: json['image'] as String?,
      schoolNum: json['schoolNum'] as String?,
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'gender': instance.gender,
      'age': instance.age,
      'major': instance.major,
      'image': instance.image,
      'schoolNum': instance.schoolNum,
    };

FriendModel _$FriendModelFromJson(Map<String, dynamic> json) => FriendModel(
      nickname: json['nickname'] as String?,
      gender: json['gender'] as int?,
      age: json['age'] as int?,
      major: json['major'] as String?,
      image: json['image'] as String?,
      schoolNum: json['schoolNum'] as String?,
      isHidden: json['isHidden'] as int?,
    );

Map<String, dynamic> _$FriendModelToJson(FriendModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'gender': instance.gender,
      'age': instance.age,
      'major': instance.major,
      'image': instance.image,
      'schoolNum': instance.schoolNum,
      'isHidden': instance.isHidden,
    };
