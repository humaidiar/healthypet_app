import 'package:healthypet_app/models/service_model.dart';

class DoctorModel {
  String name;
  String image;
  String description;
  List<String> services;
  int distance;

  DoctorModel(
      {required this.name,
      required this.image,
      required this.services,
      required this.distance,
      required this.description});
}

var doctorsList = [
  DoctorModel(
      name: "Zack Edward",
      image: "Zack.jpg",
      description:
          "Physicians examine patients; take medical histories; prescribe medications; and order, perform, and interpret diagnostic tests. They often counsel patients on diet, hygiene, and preventive healthcare.",
      services: [Service.vaccine, Service.surgery],
      distance: 10),
  DoctorModel(
      name: "Sacha Guildo",
      image: "Sacha.jpg",
      description:
          "Physicians examine patients; take medical histories; prescribe medications; and order, perform, and interpret diagnostic tests. They often counsel patients on diet, hygiene, and preventive healthcare.",
      services: [Service.dental, Service.consultation],
      distance: 10),
  DoctorModel(
      name: "Rina Efron",
      image: "Zack.jpg",
      description:
          "Physicians examine patients; take medical histories; prescribe medications; and order, perform, and interpret diagnostic tests. They often counsel patients on diet, hygiene, and preventive healthcare.",
      services: [Service.surgery, Service.consultation],
      distance: 10),
];
