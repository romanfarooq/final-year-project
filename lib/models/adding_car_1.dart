import 'package:flutter/foundation.dart';

import './selection_popup_model.dart';

class AddingCar1 with ChangeNotifier {
  final List<SelectionPopupModel> _manufacturerList = [
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ];

  get manufacturerList => _manufacturerList;

  void updateManufacturerList(int id) {
    for (var item in _manufacturerList) {
      if (item.id == id) {
        item.isSelected = true;
      } else {
        item.isSelected = false;
      }
    }
    notifyListeners();
  }

  final List<SelectionPopupModel> _modelList = [
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ];

  get modelList => _modelList;

  void updateModelList(int id) {
    for (var item in _modelList) {
      if (item.id == id) {
        item.isSelected = true;
      } else {
        item.isSelected = false;
      }
    }
    notifyListeners();
  }

  final List<SelectionPopupModel> _yearList = [
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ];

  get yearList => _yearList;

  void updateYearList(int id) {
    for (var item in _yearList) {
      if (item.id == id) {
        item.isSelected = true;
      } else {
        item.isSelected = false;
      }
    }
    notifyListeners();
  }

  final List<SelectionPopupModel> _colorList = [
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ];

  get colorList => _colorList;

  void updateColorList(int id) {
    for (var item in _colorList) {
      if (item.id == id) {
        item.isSelected = true;
      } else {
        item.isSelected = false;
      }
    }
    notifyListeners();
  }
}
