import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strike_pad/bloc/cubits/primary_color_cubit.dart';

class ColorPickerDialog extends StatelessWidget {
  ColorPickerDialog({Key? key}) : super(key: key);

  final List<MaterialColor> colors = [...Colors.primaries]
    ..sort((c1, c2) => c1.alpha.compareTo(c2.alpha));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: BlocBuilder<PrimaryColorCubit, Color>(
        builder: (context, primaryColor) {
          return Wrap(
            // spacing: 8,
            runSpacing: 8, alignment: WrapAlignment.center,
            children: colors.map(
              (color) {
                return MaterialButton(
                  minWidth: 1,
                  shape: const CircleBorder(),
                  color: color,
                  onPressed: () =>
                      context.read<PrimaryColorCubit>().setColor(color),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(
                      primaryColor == color ? Icons.check : null,
                      size: 36,
                      color: ColorScheme.fromSwatch(primarySwatch: color)
                          .onPrimary,
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
      actions: [
        TextButton(
          child: const Text(
            'Close',
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
