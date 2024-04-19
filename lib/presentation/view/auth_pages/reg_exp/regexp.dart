class RegExpp {
  static RegExp get passwordValidator => RegExp(
        r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>_-]).{8,}$',
      );

  static RegExp get emailValidator =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static RegExp get phoneNumberValidator => RegExp(r'^[0-9]{10}$');
  static RegExp get nameValidator => RegExp(r'^.{4,}$');
  static RegExp get profileValidator => RegExp(r'^(?=.*[a-zA-Z0-9]).{8,}$');
  static RegExp get descriptionValidator => RegExp(r'.[a-zA-Z].');
}
