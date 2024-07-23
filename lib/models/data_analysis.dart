
class DataAnalysis {
  final String restaurantId;
  final String restaurantName;
  final String address;
  final String time;
  final String district;
  final String timeOpen;
  final String timeClose;
  final double lowestPrice;
  final double highestPrice;
  final String userId;
  final String user;
  final String reviewTime;
  final double rating;
  final String commentTokenize;
  final int positiveCount;
  final int negativeCount;
  final String label;

  DataAnalysis({
    required this.restaurantId,
    required this.restaurantName,
    required this.address,
    required this.time,
    required this.district,
    required this.timeOpen,
    required this.timeClose,
    required this.lowestPrice,
    required this.highestPrice,
    required this.userId,
    required this.user,
    required this.reviewTime,
    required this.rating,
    required this.commentTokenize,
    required this.positiveCount,
    required this.negativeCount,
    required this.label,
  });

  factory DataAnalysis.fromJson(Map<String, dynamic> json) {
    return DataAnalysis(
      restaurantId: json['RestaurantID'] ?? '',
      restaurantName: json['Restaurant Name'] ?? '',
      address: json['Address'] ?? '',
      time: json['Time'] ?? '',
      district: json['District'] ?? '',
      timeOpen: json['Time Open'] ?? '',
      timeClose: json['Time Close'] ?? '',
      lowestPrice: _parseDouble(json['Lowest Price']),
      highestPrice: _parseDouble(json['Highest Price']),
      userId: json['UserID'] ?? '',
      user: json['User'] ?? '',
      reviewTime: json['Review Time'] ?? '',
      rating: _parseDouble(json['Rating']),
      commentTokenize: json['Comment Tokenize'] ?? '',
      positiveCount: _parseInt(json['Positive Count']),
      negativeCount: _parseInt(json['Negative Count']),
      label: json['Label'] ?? '',
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    return double.tryParse(value.toString()) ?? 0.0;
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    return int.tryParse(value.toString()) ?? 0;
  }
}
