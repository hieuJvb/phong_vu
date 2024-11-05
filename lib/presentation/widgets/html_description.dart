import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:phong_vu/presentation/widgets/web_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlDescriptionView extends StatefulWidget {
  final String description;

  const HtmlDescriptionView({super.key, required this.description});

  @override
  State<HtmlDescriptionView> createState() => _HtmlDescriptionViewState();
}

class _HtmlDescriptionViewState extends State<HtmlDescriptionView> {
  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      widget.description,
      customWidgetBuilder: (element) {
        // Xử lý hình ảnh
        if (element.localName == 'img') {
          final imageUrl = element.attributes['src'] ?? '';
          return CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        }

        // Xử lý liên kết
        if (element.localName == 'a') {
          final link = element.attributes['href'];
          if (link != null) {
            return GestureDetector(
              onTap: () => _openLink(link),
              child: Text(
                element.text.isNotEmpty ? element.text : link,
                style: const TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            );
          }
        }

        // Xử lý iframe để lấy video
        if (element.localName == 'iframe') {
          final videoUrl = element.attributes['src'] ?? '';
          return GestureDetector(
            onTap: () => _openLink(videoUrl),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Xem Video", // Có thể hiện thông báo hoặc chữ cho video
                style: const TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          );
        }

        return null;
      },
    );
  }

  void _openLink(String url) async {
    final Uri? uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InAppWebViewPage(
            url: url,
            title: "Web View",
          ),
        ),
      );
    }
  }
}
