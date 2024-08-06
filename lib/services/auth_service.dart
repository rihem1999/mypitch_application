class AuthService {
  Future<bool> login(String email, String password) async {
    // Simuler une authentification
    await Future.delayed(Duration(seconds: 2));
    return email == 'test@mypitch.app' && password == 'password';
  }
}
