class PokeDetails {
  final int baseExperience;
  final int height;
  // final String sprite;

  PokeDetails({
    required this.baseExperience,
    required this.height,
    // required this.sprite,
  });

  factory PokeDetails.fromJson(Map<String, dynamic> json) {
    return PokeDetails(
      baseExperience: json['base_experience'],
      height: json['height'],
      // sprite: json['sprite'],
    );
  }
}