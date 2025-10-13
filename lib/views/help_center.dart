import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  // Contact card widget
  Widget contactCard({
    required IconData icon,
    required String title,
    required String info,
  }) {
    return Container(
      width: 160,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.lightBlueAccent, width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(info, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // Social media row widget
  Widget socialMediaRow({
    required String imagePath,
    required String name,
    required String username,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 70, // increased height for name + username
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.lightBlue, width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                username,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 234, 234),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.blueAccent),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Help Center",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 45),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "You can get in touch with us through below platforms.",
              ),
              const SizedBox(height: 5),
              const Text(
                "Our team will reach out to you as soon as possible.",
              ),
              const SizedBox(height: 20),

              // Customer Support
              const Text(
                "Customer Support",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contactCard(
                    icon: Icons.phone_in_talk,
                    title: "Contact Number",
                    info: "+855 97 967 9172",
                  ),
                  contactCard(
                    icon: Icons.email_outlined,
                    title: "Email Address",
                    info: "pamminji@gmail.com",
                  ),
                ],
              ),

              const SizedBox(height: 25),
              const Text(
                "Social Media",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              socialMediaRow(
                  imagePath: "assets/images/facebook.png",
                  name: "Facebook",
                  username: "Minji pamme"),
              socialMediaRow(
                  imagePath: "assets/images/telegramm.png",
                  name: "Telegram",
                  username: "@Pamm_mini"),
              socialMediaRow(
                  imagePath: "assets/images/instagram.png",
                  name: "Instagram",
                  username: "@MP_nipam"),
            ],
          ),
        ),
      ),
    );
  }
}
