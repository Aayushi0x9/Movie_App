import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/extention.dart';
import 'package:movie_app/utils/app_routes_utils.dart';
import 'package:movie_app/utils/moviedata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String selectedTag = 'All';
  // String selectedMeal = 'All';
  // List filter = [];
  // int selectedTime = 00;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.favouritePage);
            },
            icon: const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
              size: 25,
            ),
          ),
          10.ofWidth,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // DropdownButton(
                //     // hint: Text(selectedTag),
                //     value: selectedTag,
                //     items: [
                //       DropdownMenuItem(
                //         child: Text('All'),
                //         value: 'All',
                //       ),
                //       ...allTags
                //           .map(
                //             (e) => DropdownMenuItem(
                //               child: Text(e),
                //               value: e,
                //             ),
                //           )
                //           .toList(),
                //     ],
                //     onChanged: (val) {
                //       selectedTag = '$val';
                //       setState(() {});
                //     }),
                10.ofWidth,
              ],
            ),
            TextFormField(
              initialValue: 'Search',
              // onChanged: (val) => Globals.globals.SearchData = val,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                  label: const Text('Search Product'),
                  hintText: 'Search Product',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ))),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '\t\tPopular Recipies',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.2,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: List.generate(
                allMovies.length,
                (index) => Container(
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(3, 3),
                        blurRadius: 2,
                      ),
                    ],
                    image: DecorationImage(
                        image: NetworkImage(
                            allMovies[(allMovies.length - 1) - index]
                                ['Poster']),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '\t${allMovies[(allMovies.length - 1) - index]['Title']}  ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        backgroundColor: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '\t\tIn Feed Movies',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: allMovies.length,
                  itemBuilder: (context, index) {
                    // if (selectedMeal == allMovies[index]['Type']) {
                    //   filter.add(allMovies[index]);
                    //   setState(() {});
                    //   print(filter);
                    // }
                    // return selectedMeal == allMovies[index]['Type']
                    //     ? GestureDetector(
                    //         onTap: () {
                    //           Navigator.pushNamed(context, AppRoutes.detailPage,
                    //               arguments: filter[index]);
                    //         },
                    //         child: Container(
                    //           height: size.height * 0.22,
                    //           width: size.width,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(15),
                    //               color: Colors.white,
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                   color: Colors.grey.shade400,
                    //                   offset: const Offset(3, 3),
                    //                   blurRadius: 5,
                    //                 ),
                    //               ]),
                    //           padding: const EdgeInsets.all(10),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Container(
                    //                 height: size.height * 0.13,
                    //                 decoration: BoxDecoration(
                    //                   image: DecorationImage(
                    //                     image: NetworkImage(
                    //                         filter[index]['image']),
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                 ),
                    //               ),
                    //               Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text(
                    //                     '${filter[index]['name']}',
                    //                     overflow: TextOverflow.ellipsis,
                    //                   ),
                    //                   Row(
                    //                     children: [
                    //                       Text('${filter[index]['tags'][0]},'),
                    //                       5.ofWidth,
                    //                       Text('${filter[index]['tags'][1]}'),
                    //                     ],
                    //                   ),
                    //                   Text('${filter[index]['mealType'][0]}'),
                    //                   Row(
                    //                     children: [
                    //                       RatingBarIndicator(
                    //                         rating: filter[index]['rating'],
                    //                         itemBuilder: (context, index) =>
                    //                             const Icon(
                    //                           Icons.star,
                    //                           color: Colors.amber,
                    //                         ),
                    //                         itemCount: 5,
                    //                         itemSize: 20.0,
                    //                         direction: Axis.horizontal,
                    //                       ),
                    //                       5.ofWidth,
                    //                       Text(
                    //                         '(${filter[index]['rating']})',
                    //                         style: const TextStyle(
                    //                           color: Colors.blue,
                    //                         ),
                    //                       )
                    //                     ],
                    //                   ),
                    //                   // Row(
                    //                   //   crossAxisAlignment:
                    //                   //       CrossAxisAlignment.center,
                    //                   //   children: [
                    //                   //     const Text('Add to'),
                    //                   //     IconButton(
                    //                   //       onPressed: () {
                    //                   //         favourite.contains(
                    //                   //                 allRecipies[index])
                    //                   //             ? favourite.remove(
                    //                   //                 allRecipies[index])
                    //                   //             : favourite
                    //                   //                 .add(allRecipies[index]);
                    //                   //         setState(() {});
                    //                   //       },
                    //                   //       icon: Icon(
                    //                   //         Icons.favorite_rounded,
                    //                   //         color: favourite.contains(
                    //                   //                 allRecipies[index])
                    //                   //             ? Colors.red
                    //                   //             : Colors.grey.shade700,
                    //                   //       ),
                    //                   //     ),
                    //                   //     IconButton(
                    //                   //       onPressed: () {
                    //                   //         meal.contains(allRecipies[index])
                    //                   //             ? meal.remove(
                    //                   //                 allRecipies[index])
                    //                   //             : meal
                    //                   //                 .add(allRecipies[index]);
                    //                   //         setState(() {});
                    //                   //       },
                    //                   //       icon: Icon(Icons.set_meal_rounded,
                    //                   //           color: meal.contains(
                    //                   //                   allRecipies[index])
                    //                   //               ? Colors.teal
                    //                   //               : Colors.grey.shade700),
                    //                   //     ),
                    //                   //   ],
                    //                   // ),
                    //                 ],
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     :
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.detailPage,
                            arguments: allMovies[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                offset: const Offset(3, 3),
                                blurRadius: 5,
                              ),
                            ]),
                        // padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.21,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(allMovies[index]['Poster']),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            ' ${allMovies[index]['Title']}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 7),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(10),
                                            left: Radius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          '⭐ ${allMovies[index]['imdbRating']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' ${allMovies[index]['Released']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          favList.contains(allMovies[index])
                                              ? favList.remove(allMovies[index])
                                              : favList.add(allMovies[index]);

                                          favList.contains(allMovies[index])
                                              ? ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        '${allMovies[index]['Title']} Added to Favourite!'),
                                                    backgroundColor:
                                                        Colors.green,
                                                  ),
                                                )
                                              : ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                  content: Text(
                                                      '${allMovies[index]['Title']} Remove from Favourite!'),
                                                  backgroundColor: Colors.red,
                                                ));
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.favorite_rounded,
                                          color:
                                              favList.contains(allMovies[index])
                                                  ? Colors.red
                                                  : Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Text('${allMovies[index]['Runtime']}'),
                                  // Text('${allMovies[index]['Type']}'),
                                  // Row(
                                  //   children: [
                                  //     RatingBarIndicator(
                                  //       rating: double.parse(
                                  //           allMovies[index]['imdbRating']),
                                  //       itemBuilder: (context, index) =>
                                  //           const Icon(
                                  //         Icons.star,
                                  //         color: Colors.amber,
                                  //       ),
                                  //       itemCount: 5,
                                  //       itemSize: 20.0,
                                  //       direction: Axis.horizontal,
                                  //     ),
                                  //     5.ofWidth,
                                  //     Text(
                                  //       '(${allMovies[index]['imdbRating']})',
                                  //       style: const TextStyle(
                                  //         color: Colors.blue,
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  // const Text('Add to'),
                                  // IconButton(
                                  //   onPressed: () {
                                  //     favourite.contains(allRecipies[index])
                                  //         ? favourite
                                  //             .remove(allRecipies[index])
                                  //         : favourite
                                  //             .add(allRecipies[index]);
                                  //
                                  //     favourite.contains(allRecipies[index])
                                  //         ? ScaffoldMessenger.of(context)
                                  //             .showSnackBar(
                                  //             SnackBar(
                                  //               content: Text(
                                  //                   '${allRecipies[index]['name']} Added to Favourite!'),
                                  //               backgroundColor:
                                  //                   Colors.green,
                                  //             ),
                                  //           )
                                  //         : ScaffoldMessenger.of(context)
                                  //             .showSnackBar(SnackBar(
                                  //             content: Text(
                                  //                 '${allRecipies[index]['name']} Remove from Favourite!'),
                                  //             backgroundColor: Colors.red,
                                  //           ));
                                  //     setState(() {});
                                  //   },
                                  //   icon: Icon(
                                  //     Icons.favorite_rounded,
                                  //     color: favourite
                                  //             .contains(allRecipies[index])
                                  //         ? Colors.red
                                  //         : Colors.grey.shade700,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
