import 'package:flutter/material.dart';

class FilterDropdown extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onChanged;

  const FilterDropdown({Key? key, required this.selectedFilter, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedFilter,
      items: ['Activos', 'Futuros', 'Pasados'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
    );
  }
}
