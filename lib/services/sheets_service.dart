import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/auth_io.dart';

class SheetsService {
  static const _scopes = [sheets.SheetsApi.spreadsheetsScope];

  Future<sheets.SheetsApi> getSheetsApi() async {
    final accountCredentials = await _getAccountCredentials();
    final authClient = await clientViaServiceAccount(accountCredentials, _scopes);
    return sheets.SheetsApi(authClient);
  }

  Future<ServiceAccountCredentials> _getAccountCredentials() async {
    final jsonString = await rootBundle.loadString('assets/service_account.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ServiceAccountCredentials.fromJson(jsonMap);
  }
}
