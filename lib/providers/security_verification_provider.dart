import 'package:flutter/material.dart';

import '../models/security_verification_model.dart';

class SecurityVerificationProvider extends ChangeNotifier {
  SecurityQuestion? _securityQuestion;

  SecurityQuestion get SecurityQuestion => _securityQuestion!;
  addSecurityQuestionDetails({
    required String securityQuestionOne,
    required String securityQuestionTwo,
    required String securityQuestionAnswerOne,
    required String securityQuestionAnswerTwo,
  }) {
    _securityQuestion!.securityQuestionOne = securityQuestionOne;
    _securityQuestion!.securityQuestionTwo = securityQuestionTwo;
    _securityQuestion!.securityQuestionAnswerOne = securityQuestionAnswerOne;
    _securityQuestion!.securityQuestionAnswerTwo = securityQuestionAnswerTwo;
    notifyListeners();
  }
}
