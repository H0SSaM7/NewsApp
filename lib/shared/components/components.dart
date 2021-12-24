import 'package:flutter/material.dart';
import 'package:news_app/modules/details/details_screen.dart';

Widget buildListViewArticles(List<dynamic> articles) {
  return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                          article: articles[index],
                        )));
          },
          child: Container(
            margin: const EdgeInsets.all(11),
            height: 120,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: getImage(
                      url: articles[index].imageUrl, height: 120, width: 130),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(articles[index].title!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                      const Spacer(),
                      Text(
                        articles[index].publishAt!,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6.0,
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: articles.length);
}

Widget getImage({String? url, required double width, required double height}) {
  Widget image;
  if (url == null) {
    image = Image.asset(
      'images/noImage.png',
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
    return image;
  } else {
    image = Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
    return image;
  }
}

TextFormField defaultFormField({
  required TextInputType type,
  bool? isObscure,
  required TextEditingController controller,
  Function()? onTap,
  required Widget icon,
  required String title,
  bool? readOnly,
  required String validateText,
  Function(String)? onChange,
  required BuildContext context,
}) {
  return TextFormField(
    onChanged: onChange,
    readOnly: readOnly ?? false,
    keyboardType: type,
    obscureText: false,
    controller: controller,
    onTap: onTap,
    validator: (value) {
      if (value!.isEmpty) {
        return validateText;
      } else {
        null;
      }
    },
    decoration: InputDecoration(
        suffix: InkWell(
          onTap: () {
            controller.text = '';
          },
          child: const Icon(
            Icons.cancel_outlined,
            color: Colors.black,
            size: 17,
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).hintColor)),
        prefixIcon: icon,
        hintText: title,
        hintStyle: Theme.of(context).textTheme.subtitle1),
  );
}
