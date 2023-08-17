import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileCompletenessCard extends StatelessWidget {
  final double percentage;

  const ProfileCompletenessCard({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Profile Completeness',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircularPercentIndicator(
                          radius: 20,
                          lineWidth: 4.0,
                          percent: percentage / 100,
                          center: Text(
                            "${percentage.toInt()}%",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          progressColor: Colors.greenAccent,
                        ),
                        const Text(
                          'Update KYC information to \ncomplete your profile',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF39656B),
                      ),
                      onPressed: () {},
                      child: const Text('Complete Profile'),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'images/assets/profile_completeness.png',
                width: 100,
                height: 91,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
