part of 'store_page.dart';

class StoreBottomNavigationBar extends StatelessWidget {
  const StoreBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: 'Marketplace'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.wallet_outlined),
          label: 'Collection'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications_outlined),
          label: 'Notification'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outline_rounded),
          label: 'Profile'.tr,
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) => (),
    );
  }
}
