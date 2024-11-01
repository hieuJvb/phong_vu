import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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

class InAppWebViewPage extends StatelessWidget {
  final String url;

  const InAppWebViewPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
      ),
    );
  }
}
