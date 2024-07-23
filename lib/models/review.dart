class Review {
  final String restaurantId;
  final String userId;
  final String user;
  final String reviewTime;
  final String rating;
  final String comment;
  final String commentTokenize;

  Review({
    required this.restaurantId,
    required this.userId,
    required this.user,
    required this.reviewTime,
    required this.rating,
    required this.comment,
    required this.commentTokenize,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      restaurantId: json['RestaurantID'] ?? '',
      userId: json['UserID'] ?? '',
      user: json['User'] ?? '',
      reviewTime: json['Review Time'] ?? '',
      rating: json['Rating'] ?? '',
      comment: json['Comment'] ?? '',
      commentTokenize: json['Comment Tokenize'] ?? '',
    );
  }
}
