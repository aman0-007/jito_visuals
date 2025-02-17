import 'package:flutter/material.dart';

// Enum for different types of transitions
enum TransitionType {
  fade,
  slide,
  slideFromLeft,
  slideFromRight,
  slideFromTop,
  slideFromBottom,
  scale,
  rotate,
  flip,
  zoom,
  bounce,
  slideFade,
  shrink,
  expand,
}

class AnimatedPageTransition extends PageRouteBuilder {
  final Widget page;  // The page you're navigating to
  final TransitionType transitionType;  // The type of transition you want (fade, slide, etc.)

  AnimatedPageTransition({
    required this.page,
    this.transitionType = TransitionType.fade, // Default to fade transition
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;  // The target page widget
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (transitionType) {
        case TransitionType.fade:
          return _buildFadeTransition(animation, secondaryAnimation, child);
        case TransitionType.slide:
          return _buildSlideTransition(animation, secondaryAnimation, child, Offset(0.0, 1.0)); // Slide from bottom
        case TransitionType.slideFromLeft:
          return _buildSlideTransition(animation, secondaryAnimation, child, Offset(-1.0, 0.0)); // Slide from left
        case TransitionType.slideFromRight:
          return _buildSlideTransition(animation, secondaryAnimation, child, Offset(1.0, 0.0)); // Slide from right
        case TransitionType.slideFromTop:
          return _buildSlideTransition(animation, secondaryAnimation, child, Offset(0.0, -1.0)); // Slide from top
        case TransitionType.slideFromBottom:
          return _buildSlideTransition(animation, secondaryAnimation, child, Offset(0.0, 1.0)); // Slide from bottom
        case TransitionType.scale:
          return _buildScaleTransition(animation, secondaryAnimation, child);
        case TransitionType.rotate:
          return _buildRotateTransition(animation, secondaryAnimation, child);
        case TransitionType.flip:
          return _buildFlipTransition(animation, secondaryAnimation, child);
        case TransitionType.zoom:
          return _buildZoomTransition(animation, secondaryAnimation, child);
        case TransitionType.bounce:
          return _buildBounceTransition(animation, secondaryAnimation, child);
        case TransitionType.slideFade:
          return _buildSlideFadeTransition(animation, secondaryAnimation, child);
        case TransitionType.shrink:
          return _buildShrinkTransition(animation, secondaryAnimation, child);
        case TransitionType.expand:
          return _buildExpandTransition(animation, secondaryAnimation, child);
        default:
          return child;
      }
    },
  );

  // Fade transition helper function (handles both entry and exit)
  static Widget _buildFadeTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    var fadeIn = Tween(begin: 0.0, end: 1.0).animate(animation);
    var fadeOut = Tween(begin: 1.0, end: 0.0).animate(secondaryAnimation);

    return FadeTransition(
      opacity: fadeIn, // For the page in animation
      child: FadeTransition(
        opacity: fadeOut, // For the page out animation
        child: child,
      ),
    );
  }

  // Slide transition helper function (handles both entry and exit)
  static Widget _buildSlideTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child, Offset begin) {
    const curve = Curves.easeInOut;

    // For page entry
    var tween = Tween(begin: begin, end: Offset.zero).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    // For page exit
    var slideOut = Tween(begin: Offset.zero, end: begin).chain(CurveTween(curve: curve));
    var slideOutAnimation = secondaryAnimation.drive(slideOut);

    return Stack(
      children: [
        // For page out (exit): This is the old page sliding out
        SlideTransition(position: slideOutAnimation, child: child),

        // For page in (entry): This is the new page sliding in from the bottom
        SlideTransition(position: offsetAnimation, child: child),
      ],
    );
  }
  // Scale transition helper function (handles both entry and exit)
  static Widget _buildScaleTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    const curve = Curves.easeInOut;

    // For page entry (scale in)
    var scaleIn = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve)).animate(animation);

    // For page exit (scale out)
    var scaleOut = Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: curve)).animate(secondaryAnimation);

    return Stack(
      children: [
        ScaleTransition(scale: scaleOut, child: child), // For page out (exit)
        ScaleTransition(scale: scaleIn, child: child), // For page in (entry)
      ],
    );
  }

  // Rotate transition helper function (handles both entry and exit)
  static Widget _buildRotateTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    const curve = Curves.easeInOut;

    // For page entry (rotate in)
    var rotateIn = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve)).animate(animation);

    // For page exit (rotate out)
    var rotateOut = Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: curve)).animate(secondaryAnimation);

    return Stack(
      children: [
        RotationTransition(turns: rotateOut, child: child), // For page out (exit)
        RotationTransition(turns: rotateIn, child: child), // For page in (entry)
      ],
    );
  }

  static Widget _buildFlipTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final angle = animation.value * 3.1416;
        return Transform(
          transform: Matrix4.rotationY(angle),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }

  static Widget _buildZoomTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(scale: Tween(begin: 0.0, end: 1.0).animate(animation), child: child);
  }

  static Widget _buildBounceTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween(begin: Offset(0, 1), end: Offset.zero)
          .chain(CurveTween(curve: Curves.bounceOut))
          .animate(animation),
      child: child,
    );
  }

  static Widget _buildSlideFadeTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(position: animation.drive(Tween(begin: Offset(1.0, 0.0), end: Offset.zero)), child: child),
    );
  }

  static Widget _buildShrinkTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(scale: Tween(begin: 1.0, end: 0.0).animate(secondaryAnimation), child: child);
  }

  static Widget _buildExpandTransition(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(scale: Tween(begin: 0.0, end: 1.0).animate(animation), child: child);
  }
}
