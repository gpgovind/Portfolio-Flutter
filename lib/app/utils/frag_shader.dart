// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // To load assets as strings
// import 'package:flutter_shaders/flutter_shaders.dart';

// class ShaderCustomView extends StatefulWidget {
//   const ShaderCustomView({super.key});

//   @override
//   _ShaderCustomViewState createState() => _ShaderCustomViewState();
// }

// class _ShaderCustomViewState extends State<ShaderCustomView> {
//   late String _shaderCode;

//   @override
//   void initState() {
//     super.initState();
//     _loadShader();
//   }

//   // Load the GLSL shader code as raw text
//   Future<void> _loadShader() async {
//     try {
//       // Load the shader file from assets as a string (ensure it is raw text)
//       final shaderCode = await rootBundle.loadString('assets/shaders/background.glsl');
//       setState(() {
//         _shaderCode = shaderCode;
//       });
//     } catch (e) {
//       print('Error loading shader: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_shaderCode.isEmpty) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return ShaderBuilder(
//       (context, shader, child) {
//         return AnimatedSampler(
//           (image, size, canvas) {
//             // Set iTime uniform
//             shader.setFloat(0, DateTime.now().millisecondsSinceEpoch / 1000.0);

//             // Set iResolution uniform
//             shader.setFloat(1, size.width);   // iResolution.x
//             shader.setFloat(2, size.height);  // iResolution.y

//             // Set iMouse uniform (example mouse position)
//             final mousePosition = Offset(100, 100); // Replace with actual mouse data
//             shader.setFloat(3, mousePosition.dx);   // iMouseX
//             shader.setFloat(4, mousePosition.dy);   // iMouseY
//             shader.setFloat(5, 0.0);                // iMouseZ (set 0 for no click, or use mouse click data)

//             // Draw the shader on the canvas
//             canvas.drawRect(
//               Rect.fromLTWH(0, 0, size.width, size.height),
//               Paint()..shader = shader,
//             );
//           },
//           child: const SizedBox.expand(),
//         );
//       },
//       assetKey: _shaderCode,  // Pass raw GLSL shader code
//     );
//   }
// }
