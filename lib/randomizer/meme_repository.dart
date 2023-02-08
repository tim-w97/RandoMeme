import 'dart:io';

import 'package:http/http.dart' as fetcher;

class MemeRepository {
  Future<String> fetchRandomMeme() async {
    final uri = Uri(scheme: "https", host: "meme-api.com", path: "gimme");

    final response = await fetcher.get(uri);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(
          "Failed to fetch the meme image. Reason: ${response.reasonPhrase}");
    }

    return response.body;
  }
}
