// Copyright 2019 KagurazakaHanabi<i@yaerin.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bean.g.dart';

@JsonSerializable()
class Picture {
  Picture({
    this.id,
    this.tid,
    this.user,
    this.title,
    this.content,
    this.width,
    this.height,
    this.url,
    this.path,
    this.color,
    this.date,
    this.marked,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return _$PictureFromJson(json);
  }

  @JsonKey(name: 'PID')
  String id;

  @JsonKey(name: 'TID')
  String tid;

  @JsonKey(name: 'username')
  String user;

  @JsonKey(name: 'p_title')
  String title;

  @JsonKey(name: 'p_content')
  String content;

  int width;

  int height;

  @JsonKey(name: 'local_url')
  String url;

  @JsonKey(name: 'nativePath')
  String path;

  @JsonKey(name: 'theme_color', fromJson: _colorFromHex, toJson: _colorToHex)
  Color color;

  @JsonKey(name: 'p_date')
  String date;

  @JsonKey(defaultValue: false)
  bool marked;

  static List<Picture> parseList(List<dynamic> json) {
    return json.map((e) {
      return e == null ? null : Picture.fromJson(e as Map<String, dynamic>);
    })?.toList();
  }

  String toJson() => jsonEncode(_$PictureToJson(this));

  static Color _colorFromHex(String hex) {
    if (hex == null) return null;
    hex = hex.toUpperCase().replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF' + hex;
    } else if (hex.length == 3) {
      hex = 'FF' + hex[0] * 2 + hex[1] * 2 + hex[2] * 2;
    }
    return Color(int.parse(hex, radix: 16));
  }

  static String _colorToHex(Color color) {
    if (color == null) return null;
    return '#' + color.value.toRadixString(16);
  }
}

@JsonSerializable()
class Recents {
  Recents({this.current, this.maximum, this.option, this.data});

  factory Recents.fromJson(Map<String, dynamic> json) {
    return _$RecentsFromJson(json);
  }

  @JsonKey(name: 'page')
  int current;

  @JsonKey(name: 'maxpage')
  int maximum;

  @JsonKey(name: 'op')
  String option;

  @JsonKey(name: 'result')
  List<Picture> data;

  String toJson() => jsonEncode(_$RecentsToJson(this));
}

@JsonSerializable()
class Splash {
  Splash({this.title, this.imageUrl, this.effectiveAt, this.expiresAt});

  factory Splash.fromJson(Map<String, dynamic> json) {
    return _$SplashFromJson(json);
  }

  @JsonKey(name: 'splash_title')
  String title;

  @JsonKey(name: 'splash_image')
  String imageUrl;

  @JsonKey(name: 'effective_at', fromJson: _parseDateTime)
  DateTime effectiveAt;

  @JsonKey(name: 'expires_at', fromJson: _parseDateTime)
  DateTime expiresAt;

  String toJson() => jsonEncode(_$SplashToJson(this));

  static DateTime _parseDateTime(String s) => DateTime.parse(s);
}

@JsonSerializable()
class Contributor {
  Contributor({this.avatar, this.name, this.position, this.url});

  factory Contributor.fromJson(Map<String, dynamic> json) {
    return _$ContributorFromJson(json);
  }

  String avatar;

  String name;

  String position;

  String url;

  String toJson() => jsonEncode(_$ContributorToJson(this));
}

@JsonSerializable()
class User {
  User({this.nickname, this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  String nickname;

  String username;

  String toJson() => jsonEncode(_$UserToJson(this));
}
