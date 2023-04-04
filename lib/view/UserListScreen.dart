import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maatrixflutter/model/ResponseModel.dart';
import 'package:provider/provider.dart';
import '../model/UserViewModel.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
   UserViewModel? _userViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _userViewModel = Provider.of<UserViewModel>(context,listen: false);
      _userViewModel!.viewProfilePictureData("30");
      _userViewModel!.setProfilePictureData(ResponseModel.Constructor());
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Container(
        child: _userViewModel!.profilePicture.api_status != null
            ? Text(_userViewModel!.profilePicture.message.toString())
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}