class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? profileImageUrl;
  final String currency;
  final String language;
  final double startingBalance;
  final DateTime createdAt;
  final DateTime lastLogin;
  final bool isBiometricEnabled;
  final bool isTwoFactorEnabled;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.profileImageUrl,
    required this.currency,
    required this.language,
    required this.startingBalance,
    required this.createdAt,
    required this.lastLogin,
    required this.isBiometricEnabled,
    required this.isTwoFactorEnabled,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      currency: json['currency'] as String? ?? 'INR',
      language: json['language'] as String? ?? 'en',
      startingBalance: (json['startingBalance'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLogin: DateTime.parse(json['lastLogin'] as String),
      isBiometricEnabled: json['isBiometricEnabled'] as bool? ?? false,
      isTwoFactorEnabled: json['isTwoFactorEnabled'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'profileImageUrl': profileImageUrl,
      'currency': currency,
      'language': language,
      'startingBalance': startingBalance,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin.toIso8601String(),
      'isBiometricEnabled': isBiometricEnabled,
      'isTwoFactorEnabled': isTwoFactorEnabled,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? currency,
    String? language,
    double? startingBalance,
    DateTime? createdAt,
    DateTime? lastLogin,
    bool? isBiometricEnabled,
    bool? isTwoFactorEnabled,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      currency: currency ?? this.currency,
      language: language ?? this.language,
      startingBalance: startingBalance ?? this.startingBalance,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      isTwoFactorEnabled: isTwoFactorEnabled ?? this.isTwoFactorEnabled,
    );
  }
}
