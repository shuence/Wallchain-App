class AdminModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String fcmToken; // Add FCM Token

  AdminModel({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'admin',
    required this.fcmToken, // Initialize FCM Token
  });

  factory AdminModel.fromFirestore(Map<String, dynamic> data) {
    return AdminModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      role: data['role'] ?? 'admin',
      fcmToken: data['fcm_token'], // Retrieve FCM Token
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'fcm_token': fcmToken, // Store FCM Token
    };
  }
}
