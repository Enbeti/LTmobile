// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:bai_tap_lon/Widgets/ItemWidget.dart';
//
// import '../test.dart';
//
// class CatDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CatBreedsScreen(),
//     );
//   }
// }
// class CatBreedsScreen extends StatefulWidget {
//   @override
//   _CatBreedsScreenState createState() => _CatBreedsScreenState();
// }
// class _CatBreedsScreenState extends State<CatBreedsScreen> {
//   late Future<List<dynamic>> catBreeds;
//   final CatService catService = CatService();
//
//   @override
//   void initState() {
//     super.initState();
//     catBreeds = catService.fetchCatBreeds();
//   }
//
//   Future<String?> _getCatImageUrl(String breedId) async {
//     return await catService.fetchCatImageUrl(breedId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Trang chu'),
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: catBreeds,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No data available'));
//           } else {
//             List<dynamic> breeds = snapshot.data!;
//             return ListView.builder(
//               itemCount: breeds.length,
//               itemBuilder: (context, index) {
//                 var breed = breeds[index];
//                 var breedId = breed['id'] ?? '';
//                 var breedName = breed['name'] ?? 'Unknown breed';
//                 var breedDescription = breed['description'] ?? 'No description available';
//
//                 return FutureBuilder<String?>(
//                   future: _getCatImageUrl(breedId),
//                   builder: (context, imageSnapshot) {
//                     if (imageSnapshot.connectionState == ConnectionState.waiting) {
//                       return ListTile(
//                         leading: CircularProgressIndicator(),
//                         title: Text(breedName),
//                         subtitle: Text(breedDescription),
//                       );
//                     } else if (imageSnapshot.hasError) {
//                       return ListTile(
//                         leading: Icon(Icons.error),
//                         title: Text(breedName),
//                         subtitle: Text(breedDescription),
//                       );
//                     } else {
//                       var imageUrl = imageSnapshot.data;
//
//                       return ListTile(
//                         leading: imageUrl != null
//                             ? Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover)
//                             : Icon(Icons.pets),
//                         title: Text(breedName),
//                         subtitle: Text(breedDescription),
//                       );
//                     }
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
