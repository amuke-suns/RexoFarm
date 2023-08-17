import 'package:flutter/material.dart';

class ThirdPartySignUpWidget extends StatelessWidget {
  const ThirdPartySignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Third party sign up',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF767873),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 48,
          width: 358,
          child: Row(
            children: [
              Flexible(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle Facebook login
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFF3F4EE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/Google.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Google',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 110, 33, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle Google login
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFF3F4EE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(
                        left: 40, right: 34, top: 12, bottom: 12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/Facebook.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Facebook',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 110, 33, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
