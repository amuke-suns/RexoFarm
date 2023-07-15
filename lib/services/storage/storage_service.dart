// This is a contract all storage services must follow
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {

  Future<bool> showOnBoarding();

  Future<void> setShowOnBoarding(bool showOnBoard);
}

// this is the implementation
class StorageServiceImpl extends StorageService {

  final String keyShowOnBoard = 'showOnBoard';

  @override
  Future<void> setShowOnBoarding(bool showOnBoard) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyShowOnBoard, showOnBoard);
  }

  @override
  Future<bool> showOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyShowOnBoard) ?? true;
  }

}