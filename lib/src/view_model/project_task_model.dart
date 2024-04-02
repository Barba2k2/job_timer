// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectTaskModel {
  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });
  
  int? id;
  String name;
  int duration;
}
