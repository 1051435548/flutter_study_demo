import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class Four extends StatefulWidget {
  @override
  _FourState createState() => _FourState();
}

class _FourState extends State<Four> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// 隐藏返回按钮
        automaticallyImplyLeading: false,
        title: _search(),
      ),
      body: _body(),
    );
  }

  Widget _search() {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          child: Container(
            width: size.width - 86,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: null,
                ),
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    onSubmitted: (str) {
                      focusNode.unfocus();
                      ToastUtil.show(context: context, msg: str);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '请输入搜索内容...',
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.grey,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            focusNode.unfocus();
          },
          child: Text(
            '取消',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Container(
        width: size.width,
        height: size.height / 2,
        color: Colors.lightBlue,
        child: RainDropWidget(),
      ),
    );
  }
}

/// github 上看到挺有意思的下雨效果 地址：https://github.com/kevin-zhan/RainDropWidget
class RainDropWidget extends StatefulWidget {
  RainDropWidget({Key key, this.width, this.height}) : super(key: key);

  final double width;
  final double height;

  @override
  State<StatefulWidget> createState() {
    return RainDropState(width, height);
  }
}

class RainDropState extends State<RainDropWidget>
    with TickerProviderStateMixin {
  List<RainDropDrawer> _rainList;
  AnimationController _animation;
  double _width = 300;
  double _height = 300;

  RainDropState(double width, double height) {
    _width = width ?? _width;
    _height = height ?? _height;
  }

  @override
  void initState() {
    super.initState();
    _rainList = List();
    _animation = new AnimationController(
        // 因为是repeat的，这里的duration其实不care
        duration: const Duration(milliseconds: 200),
        vsync: this)
      ..addListener(() {
        if (_rainList.isEmpty) {
          _animation.stop();
        }
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      width: _width,
      height: _height,
      child: GestureDetector(
        onTapUp: (TapUpDetails tapUp) {
          RenderBox getBox = context.findRenderObject();
          var localOffset = getBox.globalToLocal(tapUp.globalPosition);

          var rainDrop = RainDropDrawer(localOffset.dx, localOffset.dy);
          _rainList.add(rainDrop);
          _animation.repeat();
        },
        child: CustomPaint(
          painter: RainDrop(_rainList),
        ),
      ),
    );
  }
}

class RainDrop extends CustomPainter {
  RainDrop(this.rainList);

  List<RainDropDrawer> rainList = List();
  Paint _paint = new Paint()..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    rainList.forEach((item) {
      item.drawRainDrop(canvas, _paint);
    });
    rainList.removeWhere((item) {
      return !item.isValid();
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RainDropDrawer {
  static const double MAX_RADIUS = 30;
  double posX;
  double posY;
  double radius = 5;

  RainDropDrawer(this.posX, this.posY);

  drawRainDrop(Canvas canvas, Paint paint) {
    double opt = (MAX_RADIUS - radius) / MAX_RADIUS;
    paint.color = Color.fromRGBO(0, 0, 0, opt);
    canvas.drawCircle(Offset(posX, posY), radius, paint);
    radius += 0.5;
  }

  bool isValid() {
    return radius < MAX_RADIUS;
  }
}
