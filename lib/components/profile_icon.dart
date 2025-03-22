import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozaik/app_colors.dart';
import 'package:mozaik/blocs/profile_bloc.dart';
import 'package:mozaik/states/profile_state.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.ashBlue,
            child: ClipOval(
              child: Image.network(
                state.user.profilePic,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else if (state is ProfileError) {
          return const Icon(Icons.error);
        } else {
          return Transform.scale(
            scale: 0.5,
            child: const CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ),
          );
        }
      },
    );
  }
}
