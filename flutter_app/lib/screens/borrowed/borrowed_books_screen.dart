import 'package:flutter/material.dart';
import 'package:flutter_app/animations/empty_content_animation_view.dart';
import 'package:flutter_app/screens/home/vews/books_detail_screen.dart';
import 'package:flutter_app/screens/providers/book_provider.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BorrowedBooksScreen extends ConsumerStatefulWidget {
  const BorrowedBooksScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BorrowedScreenState();
}

class _BorrowedScreenState extends ConsumerState<BorrowedBooksScreen> {
  @override
  void initState() {
    ref.refresh(borrowedBookDataProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(borrowedBookDataProvider);
    return books.when(
      data: (books) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffA39F9F).withOpacity(0.7),
            title: Text(
              'Borrowed Books',
              style: GoogleFonts.delius(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: books.isNotEmpty
              ? ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BookDetailPage(book: book),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xffD1E9E2),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  '$baseUrl${book.cover_image}',
                                  width: 80,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    book.title,
                                    style: GoogleFonts.delius(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'By ${book.author}',
                                    style: GoogleFonts.delius(
                                      fontSize: 15.0,
                                      color: smallTextColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.numbers_outlined,
                                        color: Color(0xff80978A),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        book.isbn,
                                        style: GoogleFonts.delius(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff80978A),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              // const SizedBox(width: 25.0),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_outlined),
                              const SizedBox(
                                width: 25.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: EmptyContentAnimationView()),
        );
      },
      error: (err, stackTrace) {
        return Center(
          child: Text(err.toString()),
        );
      },
      loading: () {
        return const Center(
          child: SingleChildScrollView(),
        );
      },
    );
  }
}
