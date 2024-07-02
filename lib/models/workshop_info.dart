import 'package:flutter/foundation.dart';

import './owner_info.dart';
import './service_history.dart';

class WorkshopInfo with ChangeNotifier {
  int id;
  String name;
  String email;
  String phone;
  String state;
  String city;
  OwnerInfo workshopOwner;

  late List<String> ratingDescription;
  late List<int> ratingStars;
  late List<ServiceHistory> serviceHistory;

  Map<String, bool> electricalRepairs;
  Map<String, bool> mechanicalRepairs;
  Map<String, bool>? dentingPaintingServices;
  Map<String, bool>? tireServices;

  //constructor
  WorkshopInfo({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.state,
    required this.city,
    required this.ratingDescription,
    required this.ratingStars,
    required this.serviceHistory,
    required this.workshopOwner,
    Map<String, bool>? electricalRepairs,
    Map<String, bool>? mechanicalRepairs,
    Map<String, bool>? dentingPaintingServices,
    Map<String, bool>? tireServices,
  })  : electricalRepairs = electricalRepairs ??
            {
              "Lights": false,
              "AC": false,
              "Multimedia": false,
              "Battery": false,
              "Starter Motor": false,
              "Alternator": false,
              "Ignition System": false,
              "Power Windows and Locks": false,
              "Power Seats": false,
              "Electrical Wiring": false,
              "Sensors": false,
              "ECU (Engine Control Unit) Diagnostics": false,
              "Fuse Box and Fuses": false,
              "Lighting Control Module": false,
              "Instrument Cluster": false,
              "Horn": false,
              "Power Steering": false,
              "Central Locking System": false,
              "Cruise Control": false,
              "Security and Alarm Systems": false,
              "Communication Systems": false,
              "Heated Seats and Mirrors": false,
            },
        mechanicalRepairs = mechanicalRepairs ??
            {
              "Engine Oil": false,
              "Engine Repairs": false,
              "Brakes": false,
              "Transmission Services": false,
              "Exhaust System": false,
              "Suspension System": false,
              "Steering System": false,
              "Clutch System": false,
              "Fuel System": false,
              "Cooling System": false,
              "Timing Belt/Chain Replacement": false,
              "Drive Belts and Chains": false,
              "Engine Overhaul": false,
              "Fuel Injection System": false,
              "Air Intake System": false,
              "Throttle Body": false,
              "Engine Mounts": false,
              "Gaskets and Seals": false,
              "Powertrain Services": false,
              "Differential Services": false,
              "CV Joints and Boots": false,
              "Wheel Bearings": false,
              "Axle and Drivetrain Services": false,
            },
        dentingPaintingServices = dentingPaintingServices ??
            {
              "Dent Removal": false,
              "Painting (Full or Partial)": false,
              "Vehicle Wrapping": false,
              "Paintwork Touch-ups": false,
              "Collision Repairs": false,
              "Paint Protection Film (PPF) Installation": false,
              "Custom Paint Jobs": false,
              "Scratch Repairs": false,
              "Rust Repairs": false,
              "Clear Coat Application": false,
              "Panel Replacement": false,
              "Color Matching": false,
              "Surface Preparation": false,
              "Clear Bra Installation (Transparent paint protection)": false,
              "Paint Polishing and Buffing": false,
              "Weather Damage Repairs": false,
              "Hail Damage Repairs": false,
              "Headlight Restoration (if part of the painting services)": false,
              "Detailing Before/After Painting": false,
              "Custom Graphics": false,
            },
        tireServices = tireServices ??
            {
              "Tire Installation": false,
              "Tire Balancing": false,
              "Wheel Alignment": false,
              "Tire Repairs (Puncture repairs)": false,
              "Tire Rotation": false,
              "Tire Inspection": false,
              "Tire Replacement": false,
              "Tire Pressure Checks": false,
              "Flat Tire Repair": false,
              "Tire Mounting": false,
              "Tire Disposal": false,
              "TPMS (Tire Pressure Monitoring System) Inspection and Service":
                  false,
              "Wheel Rim Inspection and Repairs": false,
              "Tire Inflation Services": false,
              "Tire Sales (New and Used)": false,
              "Seasonal Tire Swapping": false,
              "Run-Flat Tire Services": false,
              "Tire Tread Depth Measurement": false,
              "Tire Pressure Monitoring System (TPMS) Replacement": false,
              "Nitrogen Inflation Services": false,
              "Tire Storage Services": false,
              "Performance Tire Upgrades": false,
              "Custom Tire and Wheel Packages": false,
            };
}
