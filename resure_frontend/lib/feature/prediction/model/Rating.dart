class Rating {
  int? id;
  double rate;
  Rating({
    this.id,
    required this.rate,
  });
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json["id"],
      rate: json["rate"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'rating': rate,
      };
}
