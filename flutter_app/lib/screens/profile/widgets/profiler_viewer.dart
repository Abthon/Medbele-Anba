import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key, required this.user}) : super(key: key);

  final user;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade400.withOpacity(0.4),
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Colors.grey[350],
            child: Row(
              children: [
                const SizedBox(
                  width: 3.0,
                ),
                Container(
                  height: 40.0,
                  width: 6.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Text("User Name:",
                        style: GoogleFonts.delius(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    title: Text(
                      '@${user['user_name']}',
                      style: GoogleFonts.delius(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Card(
            color: Colors.grey[350],
            child: Row(
              children: [
                const SizedBox(
                  width: 3.0,
                ),
                Container(
                  height: 40.0,
                  width: 6.0,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Text("First Name:",
                        style: GoogleFonts.delius(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    title: Text(
                      '${user['first_name']}',
                      style: GoogleFonts.delius(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Card(
            color: Colors.grey[350],
            child: Row(
              children: [
                const SizedBox(
                  width: 3.0,
                ),
                Container(
                  height: 40.0,
                  width: 6.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Text("Last Name:",
                        style: GoogleFonts.delius(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    title: Text(
                      '${user['last_name']}',
                      style: GoogleFonts.delius(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Card(
            color: Colors.grey[350],
            child: Row(
              children: [
                const SizedBox(
                  width: 3.0,
                ),
                Container(
                  height: 40.0,
                  width: 6.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Text("Email:",
                        style: GoogleFonts.delius(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    title: Text(
                      '${user['email']}',
                      style: GoogleFonts.delius(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Card(
            color: Colors.grey[350],
            child: Row(
              children: [
                const SizedBox(
                  width: 3.0,
                ),
                Container(
                  height: 40.0,
                  width: 6.0,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Text("Joined Date:",
                        style: GoogleFonts.delius(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    title: Text(
                      '${user['date_joined']}'.substring(0, 10),
                      style: GoogleFonts.delius(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
