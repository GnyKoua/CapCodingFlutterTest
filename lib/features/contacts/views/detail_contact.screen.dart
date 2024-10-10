import 'package:cached_network_image/cached_network_image.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/viewmodels/contact.viewmodel.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/widgets/action_detail_contact.widget.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/widgets/detail_contact_info_item.widget.dart';
import 'package:capcoding_test_technique_flutter_2024/gen/assets.gen.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class DetailContactScreen extends StatelessWidget {
  const DetailContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactViewModel>(
      builder: (_, state, __) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.chevron_left,
                ),
              ),
            ),
            title: const Text(
              "Détails du contact",
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(15),
                    CachedNetworkImage(
                      imageUrl: state.selectedContact?.picture?.large ?? "",
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 150,
                        width: 150,
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
                          height: 150,
                          width: 150,
                          borderRadius: BorderRadius.circular(100),
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
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "${state.selectedContact?.name?.title} ${state.selectedContact?.name?.last} ${state.selectedContact?.name?.first}",
                            style: Theme.of(context).textTheme.titleSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "${state.selectedContact?.location?.city}, ${state.selectedContact?.location?.state}, ${state.selectedContact?.location?.country}",
                            style: Theme.of(context).textTheme.labelLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActionDetailsContactWidget(
                            svgSrc: const $AssetsIconsGen().videoCall,
                            label: "Appel vidéo",
                            color: Colors.blue,
                          ),
                          ActionDetailsContactWidget(
                            svgSrc: const $AssetsIconsGen().messageCircleLines,
                            label: "Message",
                            color: Colors.blue.shade900,
                          ),
                          ActionDetailsContactWidget(
                            svgSrc: const $AssetsIconsGen().callPhoneUi2,
                            label: "Appel",
                            color: Colors.blue.shade700,
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    Divider(
                      color: greyColor.withOpacity(0.25),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          DetailContactInfoItemWidget(
                            label: "Email",
                            value: state.selectedContact?.email ?? "-",
                            iconData: Icons.mail_outlined,
                          ),
                          DetailContactInfoItemWidget(
                            label: "Téléphone mobile",
                            value: state.selectedContact?.phone ?? "-",
                            iconData: Icons.phone_iphone_outlined,
                          ),
                          DetailContactInfoItemWidget(
                            label: "Téléphone fixe",
                            value: state.selectedContact?.cell ?? "-",
                            iconSvg: const $AssetsIconsGen().callPhoneUi2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
