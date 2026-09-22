import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    show RefreshJwtTokensEndpoint;

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
class JwtRefreshEndpoint extends RefreshJwtTokensEndpoint {}
