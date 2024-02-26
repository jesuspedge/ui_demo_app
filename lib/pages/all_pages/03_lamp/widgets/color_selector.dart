import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorSelector extends StatefulWidget {
  final ValueChanged<Color> onColorSelected;
  final Color initialColor;
  const ColorSelector({
    super.key,
    required this.onColorSelected,
    required this.initialColor,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color selectedColor;

  @override
  void initState() {
    selectedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAdaptiveDialog(
            context: context,
            builder: (context) {
              return AlertDialog.adaptive(
                backgroundColor: Colors.white.withOpacity(0.5),
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                title: const Text(
                  'Select a color',
                  style: TextStyle(color: Colors.black),
                ),
                content: MaterialColorPicker(
                  onColorChange: (value) {
                    setState(() => selectedColor = value);
                    widget.onColorSelected(selectedColor);
                  },
                  selectedColor: selectedColor,
                  allowShades: true,
                  alignment: WrapAlignment.center,
                ),
              );
            });
      },
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedColor,
              border:
                  Border.all(color: Colors.white.withOpacity(0.7), width: 2),
            ),
          ),
          Text(
            '  Select a color',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
