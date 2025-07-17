import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EveryXDaysField extends StatefulWidget {
  final TextEditingController controller;

  const EveryXDaysField({
    super.key,
    required this.controller,
  });

  @override
  State<EveryXDaysField> createState() => _EveryXDaysFieldState();
}

class _EveryXDaysFieldState extends State<EveryXDaysField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);

    if (widget.controller.text.isEmpty) {
      widget.controller.text = '1';
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _validateAndSetDefault() {
    final text = widget.controller.text;
    final int? parsedValue = int.tryParse(text);

    if (parsedValue == null || parsedValue <= 0) {
      widget.controller.text = '1';
      widget.controller.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.controller.text.length),
      );
    }
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _validateAndSetDefault();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: const InputDecoration(
        labelText: 'Every how many days?',
      ),
      onChanged: (text) {
        if (text == '0') {
        }
      },
      onEditingComplete: () {
        _validateAndSetDefault();
        FocusScope.of(context).unfocus();
      },
    );
  }
}
