class JobMatchesDataModel {
  String image;
  num views;
  num likes;
  num cost;
  String job;
  String description;

  JobMatchesDataModel({
    required this.image,
    required this.views,
    required this.likes,
    required this.cost,
    required this.job,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['views'] = views;
    data['likes'] = likes;
    data['description'] = description;
    data['cost'] = cost;
    data['job'] = job;
    return data;
  }

  factory JobMatchesDataModel.fromJson(dynamic json) {
    return JobMatchesDataModel(
      image: json['image'] as String,
      views: json['views'] as num,
      likes: json['likes'] as num,
      cost: json['cost'] as num,
      job: json['job'] as String,
      description: json['description'] as String,
    );
  }
}
