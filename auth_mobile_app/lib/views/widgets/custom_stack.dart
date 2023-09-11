import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/stack_background.png'),
                  fit: BoxFit.fill,
                )),
            height: 200,
            width: double.infinity,
          ),
        ),
        SvgPicture.asset('assets/icons/XMLID 27.svg'),
        Positioned(
            top: 85, child: SvgPicture.asset('assets/icons/XMLID 9.svg')),
        Positioned(
            left: 40,
            top: 20,
            child: SvgPicture.asset('assets/icons/XMLID 25.svg')),
        Positioned(
            left: 90,
            top: 85,
            child: SvgPicture.asset('assets/icons/XMLID 10.svg')),
        Positioned(
            right: 0,
            top: 85,
            child: SvgPicture.asset('assets/icons/XMLID 12.svg')),
        Positioned(
            right: 0,
            top: 85,
            child: SvgPicture.asset('assets/icons/XMLID 15.svg')),
        Positioned(
            right: MediaQuery.of(context).size.width / 2.9,
            top: 135,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10)),
              child: Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/intern2grow.png')),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              ),
            ))
      ],
    );
  }
}
