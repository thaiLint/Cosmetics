import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cosmetics/model/gride_home.dart';
import 'package:cosmetics/views/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool searchDone = false;

  @override
  Widget build(BuildContext context) {
    // Filter GrideHome list using search input
    List<GrideHome> filteredList = show
        .where((e) => e.title
            .toLowerCase()
            .contains(_searchController.text.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: _buildSearchBar(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _buildBody(filteredList),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search product...",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                    searchDone = false;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      textInputAction: TextInputAction.search,
      onChanged: (value) => setState(() {
        searchDone = value.isNotEmpty;
      }),
    );
  }

  Widget _buildBody(List<GrideHome> filteredList) {
    if (!searchDone) {
      return _buildRecentSearches();
    } else if (filteredList.isEmpty) {
      return _buildNotFound();
    } else {
      return _buildResults(filteredList);
    }
  }

  Widget _buildRecentSearches() {
    final recent = ["Body lotion", "Serum", "Shampoo", "Blush", "Perfume"];
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: recent.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.history),
          title: Text(recent[index]),
          onTap: () {
            _searchController.text = recent[index];
            setState(() {
              searchDone = true;
            });
          },
        );
      },
    );
  }

  Widget _buildNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 100, color: Colors.pink.shade200),
          const SizedBox(height: 20),
          const Text(
            "No results found",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text("Try another keyword"),
        ],
      ),
    );
  }

  Widget _buildResults(List<GrideHome> filteredList) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final item = filteredList[index];
        return InkWell(
          onTap: () => Get.to(() => DetailScreen(shows: item)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 250, 240, 245),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    item.img,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Column(
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${item.price.toStringAsFixed(2)} USD",
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
