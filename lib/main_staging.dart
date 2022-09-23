// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:mowi/app/app.dart';
import 'package:mowi/bootstrap.dart';
import 'package:mowi/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushProvider.getPushservice().init();
  bootstrap(() => const App(),);
}
