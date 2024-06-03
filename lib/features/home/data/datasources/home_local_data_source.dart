import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const CACHED_FROM_TEXT = 'CACHED_FROM_TEXT';

abstract class HomeLocalDataSource {
  Future<void> cacheFromText(String text);
  Future<String?> getFromText();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPreferences sharedPreferences;

  HomeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheFromText(String text) {
    return sharedPreferences.setString(
      CACHED_FROM_TEXT,
      text,
    );
  }

  @override
  Future<String?> getFromText() async {
    return sharedPreferences.getString(CACHED_FROM_TEXT);
  }
}
