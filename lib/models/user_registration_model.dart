class RegisterUser {
  String? firstName;
  String? lastName;
  String? home;
  String? streetName;
  String? city;
  String? country;

  RegisterUser({
    this.firstName,
    this.lastName,
    this.home,
    this.streetName,
    this.city,
    this.country,
  });

  factory RegisterUser.empty() => RegisterUser(
    firstName: '',
    lastName: '',
    home: '',
    streetName: '',
    city: '',
    country: '',
  );
}
