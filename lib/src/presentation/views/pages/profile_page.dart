import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xtintas/src/presentation/stores/profile_store.dart';
import 'package:xtintas/src/presentation/widgets/custom_card.dart';

import '../../../external/models/profile.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/fonts.dart';
import '../../stores/auth_store.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final ProfileStore profileStore = GetIt.I.get<ProfileStore>();
  final AuthStore authStore = GetIt.I.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: profileStore.getProfile(),
      builder: (context, AsyncSnapshot<Profile?> snapshot) {
        if (snapshot.hasData) {
          Profile profile = snapshot.data!;

          return Column(
            children: [
              Text(
                'Perfil',
                style: Fonts.title2,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomCard(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          profile.avatar,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          profile.name,
                          textAlign: TextAlign.center,
                          style: Fonts.cardItemTitle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Fazer logout',
                        style: Fonts.logoutButtonStyle,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  authStore.logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);
                },
              )
            ],
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao carregar página'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: CustomColors.secondary),
          );
        }
      },
    );
  }
}
