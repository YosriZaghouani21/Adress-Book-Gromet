import 'package:adress_book/models/response/auth/profile_model.dart';
import 'package:adress_book/services/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

class ProfileNotifier extends ChangeNotifier {
  Future<ProfileRes>? profile;
  getProfile() async {
    profile = AuthHelper.getProfile();
  }
}
