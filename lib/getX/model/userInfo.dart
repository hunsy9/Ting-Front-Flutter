import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import '../customJsonConverter/rxIntConverter.dart';
import '../customJsonConverter/rxStringConverter.dart';
part 'userInfo.g.dart';

@JsonSerializable(checked: true, createFactory: true, fieldRename: FieldRename.snake )
class UserInfo {
  @RxIntConverter()
  final RxInt? user_id;

  @RxStringConverter()
  final RxString? kakao_email;

  @RxIntConverter()
  final RxInt? team_id;

  @RxIntConverter()
  final RxInt? match_id;

  @RxIntConverter()
  final RxInt? is_withdrawal;

  @RxStringConverter()
  final RxString? enroll_time;

  @RxStringConverter()
  final RxString? nickname;

  @RxIntConverter()
  final RxInt? school_id;

  @RxStringConverter()
  final RxString? kakao_name;

  @RxIntConverter()
  final RxInt? gender;

  @RxIntConverter()
  final RxInt? age;

  @RxStringConverter()
  final RxString? phone;

  @RxStringConverter()
  final RxString? major;

  @RxStringConverter()
  final RxString? image;

  @RxStringConverter()
  final RxString? school_num;

  @RxStringConverter()
  final RxString? birthday;

  @RxIntConverter()
  final RxInt? success;

  @RxIntConverter()
  final RxInt? fail;

  @RxStringConverter()
  final RxString? last_update;

  UserInfo({
    this.user_id,
    this.kakao_email,
    this.team_id,
    this.match_id,
    this.is_withdrawal,
    this.enroll_time,
    this.nickname,
    this.school_id,
    this.kakao_name,
    this.gender,
    this.age,
    this.phone,
    this.major,
    this.image,
    this.school_num,
    this.birthday,
    this.success,
    this.fail,
    this.last_update,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

