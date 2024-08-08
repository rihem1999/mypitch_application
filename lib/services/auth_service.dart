class AuthService {
  Future<bool> login(String email, String password) async {
    // Simuler une authentification
    print(email);
    print(password);
    return email == 'test@mypitch.app' && password == 'password';
  }
}
