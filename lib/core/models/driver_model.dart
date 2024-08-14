import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel {
  final String id;
  final String name;
  final String licenseNumber;
  final DateTime dateOfBirth;
  final int totalRides;
  final String vehicleNumber;
  final String email;
  final String fcmToken; // Add FCM Token

  DriverModel({
    required this.id,
    required this.name,
    required this.licenseNumber,
    required this.dateOfBirth,
    required this.totalRides,
    required this.vehicleNumber,
    required this.email,
    required this.fcmToken, // Initialize FCM Token
  });

  factory DriverModel.fromFirestore(Map<String, dynamic> data) {
    return DriverModel(
      id: data['id'],
      name: data['name'],
      licenseNumber: data['license_number'],
      dateOfBirth: (data['dob'] as Timestamp).toDate(),
      totalRides: data['total_rides'],
      vehicleNumber: data['vehicle_number'],
      email: data['email'],
      fcmToken: data['fcm_token'], // Retrieve FCM Token
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'license_number': licenseNumber,
      'dob': dateOfBirth,
      'total_rides': totalRides,
      'vehicle_number': vehicleNumber,
      'email': email,
      'fcm_token': fcmToken, // Store FCM Token
    };
  }
}
