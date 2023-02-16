// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserInfo',
      json,
      ($checkedConvert) {
        final val = UserInfo(
          user_id: $checkedConvert(
              'user_id', (v) => const RxIntConverter().fromJson(v as int?)),
          kakao_email: $checkedConvert('kakao_email',
              (v) => const RxStringConverter().fromJson(v as String?)),
          team_id: $checkedConvert(
              'team_id', (v) => const RxIntConverter().fromJson(v as int?)),
          match_id: $checkedConvert(
              'match_id', (v) => const RxIntConverter().fromJson(v as int?)),
          is_withdrawal: $checkedConvert('is_withdrawal',
              (v) => const RxIntConverter().fromJson(v as int?)),
          enroll_time: $checkedConvert('enroll_time',
              (v) => const RxStringConverter().fromJson(v as String?)),
          nickname: $checkedConvert('nickname',
              (v) => const RxStringConverter().fromJson(v as String?)),
          school_id: $checkedConvert(
              'school_id', (v) => const RxIntConverter().fromJson(v as int?)),
          kakao_name: $checkedConvert('kakao_name',
              (v) => const RxStringConverter().fromJson(v as String?)),
          gender: $checkedConvert(
              'gender', (v) => const RxIntConverter().fromJson(v as int?)),
          age: $checkedConvert(
              'age', (v) => const RxIntConverter().fromJson(v as int?)),
          phone: $checkedConvert(
              'phone', (v) => const RxStringConverter().fromJson(v as String?)),
          major: $checkedConvert(
              'major', (v) => const RxStringConverter().fromJson(v as String?)),
          image: $checkedConvert(
              'image', (v) => const RxStringConverter().fromJson(v as String?)),
          school_num: $checkedConvert('school_num',
              (v) => const RxStringConverter().fromJson(v as String?)),
          birthday: $checkedConvert('birthday',
              (v) => const RxStringConverter().fromJson(v as String?)),
          success: $checkedConvert(
              'success', (v) => const RxIntConverter().fromJson(v as int?)),
          fail: $checkedConvert(
              'fail', (v) => const RxIntConverter().fromJson(v as int?)),
          last_update: $checkedConvert('last_update',
              (v) => const RxStringConverter().fromJson(v as String?)),
        );
        return val;
      },
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'user_id': const RxIntConverter().toJson(instance.user_id),
      'kakao_email': const RxStringConverter().toJson(instance.kakao_email),
      'team_id': const RxIntConverter().toJson(instance.team_id),
      'match_id': const RxIntConverter().toJson(instance.match_id),
      'is_withdrawal': const RxIntConverter().toJson(instance.is_withdrawal),
      'enroll_time': const RxStringConverter().toJson(instance.enroll_time),
      'nickname': const RxStringConverter().toJson(instance.nickname),
      'school_id': const RxIntConverter().toJson(instance.school_id),
      'kakao_name': const RxStringConverter().toJson(instance.kakao_name),
      'gender': const RxIntConverter().toJson(instance.gender),
      'age': const RxIntConverter().toJson(instance.age),
      'phone': const RxStringConverter().toJson(instance.phone),
      'major': const RxStringConverter().toJson(instance.major),
      'image': const RxStringConverter().toJson(instance.image),
      'school_num': const RxStringConverter().toJson(instance.school_num),
      'birthday': const RxStringConverter().toJson(instance.birthday),
      'success': const RxIntConverter().toJson(instance.success),
      'fail': const RxIntConverter().toJson(instance.fail),
      'last_update': const RxStringConverter().toJson(instance.last_update),
    };
