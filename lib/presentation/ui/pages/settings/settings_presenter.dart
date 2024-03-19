abstract class SettingsPresenter {
  bool get darkMode;
  String get deviceName;
  String get deviceId;

  void loadCurrentThemeMode();
  void toggleDarkMode(bool value);
}
