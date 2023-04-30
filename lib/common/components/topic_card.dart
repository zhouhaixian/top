import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TopicCard extends StatelessWidget {
  final int index;
  final String title;
  final String url;
  final String? description;
  final String? cover;
  const TopicCard(this.index, this.title, this.url,
      {super.key, this.description, this.cover});

  @override
  Widget build(BuildContext context) {
    final imageSection = cover != null
        ? ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            // borderRadius: BorderRadius.circular(8),
            child: Image.network(
              cover!,
              fit: BoxFit.fitWidth,
            ),
          )
        : null;

    final titleSection = RichText(
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          index == 0
              ? const WidgetSpan(
                  child: Icon(
                  Icons.vertical_align_top,
                  size: 20,
                ))
              : TextSpan(
                  text: "$index. ",
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
          TextSpan(
            text: title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );

    final descriptionSection = description != null
        ? Container(
            padding: const EdgeInsets.fromLTRB(2, 3, 4, 5),
            child: Text(
              description!,
              style: const TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          )
        : null;

    final link = Uri.parse(url);
    Future<void> launchUrlInDefaultBrowser() async {
      if (!await launchUrl(link, mode: LaunchMode.externalApplication)) {
        throw Exception("Could not launch $link");
      }
    }

    return Container(
      margin: const EdgeInsets.all(5),
      child: TextButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(32, 96, 239, 0.1),
          ),
          alignment: Alignment.topLeft,
        ),
        onPressed: launchUrlInDefaultBrowser,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imageSection != null) imageSection,
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleSection,
                  if (descriptionSection != null) descriptionSection
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
