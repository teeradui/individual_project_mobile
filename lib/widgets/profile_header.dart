import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        children: [

          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage("assets/profile.jpg"),
          ),

          const SizedBox(height: 10),

          const Text(
            "tdytdui",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),

          const Text(
            "@tdytdui",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [

              ProfileStat("445", "Following"),
              SizedBox(width: 25),
              ProfileStat("22", "Followers"),
              SizedBox(width: 25),
              ProfileStat("107", "Likes"),
            ],
          ),

          const SizedBox(height: 10),

          const Text("THT"),
        ],
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {

  final String number;
  final String label;

  const ProfileStat(this.number, this.label, {super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Text(
          number,
          style: const TextStyle(
              fontWeight: FontWeight.bold),
        ),

        Text(
          label,
          style: const TextStyle(
              color: Colors.grey),
        ),
      ],
    );
  }
}