import 'package:flutter/material.dart';

final List<String> carManufacturers = [
  'Audi',
  'Toyota',
  'Ford',
  'Honda',
  'Chevrolet',
  'BMW',
  'Mercedes-Benz',
];

final Map<String, List<String>> carModels = {
  'Audi': ['A3', 'A4', 'A6', 'Q3', 'Q5', 'Q7', 'Q8', 'R8', 'S4', 'S5', 'S6'],
  'Toyota': ['Corolla', 'Camry', 'Prius', 'RAV4', 'Highlander'],
  'Ford': ['F-150', 'Mustang', 'Explorer', 'Escape', 'Edge'],
  'Honda': ['Civic', 'Accord', 'CR-V', 'Pilot', 'HR-V'],
  'Chevrolet': ['Silverado', 'Equinox', 'Malibu', 'Traverse', 'Tahoe'],
  'BMW': ['3 Series', '5 Series', 'X3', 'X5', '7 Series'],
  'Mercedes-Benz': ['C-Class', 'E-Class', 'GLC', 'GLE', 'S-Class'],
};

final carManufacturersLogo = {
  'Audi': 'assets/images/audi_logo.png',
  'Toyota': 'assets/images/toyota-logo.png',
  'Ford': 'assets/images/ford-logo.png',
  'Honda': 'assets/images/honda-logo.png',
  'Chevrolet': 'assets/images/chevrolet-logo.png',
  'BMW': 'assets/images/BMW-logo.png',
  'Mercedes-Benz': 'assets/images/mercedes-benz.png',
};

final Map<String, Color> carColrs = {
  'Black': Colors.black,
  'White': Colors.white,
  'Red': Colors.red,
  'Green': Colors.green,
  'Blue': Colors.blue,
  'Yellow': Colors.yellow,
  'Purple': Colors.purple,
  'Orange': Colors.orange,
  'Pink': Colors.pink,
  'Brown': Colors.brown,
  'Grey': Colors.grey,
};

final Map<String, int> years = {
  '2024': 2024,
  '2023': 2023,
  '2022': 2022,
  '2021': 2021,
  '2020': 2020,
  '2019': 2019,
  '2018': 2018,
  '2017': 2017,
  '2016': 2016,
  '2015': 2015,
  '2014': 2014,
  '2013': 2013,
  '2012': 2012,
  '2011': 2011,
  '2010': 2010,
  '2009': 2009,
  '2008': 2008,
  '2007': 2007,
  '2006': 2006,
  '2005': 2005,
  '2004': 2004,
  '2003': 2003,
  '2002': 2002,
  '2001': 2001,
  '2000': 2000,
  '1999': 1999,
  '1998': 1998,
  '1997': 1997,
  '1996': 1996,
  '1995': 1995,
  '1994': 1994,
  '1993': 1993,
  '1992': 1992,
  '1991': 1991,
  '1990': 1990,
};
