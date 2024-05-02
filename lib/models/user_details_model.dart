class UserDetails {
  String? documentType;
  String? passportNumbe;
  String? nicNumber;
  String? selectedCountryCode;
  String? mobileNumber;
  String? emailAddress;
  String? firstName;
  String? lastName;
  String? house;
  String? streetName;
  String? city;
  String? country;
  String? passportImage;
  String? visaImage;
  String? selfieImage;
  String? pin;
  List<String>? proofDocument;

  UserDetails(
      {this.documentType,
      this.passportNumbe,
      this.nicNumber,
      this.selectedCountryCode,
      this.mobileNumber,
      this.emailAddress,
      this.firstName,
      this.lastName,
      this.house,
      this.streetName,
      this.city,
      this.country,
      this.passportImage,
      this.visaImage,
      this.selfieImage,
      this.pin,
      this.proofDocument});

  factory UserDetails.empty() => UserDetails(
        // Todo: 1. Remove if not needed
        // preferredLanguage: Language.english,
        documentType: '',
        passportNumbe: '',
        nicNumber: '',
        selectedCountryCode: '',
        mobileNumber: '',
        emailAddress: '',
        firstName: '',
        lastName: '',
        house: '',
        streetName: '',
        city: '',
        country: '',
        passportImage: '',
        visaImage: '',
        selfieImage: '',
        pin: '',
        proofDocument: []
      );
}
