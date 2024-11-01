import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:phong_vu/presentation/widgets/video_player_widget.dart';
import 'package:phong_vu/presentation/widgets/web_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlDescriptionView extends StatefulWidget {
  final String description;

  const HtmlDescriptionView({super.key, required this.description});

  @override
  State <HtmlDescriptionView> createState() => _HtmlDescriptionViewState();
}

class _HtmlDescriptionViewState extends State<HtmlDescriptionView> {
  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      widget.description,
      customWidgetBuilder: (element) {
        if (element.localName == 'img') {
          final imageUrl = element.attributes['src'] ?? '';
          return CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        }
        if (element.localName == 'a') {
          final link = element.attributes['href'];
          if (link != null) {
            return GestureDetector(
              onTap: () => _openLink(link),
              child: Text(
                element.text ,
                style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            );
          }
        }
        if(element.localName == "iframe"){
          final videoUrl = element.attributes['src'] ??'';
          return VideoPlayerWidget(videoUrl: videoUrl);
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
      // ignore: use_build_context_synchronously
      Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => InAppWebViewPage(url: url),
        ),
      );
    }
  }
}


