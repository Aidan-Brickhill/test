import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("hello but in appbar"),
          ),
        ),
        body: const Center(
          child: Text("Hello but in a body"),
        ),    
      ),
    ),
  );
}

