class UserMetadata {
  UserMetadata({
    required this.creationTime,
    required this.lastSignInTime,
  });
  final DateTime creationTime;
  final DateTime lastSignInTime;

  factory UserMetadata.fromJson(Map<String, dynamic> map) => UserMetadata(
        creationTime: map['creationTime'],
        lastSignInTime: map['lastSignInTime'],
      );

  Map<String, dynamic> toJson() => {
        'creationTime': creationTime,
        'lastSignInTime': lastSignInTime,
      };
}
