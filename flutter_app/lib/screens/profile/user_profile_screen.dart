import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authentication/views/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/profiler_viewer.dart';
import '../providers/user_provider.dart';
import '../../utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);

class UserProfile extends ConsumerWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(userDataProvider);
        return data.when(
          error: (error, stackTrace) {
            return SizedBox(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          data: (snapshot) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Tooltip(
                              message: "LogOut",
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Login(),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            Text(
                              'Medbele Anba',
                              style: GoogleFonts.delius(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.amber.shade700,
                                  backgroundImage: NetworkImage(
                                      '$baseUrl${snapshot['profile_image']}'),
                                ),
                                const SizedBox(width: 10.0)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  '$baseUrl${snapshot['profile_image']}'),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot['first_name']} ${snapshot['last_name']}',
                                  style: GoogleFonts.delius(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '@${snapshot['user_name']}',
                                  style: GoogleFonts.delius(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: smallTextColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[350],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 5.0),
                          margin: const EdgeInsets.only(right: 20.0),
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    ref.read(tabIndexProvider.notifier).state =
                                        0;
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    decoration: BoxDecoration(
                                      color: tabIndex == 0
                                          ? const Color(0xff5165EA)
                                          : Colors.grey[350],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      "View Profile",
                                      style: GoogleFonts.delius(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        color: tabIndex == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    ref.read(tabIndexProvider.notifier).state =
                                        1;
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    decoration: BoxDecoration(
                                      color: tabIndex == 1
                                          ? const Color(0xff5165EA)
                                          : Colors.grey[350],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      "Edit Profile",
                                      style: GoogleFonts.delius(
                                        fontWeight: FontWeight.bold,
                                        color: tabIndex == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 13.0,
                        ),
                        ViewProfile(user: snapshot),
                        const SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
