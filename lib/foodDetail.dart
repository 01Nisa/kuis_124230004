import 'package:flutter/material.dart';
import 'package:kuis_124230004/homePage.dart';
import 'dummy_menu.dart';

class FoodDetail extends StatefulWidget {
  final FoodMenu daftar;
  final String username;
  const FoodDetail({super.key, required this.daftar, required this.username,
  });

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool isLiked = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.daftar.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.grey[700],
              size: 28,
            ),
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isLiked
                        ? 'Ditambahkan ke Favorit ❤️'
                        : 'Dihapus dari Favorit 🤍',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.daftar.imageUrls[0],
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 220,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 60, color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.daftar.description,
              style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 213, 213, 213),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSpecRow(
                    "Price", 
                    Text(
                      widget.daftar.price,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),

                  _buildSpecRow(
                    "Cooking Time", 
                    Text(
                      widget.daftar.cookingTime,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),

                  _buildSpecRow(
                    "Category", 
                    Text(
                      widget.daftar.category,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            _beli(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(String label, Widget content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
          Flexible(
            child: content, 
          ),
        ],
      ),
    );
  }

  Widget _beli() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          {
            text = "Kamu Berhasil Membeli ${widget.daftar.name}";
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => homePage(username: widget.username),
              ),
            );
          }
          SnackBar snack = SnackBar(
            content: Text(text),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          'Beli',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
