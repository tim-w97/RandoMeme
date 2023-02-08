import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as fetcher;
import 'package:rando_meme/randomizer/model/meme.dart';

class MemeRepository {
  Future<Meme> fetchRandomMeme() async {
    final uri = Uri(scheme: "https", host: "meme-api.com", path: "gimme");

    final response = await fetcher.get(uri);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(
          "Failed to fetch the meme image. Reason: ${response.reasonPhrase}");
    }

    final jsonData = jsonDecode(response.body);
    Meme meme = Meme.fromJson(jsonData);

    return meme;
  }
}
