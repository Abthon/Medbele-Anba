import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/vews/search_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants.dart';
import '../providers/book_provider.dart';
import '../providers/user_provider.dart';
import 'vews/books_detail_screen.dart';
import 'widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(userDataProvider);
        final books = ref.watch(bookDataProvider);
        return user.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (err, stack) => Text('Error: $err'),
          data: (userData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(180.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "👋 Hello, ${userData['first_name']}",
                                  style: GoogleFonts.delius(
                                    fontWeight: FontWeight.bold,
                                    color: smallTextColor,
                                    fontSize: 17.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'What Would you like \n to read today?',
                                  style: GoogleFonts.delius(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 26,
                              backgroundImage: NetworkImage(
                                  "$baseUrl${userData['profile_image']}"),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.text,
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            await ref
                                .read(searchBooksProvider)
                                .searchBooks(_controller.text)
                                .then(
                              (books) {
                                if (books.isEmpty) {
                                  print('book is empty');
                                  // show the alert dialoge
                                } else {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SearchResultsPage(books: books),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          child: const Icon(
                            Icons.search,
                            color: AppConst.kBkDark,
                          ),
                        ),
                        controller: _controller,
                        fillColor: Colors.white,
                        hintText: "Search...",
                      )
                    ],
                  ),
                ),
              ),
              body: books.when(
                data: (bookData) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 180.0,
                        mainAxisSpacing: 20.0,
                      ),
                      physics: const BouncingScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      itemCount: bookData.length,
                      itemBuilder: (context, index) {
                        final book = bookData[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BookDetailPage(book: book),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 120,
                                  margin: const EdgeInsets.only(
                                    left: 6.0,
                                    right: 6.0,
                                  ),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      '$baseUrl${book.cover_image}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text(
                      error.toString(),
                    ),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
