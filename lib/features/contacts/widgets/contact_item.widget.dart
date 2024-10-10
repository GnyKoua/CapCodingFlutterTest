import 'package:cached_network_image/cached_network_image.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/models/contact.model.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletons/skeletons.dart';

class ContactItemWidget extends StatelessWidget {
  const ContactItemWidget({
    super.key,
    required this.item,
    required this.onClick,
  });
  final ContactModel item;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        height: 85,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: item.picture?.medium ?? "",
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.error,
                        size: 35,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${item.name?.title} ${item.name?.last}",
                          ),
                          const Gap(2),
                          Text(
                            "${item.name?.first}",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 15,
                    width: 15,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.chevron_right_outlined,
                      color: secondaryColor,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: greyColor.withOpacity(0.25),
            ),
          ],
        ),
      ),
    );
  }
}
