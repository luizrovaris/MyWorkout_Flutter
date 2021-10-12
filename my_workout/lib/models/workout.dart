class Workout {
  late String id;
  late String name;
  late String image;
  late int weekDay;

  Workout([this.id = '', this.name = '', this.image = '', this.weekDay = 0]);

  Workout.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        weekDay = json['weekDay'] as int;

  Map<String, dynamic> toJson() =>
      {'name': name, 'image': image, 'weekDay': weekDay};
}
