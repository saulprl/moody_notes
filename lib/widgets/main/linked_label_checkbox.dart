import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LinkedLabelCheckbox extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final bool value;
  final Color color;
  final ValueChanged<bool> onChanged;
  final void Function(String args)? onTap;

  const LinkedLabelCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.color,
    required this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            offset: const Offset(2.0, 2.5),
            blurRadius: 3.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  decoration: onTap != null ? TextDecoration.underline : null,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = onTap != null
                      ? () {
                          onTap!(label);
                        }
                      : null,
              ),
            ),
          ),
          Checkbox(
            value: value,
            onChanged: (newValue) {
              onChanged(newValue!);
            },
            activeColor: Colors.white,
            checkColor: color,
          )
        ],
      ),
    );
  }
}
