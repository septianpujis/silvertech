// ignore_for_file: constant_identifier_names
class AppConstant {
  // Environment variable/value are injected using maven build, see pom.xml =================>
  // Comment and override with static value if needed for dev ===============================>
  // After finish dev, revert back ! do not commit changes ! ================================>
  // static const String CLIENT_PROFILE = String.fromEnvironment("CLIENT_PROFILE");
  // static const String BASE_URL = String.fromEnvironment("SERVICE_URL");
  // static const String JSP_URL = String.fromEnvironment("UPDATE_URL");
  // static const String ONTEGO_COCKPIT_ID = String.fromEnvironment("ONTEGO_COCKPIT_ID");
  // ========================================================================================>

  // Override and use static value if needed for dev ========================================>
  // DO NOT COMMIT THE CHANGES !!! ONLY FOR LOCAL DEV PURPOSES ONLY !!!=====================->
  static const String CLIENT_PROFILE = "TEST";
  static const String ONTEGO_COCKPIT_ID = "I73EZT";
  static const String BASE_URL =
      "http://192.168.178.139:8080/iwis-service/api/v1";
  static const String JSP_URL =
      "http://192.168.178.139:8080/otgupdate/app/update.jsp";
  // ========================================================================================>

  static const String COCKPIT_URL = "https://cockpit.ontego.de/api";
  static const String PREF_LANG_KEY = "LANGUAGE";
  static const String PREF_DECIMAL_FORMAT_KEY = "DECIMAL_FORMAT";
  static const String HEADER_TOKEN_KEY = "authorization";
  static const String TOKEN_KEY = "token";
  static const String ONTEGO_DEVICE_ID_KEY = "ONTEGO_DEVICE_ID_KEY";
  static const String COCKPIT_LAST_ACCESS_KEY = "COCKPIT_LAST_ACCESS_KEY";
}
