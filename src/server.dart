// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io' show Platform;

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() async {
  var handler =
      const Pipeline()
        .addMiddleware(logRequests())
        .addHandler(_echoRequest);

  Map<String, String> envVars = Platform.environment;
  final port = int.parse(Platform.environment['PORT'] ?? '3000');
  final host = Platform.environment['HOST'] ?? '0.0.0.0';

  var server = await shelf_io.serve(handler, host, port);

  // Enable content compression
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');
