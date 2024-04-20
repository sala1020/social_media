class Endpoints {
  static var header = {
    "x-api-key": "apikey@ciao",
    "Content-type": "application/json"
  };
  static String baseUrl = 'https://ciao.ashkar.tech';
  static String signUp = '/signup';
  static String varifyOtp = '/verify';
  static String signIn = "/login";
  static String forgotPassword = "/forgotpassword";
  static String resetPassword = "/resetpassword";
}