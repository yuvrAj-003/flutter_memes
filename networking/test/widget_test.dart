// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:networking/models/memes_response.dart';
import 'package:networking/services/apis.dart';

void main() {
  test("api test", () async {
    final response = await API.getMemes();

    print(response.data!.memes.toString());
    expect(response.success, true);
  });
}
