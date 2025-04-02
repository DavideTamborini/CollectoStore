part of 'store_page.dart';

class AppBarStore extends StatelessWidget implements PreferredSizeWidget {
  const AppBarStore({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(preferredSize: preferredSize, child: AppBar(
      backgroundColor: Colors.blueGrey[900],
      flexibleSpace: Center(
        child: Image.network(
          'https://collectoapp.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo.25b770d8.png&w=384&q=75',
          fit: BoxFit.contain,
          color: Colors.white,
          height: 24,
        ),
      ),
      bottom: TabBar(
        unselectedLabelColor: Colors.white,
        labelColor: Colors.white,
        labelStyle: Get.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        indicatorColor: Colors.greenAccent,
        tabs: [
          Tab(text: 'New Items'.tr),
          Tab(text: 'Marketplace'.tr),
          Tab(text: 'Sold Items'.tr),
        ],
      ),
    ),);
  }
}
