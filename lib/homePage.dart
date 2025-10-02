import 'package:flutter/material.dart';
import 'dummy_menu.dart';
import 'foodDetail.dart';


class homePage extends StatelessWidget {
  final String username;
  const homePage({super.key, required this.username, });
  

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.location_on, color: Color.fromARGB(255, 83, 83, 83)),
              SizedBox(width: 4),
              Text(
                'Yogyakarta',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGreetingHeader(String username) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 8.0,
        bottom: 20.0,
      ),
      child: Text(
        'Selamat datang, $username 👋',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              offset: Offset(1, 1)
            ),
          ],
        ),
        child: const TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Cari',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableFood(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.8,
        ),
        itemCount: foodMenuList.length > 19 ? 19 :foodMenuList.length,
        itemBuilder: (context, index) {
            final daftar = foodMenuList[index];
            return GestureDetector(
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodDetail(username: username, daftar: daftar),
                ),
                );
            },
            child: Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        daftar. imageUrls[0],
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                        height: 120,
                        color: const Color.fromRGBO(224, 224, 224, 1),
                        child: const Center(
                            child: Icon(Icons.broken_image, color: Colors.grey)),
                        ),
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            daftar.name,
                            style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                        ),

                        Text(
                          daftar.price,
                          style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 20),

                        Align(
                            alignment: AlignmentGeometry.centerRight,
                            child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 224, 224),
                            borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                            daftar.category, 
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                            ),
                            ),
                        ),
                        ),
                        ],
                    ),
                    ),
                ],
                ),
            ),
            );
        },
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTopBar(),
              _buildGreetingHeader(username),
              _buildSearchBar(),
              _buildAvailableFood(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
