import 'package:flutter/material.dart';
import '../../App/widgets/bottom_navigation.dart';
import '../providers/user_provider.dart';
import '../../utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  void fetchData() {
    final container = ProviderContainer();
    final result =
        container.read(userDataProvider); // Replace with your provider
    container.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(userDataProvider);
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
                        suffixIcon: const Icon(
                          Icons.search,
                          color: AppConst.kBkDark,
                        ),
                        controller: _controller,
                        fillColor: Colors.white,
                        hintText: "Search...",
                      )
                    ],
                  ),
                ),
              ),
              body: const Column(
                children: [],
              ),
            );
          },
        );
      },
    );
  }
}
