import 'package:flutter/cupertino.dart';
import 'package:maatrixflutter/model/ResponseModel.dart';
import 'package:maatrixflutter/model/util/UserRepository.dart';

class UserViewModel extends ChangeNotifier{
  List<UserViewModel> _users = [];
  UserRepository _userRepository = UserRepository();
  ResponseModel _profilePicture = ResponseModel.Constructor();

  // List<UserViewModel> get users => _users;

  // Future<void> getUsers() async {
  //   _users = (await _userRepository.getUsers()).cast<UserViewModel>();
  //   notifyListeners();
  // }
  ResponseModel get profilePicture => _profilePicture;

  setProfilePictureData(ResponseModel value) {
    _profilePicture = value;
    notifyListeners();
  }

  viewProfilePictureData(String userId) async {
    var response = await _userRepository.viewProfileImage(userId);
    if (response != null) {
      setProfilePictureData(response);
    } else {
      setProfilePictureData(ResponseModel.Constructor());
    }
  }
}