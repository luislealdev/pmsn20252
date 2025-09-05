import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:pmsn20252/utils/value_listener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        changePage(value);
      }
    });
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor =
        colors[currentPage].computeLuminance() < 0.5
            ? Colors.white
            : Colors.black;

    // Color más visible para los íconos no seleccionados en el bottom bar
    final Color unselectedIconColor = Colors.grey[600]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GoogleApp'),
        backgroundColor: colors[currentPage],
        foregroundColor: unselectedColor,
        elevation: 0,
        actions: [
          ValueListenableBuilder(
            valueListenable: ValueListener.isDark,
            builder: (context, value, _) {
              return value
                  ? IconButton(
                    icon: Icon(Icons.wb_sunny),
                    onPressed: () {
                      ValueListener.isDark.value = false;
                    },
                  )
                  : IconButton(
                    icon: Icon(Icons.nightlight),
                    onPressed: () {
                      ValueListener.isDark.value = true;
                    },
                  );
            },
          ),
        ],
        // leading: Container(),
      ),
      body: BottomBar(
        fit: StackFit.expand,
        icon:
            (width, height) => Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: unselectedColor,
                  size: width,
                ),
              ),
            ),
        borderRadius: BorderRadius.circular(500),
        duration: Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        barColor:
            colors[currentPage].computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
        start: 2,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 35,
        iconWidth: 35,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        respectSafeArea: true,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body:
            (context, controller) => TabBarView(
              controller: tabController,
              dragStartBehavior: DragStartBehavior.down,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildPageContent(controller, 0, "Inicio", Icons.home),
                _buildPageContent(controller, 1, "Buscar", Icons.search),
                _buildPageContent(controller, 2, "Agregar", Icons.add),
                _buildPageContent(controller, 3, "Favoritos", Icons.favorite),
                _buildPageContent(
                  controller,
                  4,
                  "Configuración",
                  Icons.settings,
                ),
              ],
            ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: tabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: colors[currentPage], width: 4),
            insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
          ),
          tabs: [
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                child: Icon(
                  Icons.home,
                  color: currentPage == 0 ? colors[0] : unselectedIconColor,
                ),
              ),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                child: Icon(
                  Icons.search,
                  color: currentPage == 1 ? colors[1] : unselectedIconColor,
                ),
              ),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: currentPage == 2 ? colors[2] : unselectedIconColor,
                ),
              ),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                child: Icon(
                  Icons.favorite,
                  color: currentPage == 3 ? colors[3] : unselectedIconColor,
                ),
              ),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                child: Icon(
                  Icons.settings,
                  color: currentPage == 4 ? colors[4] : unselectedIconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(
    ScrollController controller,
    int index,
    String title,
    IconData icon,
  ) {
    return Container(
      color: colors[index].withOpacity(0.1),
      child: ListView.builder(
        controller: controller,
        itemCount: 20,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, itemIndex) {
          if (itemIndex == 0) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Icon(icon, size: 80, color: colors[index]),
                  SizedBox(height: 16),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: colors[index],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bienvenido a la sección de $title',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  Divider(height: 40),
                ],
              ),
            );
          }

          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colors[index],
                child: Text(
                  '${itemIndex}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text('Elemento $itemIndex'),
              subtitle: Text('Descripción del elemento en $title'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: colors[index],
                size: 16,
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Seleccionaste el elemento $itemIndex en $title',
                    ),
                    backgroundColor: colors[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
