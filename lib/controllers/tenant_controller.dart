import '../network/config/env.dart';
import '../storage/storage.dart';

class TenantController {
  static String tenantKey = "tenant";

  /// Save tenant
  static Future<void> saveTenant(String tenant) async {
    await AppStorage.getPreferences().setString(tenantKey, tenant);
  }

  /// Get tenant which saved in localStorage.
  static String getTenant() {
    return AppStorage.getPreferences().getString(tenantKey) ?? "";
  }

  /// Base url dev replaced with tenant
  /// Todo check if dev should be dynamic
  static String baseUrl() {
    String tenant = getTenant() ?? '';
    //todo replace true with kDebugMode
    if (true) {
      return tenant.isNotEmpty
          ? Env.baseUrl.replaceAll('dev', "$tenant.dev")
          : Env.baseUrl;
    } else {
      return Env.baseUrl.replaceFirst("https://", "https://$tenant.");
    }
  }
}
