import 'package:flutter/material.dart';
import 'package:app_come/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? tabController;

  CustomAppBar({this.tabController});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + kTextTabBarHeight + 500),
      child: AppBar(
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: tabController,
          tabs: [
            CustomTab(icon: Icons.home, title: 'Tendencia', isSelected: tabController?.index == 0),
            CustomTab(icon: Icons.money, title: 'Precios bajos', isSelected: tabController?.index == 1),
            CustomTab(icon: Icons.location_on, title: 'Cerca', isSelected: tabController?.index == 2),
            CustomTab(icon: Icons.apps, title: 'Otros', isSelected: tabController?.index == 3),
          ],
        ),
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Acción al presionar el botón de menú
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Acción al presionar el botón de ubicación
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.btnWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                onPrimary: AppColors.titleColor, // Esto establecerá el color del icono y el texto
              ),
              icon: Icon(
                Icons.location_on,
                weight: 15,
                color: Colors.red, // Establecer el color del icono aquí
              ),
              label: Text('Ubicación'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Acción al presionar el botón de notificaciones
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}

class CustomTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const CustomTab({
    required this.icon,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: isSelected ? Colors.red : Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.red : Colors.grey,
              size: 24.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            title,
            style: TextStyle(color: isSelected ? Colors.red : Colors.grey),
          ),
        ],
      ),
    );
  }
}
