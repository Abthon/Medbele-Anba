import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/authentication/views/signup.dart';
import 'package:rive/rive.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({super.key});

  @override
  _GetStartedButtonState createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  late Artboard? _catButtonArtBoard;
  SMIInput<bool>? _clickInput;
  SMIInput<bool>? _hoverInput;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    final bytes = await rootBundle.load('assets/cat_button.riv');
    final file = RiveFile.import(bytes);

    final artboard = file.mainArtboard;

    var controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );

    if (controller != null) {
      artboard.addController(controller);
      _hoverInput = controller.findInput("hover?");
      _clickInput = controller.findInput('clicked?');
    } else {
      throw Exception("Controller is null");
    }

    setState(() => _catButtonArtBoard = artboard);
  }

  void _onTapDown(TapDownDetails details) {
    _clickInput?.value = true;
  }

  void _onTapUp(TapUpDetails details) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const SignUp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _hoverInput?.value = true;
    return SizedBox(
      width: 300,
      height: 300,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: Rive(
          artboard: _catButtonArtBoard!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
