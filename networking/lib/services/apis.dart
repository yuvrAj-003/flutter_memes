import "dart:convert";

import "package:http/http.dart" as http;
import "package:networking/models/memes_response.dart";

// get memes
abstract class API {
  static const String _baseUrl = "https://api.imgflip.com/";
  static Future<Memes> getMemes() async {
    final response = await http.get(Uri.parse("$_baseUrl/get_memes"));

    if (response.statusCode == 200) {
      return Memes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to load memes");
    }
  }
}
