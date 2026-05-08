import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/nursing_model.dart';

class HomeNursingController extends GetxController {
  final isLoading       = false.obs;
  final selectedTab     = 0.obs;

  final services = <NursingServiceModel>[
    NursingServiceModel(
      id: '1', name: 'Nursing Care',
      description: 'Professional bedside nursing for post-surgery and chronic illness patients.',
      icon: 'nursing', color: 0xFF2980B9,
      pricePerVisit: 1500, duration: '1-2 hours',
      includes: ['Vitals monitoring', 'Medication administration', 'Patient assessment', 'Progress report'],
    ),
    NursingServiceModel(
      id: '2', name: 'Elderly Care',
      description: 'Compassionate daily care and companionship for senior citizens at home.',
      icon: 'elderly', color: 0xFF9B59B6,
      pricePerVisit: 1200, duration: '2-4 hours',
      includes: ['Daily hygiene', 'Medication reminders', 'Mobility assistance', 'Companionship'],
    ),
    NursingServiceModel(
      id: '3', name: 'Mother & Baby Care',
      description: 'Postnatal care for new mothers and newborn health monitoring.',
      icon: 'child_care', color: 0xFFE67E22,
      pricePerVisit: 1800, duration: '1-2 hours',
      includes: ['Newborn assessment', 'Breastfeeding support', 'Maternal recovery', 'Baby bathing'],
    ),
    NursingServiceModel(
      id: '4', name: 'Wound Care',
      description: 'Sterile dressing changes and wound management by trained nurses.',
      icon: 'healing', color: 0xFFE74C3C,
      pricePerVisit: 800, duration: '30-60 min',
      includes: ['Wound cleaning', 'Sterile dressing', 'Infection check', 'Doctor liaison'],
    ),
    NursingServiceModel(
      id: '5', name: 'Injections & IV',
      description: 'Safe IV drip setup and intramuscular/subcutaneous injections at home.',
      icon: 'vaccines', color: 0xFF27AE60,
      pricePerVisit: 600, duration: '20-45 min',
      includes: ['IV cannula insertion', 'Drip administration', 'IM/SC injections', 'Safe disposal'],
    ),
    NursingServiceModel(
      id: '6', name: 'Physiotherapy',
      description: 'Rehabilitation exercises and physical therapy sessions at your doorstep.',
      icon: 'accessibility_new', color: 0xFF16A085,
      pricePerVisit: 2000, duration: '45-60 min',
      includes: ['Mobility exercises', 'Pain management', 'Stroke rehab', 'Post-fracture care'],
    ),
    NursingServiceModel(
      id: '7', name: 'Patient Care',
      description: 'Round-the-clock patient monitoring and support for critical recovery.',
      icon: 'personal_injury', color: 0xFF8E44AD,
      pricePerVisit: 3000, duration: '8-12 hours',
      includes: ['Continuous monitoring', 'Emergency response', 'Family updates', 'Medication schedule'],
    ),
  ].obs;

  final nurses = <NurseModel>[
    NurseModel(
      id: '1', name: 'Nurse Fatima Bibi',
      qualification: 'BSc Nursing', experience: '6 years',
      image: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=200&h=200&fit=crop',
      rating: 4.9, patients: 312,
      specializations: ['Elderly Care', 'Wound Care', 'Nursing Care'],
    ),
    NurseModel(
      id: '2', name: 'Nurse Sana Gul',
      qualification: 'Diploma in Nursing', experience: '4 years',
      image: 'https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=200&h=200&fit=crop',
      rating: 4.7, patients: 198,
      specializations: ['Mother & Baby', 'Patient Care', 'Injections'],
    ),
    NurseModel(
      id: '3', name: 'Nurse Rukhsana Khan',
      qualification: 'BSc Nursing', experience: '8 years',
      image: 'https://images.unsplash.com/photo-1651008376811-b90baee60c1f?w=200&h=200&fit=crop',
      rating: 4.8, patients: 445,
      specializations: ['Physiotherapy', 'Post-surgery Care', 'Wound Care'],
    ),
    NurseModel(
      id: '4', name: 'Nurse Ayesha Naz',
      qualification: 'MSc Nursing', experience: '10 years',
      image: 'https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=200&h=200&fit=crop',
      rating: 5.0, patients: 620,
      specializations: ['Critical Care', 'IV Therapy', 'Elderly Care'],
    ),
  ].obs;

  final selectedService = Rxn<NursingServiceModel>();
  final bookingDate     = Rxn<DateTime>();
  final bookingTime     = ''.obs;
  final patientName     = ''.obs;
  final patientAddress  = ''.obs;
  final notes           = ''.obs;
  final isBooking       = false.obs;

  void selectTab(int t) => selectedTab.value = t;

  void selectService(NursingServiceModel s) {
    selectedService.value = s;
    selectedTab.value = 2;
  }

  Future<void> submitBooking() async {
    isBooking.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isBooking.value = false;
    Get.snackbar(
      'Booking Confirmed',
      'A nurse will contact you shortly.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF27AE60),
      colorText: Colors.white,
    );
    selectedTab.value = 0;
  }
}