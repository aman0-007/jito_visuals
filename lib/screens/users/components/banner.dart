import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  final String imgname;
  const TopBanner({
    super.key,
    required this.imgname,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 20.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgname),
                fit: BoxFit.fill,
              )
            ),
          ),
        ),
      ),
    );
  }
}