import 'package:flutter/material.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Settings",
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color.fromRGBO(30, 33, 63, .5),
                              size: 14.0,
                              semanticLabel: 'Close app settings',
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          child: const Icon(
            Icons.settings,
            color: Color.fromRGBO(215, 224, 255, 1),
            size: 28.0,
            semanticLabel: 'App settings',
          ),
        ),
      ],
    );
  }
}
