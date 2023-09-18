
# መድብለ-አምባ Library Management System

Welcome to መድብለ-አምባ, our library management system project! This project combines the power of Django for the backend and Flutter for the frontend to create an efficient library management system.

## Project Folder Structure

```markdown
መድብለ-አምባ/
├── flutter_app/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── ...
│   ├── android/
│   ├── ios/
│   ├── ...
├── django_backend/
│   ├── library_project/ 
│   │   ├── library_project/ (Django Project Configuration)
│   │   │   ├── __init__.py
│   │   │   ├── asgi.py
│   │   │   ├── settings.py
│   │   │   ├── urls.py
│   │   │   ├── wsgi.py
│   │   ├── library_app/ (Django's RestApi app for the Library)
│   │   │   ├── __init__.py
│   │   │   ├── admin.py
│   │   │   ├── apps.py
│   │   │   ├── migrations/
│   │   │   │   ├── __init__.py
│   │   │   ├── models.py
│   │   │   ├── serializers.py
│   │   │   ├── tests.py
│   │   │   ├── views.py
│   │   ├── media/ (User-Uploaded Media Files)
│   │   ├── manage.py (Django Management Script)
│   ├── requirements.txt (Python Dependency List)
```

- **`flutter_app/`**: This directory houses the source code for our Flutter mobile app. Explore the `lib/` folder for app logic and the `android/` and `ios/` folders for platform-specific code.

- **`django_backend/`**: In this directory, you'll find the Django rest api that powers our library management system. 

Please note that when you browse this repository on GitHub, you'll encounter these two directories directly at the top level, without a parent folder named `መድብለ-አምባ/`. This organization is designed for simplicity.

## Getting Started

To get up and running with our library management system, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine using the following command:

   ```bash
   git clone https://github.com/Abthon/Medbele-Anba.git
   ```

2. **Set Up Your Environment**: Create a virtual environment for your Django project and activate it. Then, install the required dependencies from `requirements.txt`. For Flutter, ensure you have Flutter and Dart installed on your system.

3. **Run the Django Backend**: Navigate to the `django_backend/` directory and run the following commands:

   ```bash
   python manage.py migrate
   python manage.py runserver
   ```

4. **Run the Flutter App**: Open the `flutter_app/` directory in your preferred code editor. Use the following command to launch the Flutter app on an emulator or device:

   ```bash
   flutter run
   ```

## Issues and Support

If you encounter any issues or have questions about our library management system, please visit our [Issue Tracker](https://github.com/Abthon/Medbele-Anba/issues) to report problems or seek assistance.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as per the terms of the license.


<div align="center">
  <h2>Screenshots</h2>
  <div class="screenshot-grid">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_1_2023-09-18_04-23-42.jpg" alt="Screenshot 1" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_2_2023-09-18_04-23-42.jpg" alt="Screenshot 2" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_3_2023-09-18_04-23-42.jpg" alt="Screenshot 3" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_4_2023-09-18_04-23-42.jpg" alt="Screenshot 4" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_5_2023-09-18_04-23-42.jpg" alt="Screenshot 5" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_6_2023-09-18_04-23-42.jpg" alt="Screenshot 6" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_7_2023-09-18_04-23-42.jpg" alt="Screenshot 7" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_8_2023-09-18_04-23-42.jpg" alt="Screenshot 8" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_9_2023-09-18_04-23-42.jpg" alt="Screenshot 9" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_10_2023-09-18_04-23-42.jpg" alt="Screenshot 10" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_11_2023-09-18_04-23-42.jpg" alt="Screenshot 11" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_12_2023-09-18_04-23-42.jpg" alt="Screenshot 12" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_13_2023-09-18_04-23-42.jpg" alt="Screenshot 13" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_14_2023-09-18_04-23-42.jpg" alt="Screenshot 14" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_15_2023-09-18_04-23-42.jpg" alt="Screenshot 15" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_16_2023-09-18_04-23-42.jpg" alt="Screenshot 16" width="200" height="400">
    <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/photo_17_2023-09-18_04-23-42.jpg" alt="Screenshot 17" width="200" height="400">
     <img src="https://github.com/Abthon/Medbele-Anba/blob/main/ScreenShots/Screenshot%202023-09-18%20042013.png" alt="Screenshot 18">
  </div>
</div>

