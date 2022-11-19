import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';

const transitionDuration = Duration(milliseconds: 150);

class Option extends StatelessWidget {
  final bool selected;
  final String optionLabel; // i.e a,b,c,d
  final String optionValue;
  final void Function()? onSelect;

  const Option({
    Key? key,
    this.selected = false,
    this.optionLabel = '',
    this.optionValue = '',
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onSelect,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AnimatedContainer(
              duration: transitionDuration,
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: selected ? myColors['prim'] : const Color(0xFFDFE1E4),
                  borderRadius: BorderRadius.circular(30)),
              child: AnimatedDefaultTextStyle(
                duration: transitionDuration,
                style: TextStyle(
                  color: selected ? myColors['white'] : const Color(0xFF697179),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                child: Text(
                  optionLabel.toUpperCase(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AnimatedContainer(
                duration: transitionDuration,
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? myColors['prim'] : myColors['white'],
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: selected
                          ? myColors['prim'] ?? const Color(0x00000000)
                          : const Color(0xFF7E8F9F),
                      width: 1),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0x33abaeb0),
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: AnimatedDefaultTextStyle(
                  duration: transitionDuration,
                  style: TextStyle(
                    color:
                        selected ? myColors['white'] : const Color(0xFF22262D),
                    fontSize: 16,
                  ),
                  child: Text(
                    optionValue,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
