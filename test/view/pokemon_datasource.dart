import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('description', () {
    test("pokemon success", () async {
      Dio dio = Dio();
      dio.get("https://pokeapi.co/api/v2/pokemon").then((_) async =>
          Response(requestOptions: RequestOptions(path: ''), statusCode: 200));

      // expect({'result'}, );
    });
  });
}
