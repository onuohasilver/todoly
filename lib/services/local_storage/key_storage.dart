import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'key_value_storage_service.dart';

// Class implementation of the `KeyValueStorageService`
class FlutterSecureStorageImpl implements KeyValueStorageService {
  // Reference to the `FlutterSecureStorage` instance
  final FlutterSecureStorage storage;

  // Constructor with an optional `FlutterSecureStorage` parameter
  // `const FlutterSecureStorageImpl` makes sure that this instance will be initialized only once
  const FlutterSecureStorageImpl({this.storage = const FlutterSecureStorage()});

  // Method to save a string value in secure storage with the specified key
  @override
  Future<void> saveString(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  // Method to read a string value from secure storage with the specified key
  @override
  Future<String?> readString(String key) async {
    return await storage.read(key: key);
  }

  // Method to delete a string value from secure storage with the specified key
  @override
  Future<void> deleteString(String key) async {
    return await storage.delete(key: key);
  }

  // Method to save a boolean value in secure storage with the specified key
  Future<void> saveBool(String key, bool value) async {
    await storage.write(key: key, value: jsonEncode({'value': value}));
  }

  // Method to check if a key exists in secure storage
  @override
  Future<bool> hasValue(String key) async {
    return await storage.containsKey(key: key);
  }

  // Method to read a boolean value from secure storage with the specified key
  Future<bool> readBool(String key) async {
    String? response = await storage.read(key: key);
    if (response == null) return false;
    return jsonDecode(response)['value'];
  }

  // Method to delete all values from secure storage
  Future<void> close() async {
    await storage.deleteAll();
  }

  // Method to initialize the secure storage
  @override
  Future<void> initialize() async {}
}
