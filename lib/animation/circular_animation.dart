import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  const CircleAnimation({Key? key}) : super(key: key);

  @override
  _CircleAnimationState createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();

    // Создаем контроллер анимации
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 1000), // Общая длительность анимации
    );

    // Создаем кривые анимации для каждого круга с разной продолжительностью
    _animation1 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4), // 40% от общей длительности
    );
    _animation2 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.7), // 40% от общей длительности
    );
    _animation3 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0), // 40% от общей длительности
    );

    // Запускаем анимацию
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Освобождаем ресурсы контроллера анимации
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              _buildCircle(const Color(0xff464749),
                  80 * _animation1.value), // Меньший круг
              _buildCircle(const Color(0xff919193),
                  60 * _animation2.value), // Средний круг
              _buildCircle(const Color(0xffffffff),
                  40 * _animation3.value), // Наибольший круг
            ],
          );
        },
      ),
    );
  }

  Widget _buildCircle(Color color, double size) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
