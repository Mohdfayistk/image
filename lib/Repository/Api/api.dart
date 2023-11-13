import 'dart:convert';

import 'package:http/http.dart';


import '../Modelclass/image.dart';
import 'api_client.dart';

class AnimeApi {
  ApiClient apiClient = ApiClient();

  Future<Image1> getAnime(String text) async {
    String trendingpath = 'https://text-to-image7.p.rapidapi.com/?prompt=$text&batch_size=1&negative_prompt=ugly, duplicate, morbid, mutilated, [out of frame], extra fingers, mutated hands, poorly drawn hands, poorly drawn face, mutation, deformed, blurry, bad anatomy, bad proportions';
    var body = {
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Image1.fromJson(jsonDecode(response.body));
  }
}