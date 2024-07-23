class Restaurant {
  final String restaurantId;
  final String name;
  final String address;
  final String time;
  final String district;
  final String timeOpen;
  final String timeClose;
  final String lowestPrice;
  final String highestPrice;

  Restaurant({
    required this.restaurantId,
    required this.name,
    required this.address,
    required this.time,
    required this.district,
    required this.timeOpen,
    required this.timeClose,
    required this.lowestPrice,
    required this.highestPrice,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      restaurantId: json['RestaurantID'] ?? '',
      name: json['Restaurant Name'] ?? '',
      address: json['Address'] ?? '',
      time: json['Time'] ?? '',
      district: json['District'] ?? '',
      timeOpen: json['Time Open'] ?? '',
      timeClose: json['Time Close'] ?? '',
      lowestPrice: json['Lowest Price'] ?? '',
      highestPrice: json['Highest Price'] ?? '',
    );
  }
}
