import 'package:flutter/material.dart';
import 'widgets/profile_header.dart';
import 'widgets/video_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  int getColumns(double width) {
    if (width < 600) return 3;
    if (width < 1100) return 4;
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = getColumns(width);

    if (width < 600) return mobileLayout(columns);
    if (width < 1100) return tabletLayout(columns);
    return webLayout(columns);
  }

  // ---------------- MOBILE ----------------

  Widget mobileLayout(int columns) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Shop",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              const ProfileTabs(),
              VideoGrid(columns: columns),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- TABLET ----------------

  Widget tabletLayout(int columns) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Shop",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              const ProfileTabs(),
              VideoGrid(columns: columns),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- WEB ----------------

  Widget webLayout(int columns) {
    return Scaffold(
      body: Row(
        children: [
          // SIDEBAR
          Container(
            width: 240,
            color: Colors.white,
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/tiktok_logo.png",
                        width: 28,
                        height: 28,
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        "TikTok",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const SidebarItem(Icons.home_filled, "For You"),
                const SidebarItem(Icons.explore, "Explore"),
                const SidebarItem(Icons.adjust, "Following"),
                const SidebarItem(Icons.people_outline, "Friends"),
                const SidebarItem(Icons.live_tv_outlined, "LIVE"),
                const SidebarItem(Icons.send_outlined, "Messages"),
                const SidebarItem(Icons.notifications, "Activity"),
                const SidebarItem(Icons.upload, "Upload"),
                const SidebarItem(Icons.person, "Profile", active: true),
                const SidebarItem(Icons.more_horiz, "More"),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 1100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileHeader(),

                      const SizedBox(height: 20),

                      const ProfileTabs(),

                      const SizedBox(height: 20),

                      VideoGrid(columns: columns),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;

  const SidebarItem(this.icon, this.title, {this.active = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: active ? Colors.red : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: active ? Colors.red : Colors.black,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(Icons.grid_view),
        Icon(Icons.lock_outline),
        Icon(Icons.repeat),
        Icon(Icons.bookmark_border),
        Icon(Icons.favorite_border),
      ],
    );
  }
}
