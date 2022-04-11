import 'package:http/http.dart' as base_http;
import 'package:meta/meta.dart';

class AADConfig {
  String clientID;
  String redirectURI;
  final List<String> scope;
  String resource;
  int refreshTries;
  int apiVersion;
  String tenantId;

  AADConfig({
    this.resource,
    @required this.clientID,
    @required this.redirectURI,
    List<String> scope,
    this.refreshTries = 3,
    this.apiVersion = 1,
    this.tenantId,
  }) : this.scope = scope ?? [];

  AADConfig.clone(AADConfig config)
      : resource = config.resource,
        clientID = config.clientID,
        redirectURI = config.redirectURI,
        scope = List.from(config.scope),
        refreshTries = config.refreshTries,
        apiVersion = config.apiVersion,
        tenantId = config.tenantId;

  List<String> get Scope => List.from(scope);

  String get tenant => tenantId ?? 'common';
  String get V2_LOGIN_URI =>
      'https://login.microsoftonline.com/$tenant/oauth2/v2.0/token';
  String get LOGIN_URI =>
      'https://login.microsoftonline.com/$tenant/oauth2/token';
  String get V2_AUTH_URI =>
      'https://login.microsoftonline.com/$tenant/oauth2/v2.0/authorize';
  String get AUTH_URI =>
      'https://login.microsoftonline.com/$tenant/oauth2/authorize';
  String GRAPH_URI = 'https://graph.microsoft.com/v1.0';
}

class AADMap {
  Map<String, dynamic> map;
  bool didRefreshToken;
  Map<String, dynamic> full_token;
  AADMap(this.map, [this.didRefreshToken = false, this.full_token = null]);
}

class AADResponse {
  base_http.Response response;
  bool didRefreshToken;
  Map<String, dynamic> full_token;
  AADResponse(this.response,
      [this.didRefreshToken = false, this.full_token = null]);
}
