import 'package:cherrystreet/features/advisor/domain/entities/advisor_entity.dart';

class AdvisorModel extends AdvisorEntity {
  AdvisorModel({
    required super.id,
    required super.img,
    required super.advisorName,
    required super.speciality,
    required super.joinDate,
    required super.phoneNum,
    required super.location,
    required super.workMode,
    required super.experience,
    required super.advisorDescription,
  });

  factory AdvisorModel.fromJson(Map<String, dynamic> data) {
    return AdvisorModel(
      id: data['id'],
      img: data['img'],
      advisorName: data['advisorName'],
      speciality: data['speciality'],
      joinDate: data['joinDate'],
      phoneNum: data['phoneNum'],
      location: data['location'],
      workMode: data['workMode'],
      experience: data['experience'],
      advisorDescription: data['advisorDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img': img,
      'advisorName': advisorName,
      'speciality': speciality,
      'joinDate': joinDate,
      'phoneNum': phoneNum,
      'location': location,
      'workMode': workMode,
      'experience': experience,
      'advisorDescription': advisorDescription,
    };
  }
}
