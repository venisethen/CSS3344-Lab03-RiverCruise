class CruiseDestination {
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  int starCount;
  bool isFavorite;

  CruiseDestination({
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
    this.starCount = 43,
    this.isFavorite = false,
  });
}