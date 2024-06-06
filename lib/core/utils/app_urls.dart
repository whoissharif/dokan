class AppUrls {
  static const baseUrl = 'https://apptest.dokandemo.com';

  static const login = '$baseUrl/wp-json/jwt-auth/v1/token';
  static const register = '$baseUrl/wp-json/wp/v2/users/register';
  static const profile = '$baseUrl/wp-json/wp/v2/users/me?context=edit';
  static const editProfile = '$baseUrl/wp-json/wp/v2/users/';
}
