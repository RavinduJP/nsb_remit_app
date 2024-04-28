import 'package:flutter/material.dart';
import 'package:nsb_remit/models/user_registration_model.dart';

class UserRegistrationProvider extends ChangeNotifier {
  RegisterUser? _registerUser;

  RegisterUser get registerUser => _registerUser!;
  addUserregistrationDetails({
    required String firstName,
    required String lastName,
    required String home,
    required String streetName,
    required String city,
    required String country,
  }) {
    _registerUser!.firstName = firstName;
    _registerUser!.lastName = lastName;
    _registerUser!.home = home;
    _registerUser!.streetName = streetName;
    _registerUser!.city = city;
    _registerUser!.country = country;
    notifyListeners();
  }
}
