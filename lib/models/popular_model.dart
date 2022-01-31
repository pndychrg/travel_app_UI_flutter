class PopularModel {
  late String image;
  late int color;

  PopularModel(image, color) {
    if (image != null && color != null) {
      this.image = image;
      this.color = color;
    }
  }
}

List<PopularModel> populars = popularsData
    .map((item) => PopularModel(item['images'], item['color']))
    .toList();

var popularsData = [
  {"images": "assets/images/img_beach.png", "color": 0xFFFEF1ED},
  {"images": "assets/images/img_mountain.png", "color": 0xFFEDF6FE},
  {"images": "assets/images/img_lake.png", "color": 0xFFFEF6E8},
  {"images": "assets/images/img_river.png", "color": 0xFFEAF8E8},
];
