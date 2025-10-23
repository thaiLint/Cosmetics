// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cosmetics/model/gride_home.dart';
// import 'package:cosmetics/views/detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class SearchScreen extends StatefulWidget {
//   // final String keyword;
//   SearchScreen({
//     super.key,
//   });

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     List<GrideHome> filter = show
//         .where((e) =>
//             e.title.toLowerCase().contains(searchController.text.toLowerCase()))
//         .toList();
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 244, 232, 242),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade300,
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: TextField(
//                         controller: searchController,
//                         decoration: InputDecoration(
//                           contentPadding:
//                               const EdgeInsets.symmetric(vertical: 15),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(18),
//                               borderSide: BorderSide.none),
//                           prefixIcon: const Icon(Icons.search_outlined),

//                           hintText: "Search product",fillColor: Color.fromARGB(10, 7, 16, 45),
//                         ),onChanged: (show) {
//                           setState(() {
//                           });

//                           hintText: "Search product",
//                         ),
//                         onChanged: (show) {
//                           setState(() {});
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Container(
//                     height: 50,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.token_outlined),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2),
//                   itemCount: filter.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: InkWell(
//                         onTap: () {
//                           // Get.to(
//                           //     DetailScreen(shows: filter[index]));
//                         },
//                         child: Container(
//                           width: double.infinity,
//                           height: 170,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: const Color.fromARGB(255, 244, 237, 237),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black12,
//                                 blurRadius: 6,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(15),
//                                 ),
//                                 child: Image.asset(
//                                   filter[index].img,
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 8.0,
//                                   vertical: 6,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       filter[index].title,
//                                       style: TextStyle(
//                                         color: const Color.fromARGB(
//                                             255, 84, 53, 53),
//                                         fontSize: 12,
//                                       ),
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     // Text(
//                                     //   filter[index].subtitle,
//                                     //   style: TextStyle(
//                                     //     fontSize: 16,
//                                     //     fontWeight: FontWeight.bold,
//                                     //   ),
//                                     //   overflow: TextOverflow.ellipsis,
//                                     // ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             "\$${filter[index].price.toStringAsFixed(2)}" +
//                                                 "USD",
//                                             style: TextStyle(fontSize: 12),
//                                           ),
//                                           Spacer(),
//                                           //link to detail page
//                                           // InkWell(
//                                           //   onTap: () {
//                                           //     Get.to(
//                                           //         DetailScreen(shows: filter[index]));
//                                           //   },
//                                           //   child: Container(
//                                           //     width: 30,
//                                           //     height: 30,
//                                           //     decoration: BoxDecoration(
//                                           //       borderRadius: BorderRadius.circular(
//                                           //         20,
//                                           //       ),
//                                           //       color: const Color.fromARGB(
//                                           //         255,
//                                           //         0,
//                                           //         0,
//                                           //         0,
//                                           //       ),
//                                           //     ),
//                                           //     child: Icon(
//                                           //       Icons.add,
//                                           //       color: Colors.white,
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       // InkWell(
//                       //   onTap: () {
//                       //     Get.to(
//                       //         DetailScreen(shows: filter[index]));
//                       //   },
//                       //   child: Container(
//                       //     color: Colors.grey.shade200,
//                       //     width: double.infinity,
//                       //     // height: 100,
//                       //     child: Column(
//                       //       children: [

//                       //         Image.asset(filter[index].img,height: 50,width: 50,fit: BoxFit.cover,),
//                       //         Text(filter[index].title,style: TextStyle(fontSize: 14),),
//                       //         Text("\$${filter[index].price.toStringAsFixed(2)}"+"USD",
//                       //                     style: TextStyle(fontSize: 14),
//                       //                   ),

//                       //       ],
//                       //     ),

//                       //     ),
//                       // ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//   }
// }
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<String> recentSearches = [
    "Body lotion",
    "Serum",
    "Shampoo",
    "Blush",
    "Perfume"
  ];
  List<Map<String, dynamic>> allProducts = [
    {"name": "Body Only Wash", "price": 18.0, "image": "https://via.placeholder.com/150"},
    {"name": "Rose Kit", "price": 16.0, "image": "https://via.placeholder.com/150"},
  ];

  List<Map<String, dynamic>> searchResults = [];
  bool isSearching = false;
  bool searchDone = false;

  void _onSearch(String query) {
    setState(() {
      isSearching = true;
      searchDone = true;

      searchResults = allProducts
          .where((p) =>
              p["name"].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search...",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                    searchDone = false;
                    searchResults.clear();
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
      onSubmitted: _onSearch,
    );
  }

  Widget _buildBody() {
    if (!searchDone) {
      // Show recent searches
      return _buildRecentSearches();
    } else if (searchResults.isEmpty) {
      // Show "Not Found"
      return _buildNotFound();
    } else {
      // Show results
      return _buildResults();
    }
  }

  Widget _buildRecentSearches() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Recent", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: recentSearches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recentSearches[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    onPressed: () {
                      setState(() {
                        recentSearches.removeAt(index);
                      });
                    },
                  ),
                  onTap: () => _onSearch(recentSearches[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotFound() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 100, color: Colors.pink.shade200),
            const SizedBox(height: 20),
            const Text(
              "Not Found",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Sorry, the product you searched for was not found.\nPlease try again with other terms.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final product = searchResults[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(product["image"], width: 60, height: 60, fit: BoxFit.cover),
            ),
            title: Text(product["name"]),
            subtitle: Text("\$${product["price"]}"),
            onTap: () {},
          ),
        );
      },
    );
  }
}
