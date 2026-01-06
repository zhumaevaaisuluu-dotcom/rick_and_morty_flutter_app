class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String imageUrl;
  final String origin;
  final String location;
  final List<String> episodes;
  final String gender;    
  bool isFavorite;

  Character({
    required this.id,
    required this.name, 
    required this.status, 
    required this.species,
    required this.imageUrl,
    this.isFavorite = false,
    required this.origin,
    required this.location,
    required this.episodes,
    required this.gender
  });
}

 
