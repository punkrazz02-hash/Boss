import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/user_model.dart';

class LocalStorageService {
  static const String userBoxName = 'user_box';
  static const String preferencesBoxName = 'preferences_box';

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
  }

  // User Storage
  static Future<void> saveUser(User user) async {
    final box = await Hive.openBox(userBoxName);
    await box.put('current_user', user.toJson());
  }

  static Future<User?> getUser() async {
    final box = await Hive.openBox(userBoxName);
    final userData = box.get('current_user');
    if (userData != null) {
      return User.fromJson(Map<String, dynamic>.from(userData));
    }
    return null;
  }

  static Future<void> deleteUser() async {
    final box = await Hive.openBox(userBoxName);
    await box.delete('current_user');
  }

  // Preferences Storage
  static Future<void> setPreference(String key, dynamic value) async {
    final box = await Hive.openBox(preferencesBoxName);
    await box.put(key, value);
  }

  static Future<dynamic> getPreference(String key) async {
    final box = await Hive.openBox(preferencesBoxName);
    return box.get(key);
  }

  static Future<bool> hasPreference(String key) async {
    final box = await Hive.openBox(preferencesBoxName);
    return box.containsKey(key);
  }

  static Future<void> deletePreference(String key) async {
    final box = await Hive.openBox(preferencesBoxName);
    await box.delete(key);
  }

  // Clear all data
  static Future<void> clearAllData() async {
    await Hive.deleteBoxFromDisk(userBoxName);
    await Hive.deleteBoxFromDisk(preferencesBoxName);
  }
}

final localStorageServiceProvider = Provider((ref) {
  return LocalStorageService();
});
