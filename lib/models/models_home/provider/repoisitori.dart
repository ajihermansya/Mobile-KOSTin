import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kostin/models/models_home/models/model.dart';

class Repository {
  final _baseUrl =
      "https://script.googleusercontent.com/macros/echo?user_content_key=vrXMzywmr52eOL03yhm2XHTMm6mVR4fW3Ax0GR4lauRvnoKBspDEJQ_JQ5-w_P7KRZsR5hRQkIzPFTZW3TZ4m_ZgV8gIlNRtm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnIBf7KraMel26MpUdGj61nvs2vs6-uChb59xqGH9X69Cn-yMUJCREiAeadIm83M5fHKWQRjWC8GloE7abOcb7FuFF7FeBRSf0w&lib=M-AJbH7SIwpO34cAmAW4KbB9RNx0BfzFA";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Kost> kost = it.map((e) => Kost.fromJson(e)).toList();
        return kost;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
