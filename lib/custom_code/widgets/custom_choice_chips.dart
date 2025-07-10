// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomChoiceChips extends StatefulWidget {
  const CustomChoiceChips({
    super.key,
    this.width,
    this.height,
    required this.options,
    required this.labels,
    required this.onTapAction,
    this.initialValue,
  });

  final double? width;
  final double? height;
  final List<String> options;
  final List<String> labels;
  final Future Function() onTapAction;
  final String? initialValue;

  @override
  State<CustomChoiceChips> createState() => _CustomChoiceChipsState();
}

class _CustomChoiceChipsState extends State<CustomChoiceChips> {
  int? selectedIndex;
  @override
  void initState() {
    super.initState();
    // Set initial value if it's present
    if (widget.initialValue != null) {
      setState(() {
        selectedIndex = int.tryParse(widget.initialValue!);
        FFAppState().customChoiceChipSelection = selectedIndex.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width, // Setting width as per widget
      child: Wrap(
        spacing: 8.0, // Horizontal space between chips
        runSpacing: 4.0, // Vertical space between lines of chips
        children: List.generate(
          widget.options.length,
          (index) {
            if (widget.options[index].isEmpty) return const SizedBox.shrink();

            return ChoiceChip(
              label: Text(widget.labels[index]),
              selected: selectedIndex == int.tryParse(widget.options[index]),
              onSelected: (bool selected) {
                setState(() {
                  selectedIndex =
                      selected ? int.tryParse(widget.options[index]) : null;
                  FFAppState().customChoiceChipSelection =
                      selectedIndex.toString();
                  widget.onTapAction();
                });
              },
              labelStyle: TextStyle(
                color: selectedIndex == int.tryParse(widget.options[index])
                    ? Colors.white
                    : Colors.black,
              ),
              selectedColor: Theme.of(context)
                  .primaryColor, // Modify to preferred selected color
              backgroundColor:
                  Colors.grey[200], // Modify to preferred background color
            );
          },
        ),
      ),
    );
  }
}
