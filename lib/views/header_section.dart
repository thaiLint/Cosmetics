import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location and icons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Location section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Location",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.pink, size: 20),
                      SizedBox(width: 4),
                      Text(
                        "Phnom Penh",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 20),
                    ],
                  ),
                ],
              ),

              // Cart and notification
              Row(
                children: const [
                  _IconWithBadge(icon: Icons.shopping_cart),
                  SizedBox(width: 10),
                  _IconWithBadge(icon: Icons.notifications_none),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.tune, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    
  }
}

class _IconWithBadge extends StatelessWidget {
  final IconData icon;
  const _IconWithBadge({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black87, size: 20),
        ),
        Positioned(
          right: -2,
          top: -2,
          child: Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: Colors.pink[200],
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "0",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
