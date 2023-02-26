import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final buttonText;
  final onpressed;

  const ReusableButton(this.buttonText, this.onpressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                  width: double.infinity, height: 50),
              child: ElevatedButton(
                child: buttonText,
                style: ButtonStyle(
                    //  foregroundColor: MaterialStateProperty.all(Colors.blue.shade800),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF1F66D0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            side: const BorderSide(color: Colors.blue)))),
                onPressed: onpressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
