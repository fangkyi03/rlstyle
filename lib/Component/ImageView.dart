import 'package:flutter/material.dart';
import 'package:rlstyles/Tool/Tool.dart';
import 'package:rlstyles/main.dart';

class ImageView extends StatelessWidget {
  ImageView(
      {Key? key,
      this.styles = const {},
      this.url = '',
      this.className,
      this.children = const []}) {
    final type = this.styles.runtimeType.toString();
    if (type == 'List<Map<String, dynamic>>' ||
        type == 'List<Map<String, String>>') {
      mStyles = StylesMap.formMap(mergeStyle(this.styles));
    } else {
      mStyles = StylesMap.formMap(this.styles ?? {});
    }
  }
  final dynamic styles;
  Styles mStyles = Styles();
  final String url;
  final String? className;
  final List<Widget> children;

  BoxFit getImageFit() {
    return mStyles.backgroundSize ?? BoxFit.contain;
  }

  renderImage() {
    if (url != null) {
      if (url.indexOf('http') != -1) {
        return Image.network(
          url,
          fit: getImageFit(),
          width: getSize(size: mStyles.width, defValue: null),
          height: getSize(size: mStyles.height, defValue: null),
        );
      } else {
        return Image.asset(
          url,
          fit: getImageFit(),
          width: getSize(size: mStyles.width, defValue: null),
          height: getSize(size: mStyles.height, defValue: null),
        );
      }
    } else {
      return Container();
    }
  }

  setStyle(dynamic newStyles) {}

  @override
  Widget build(BuildContext context) {
    return View(styles: styles, children: [
      ClipRRect(
          borderRadius:
              getBorderRadius(mStyles) ?? BorderRadius.all(Radius.circular(0)),
          child: renderImage())
    ]);
  }
}
