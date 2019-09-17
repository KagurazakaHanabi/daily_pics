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

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class C {
  static const String type_illus = '4ac1c07f-a9f7-11e8-a8ea-0202761b0892';
  static const String type_photo = '5398f27b-a9f7-11e8-a8ea-0202761b0892';
  static const String type_deskt = 'e5771003-b4ed-11e8-a8ea-0202761b0892';
}

class OverlayStyles {
  static final SystemUiOverlayStyle light = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Color(0x00000000),
  );

  static final SystemUiOverlayStyle dark = SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Color(0x00000000),
  );
}