import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  const ResponseDialog({
    this.title = "",
    Key? key,
    this.message = "",
    this.icon,
    this.buttonText = 'Ok',
    this.colorIcon = Colors.black,
  }) : super(key: key);

  final String title;
  final String message;
  final String buttonText;
  final IconData? icon;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Visibility(
        child: Text(title),
        visible: title.isNotEmpty,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Icon(
                icon,
                size: 64,
                color: colorIcon,
              ),
            ),
            visible: icon != null,
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            visible: message.isNotEmpty,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(buttonText),
        ),
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog(
    this.message, {
    this.title = 'Success',
    this.icon = Icons.done,
    Key? key,
  }) : super(key: key);
  final String title;
  final String message;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.green,
    );
  }
}

class FailureDialog extends StatelessWidget {
  const FailureDialog(
    this.message, {
    this.title = 'Failure',
    this.icon = Icons.warning,
    Key? key,
  }) : super(key: key);

  final String title;
  final String message;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.red,
    );
  }
}
