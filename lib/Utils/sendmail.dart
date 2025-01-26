import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> sendFormEmail(String name, String email, String message) async {
  
  final db = await FirebaseFirestore.instance;
  String documentId = "ZBw2YCteUFuBQBZmchuq";

  final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await db.collection('Name').doc(documentId).get();

  Map<String, dynamic>? data = snapshot.data();

  final url = 'https://api.sendinblue.com/v3/smtp/email';
String keyId = data!["key_id"];
  final headers = {
    'Content-Type': 'application/json',
    'api-key': keyId.toString(),
  };

  final body = jsonEncode({
    'sender': {'email': email}, // Change to your sender email
    'to': [
      {'email': 'appua0126@gmail.com'} // Recipient Email
    ],
    'subject': 'New Form Submission',
    'textContent': 'Name: $name\nEmail: $email\nMessage: $message',
    'htmlContent': '''
      <p><strong>Name:</strong> $name</p>
      <p><strong>Email:</strong> $email</p>
      <p><strong>Message:</strong> $message</p>
      <p>Sent on ${DateTime.now()}</p>
    ''',
  });

  try {
    final prefs = await SharedPreferences.getInstance();
    String? lastSentDate = prefs.getString('last_sent_date');
    String today =
        DateTime.now().toIso8601String().split('T')[0]; // Format: YYYY-MM-DD

    if (lastSentDate == today) {
      Fluttertoast.showToast(
        msg: "You have already submitted today!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);
print(response.body);
    if (response.statusCode == 201) {
      await prefs.setString('last_sent_date', today); // Save the sent date
      Fluttertoast.showToast(
        msg: "Form submitted successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Error sending form: ${response.body}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  } catch (e) {
    Fluttertoast.showToast(
      msg: "Error: $e",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
