import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/business_logic/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:noteapp/presentation/widdgets/customBottom.dart';
import 'package:noteapp/presentation/widdgets/customFormFiled.dart';
import 'package:noteapp/presentation/widdgets/customSnakBar.dart';
import 'package:noteapp/presentation/widdgets/customSpinKit.dart';
import 'package:noteapp/presentation/widdgets/cutomTextFeild.dart';

class CustomModelSheet extends StatelessWidget {
  const CustomModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            showSnakBar(
              context: context,
              message: 'Note Added Successfully',
              backgroundColor: Colors.green[700],
              icons: LucideIcons.checkCircle,
            );
          }
          if (state is AddNoteFailure) {
            showSnakBar(
              context: context,
              message: 'Falied ${state.errMessage}',
              backgroundColor: Colors.red[700],
              icons: LucideIcons.xCircle,
            );
          }
        },
        builder: (context, state) {
          if (state is AddNoteLoading) {
            customShowDialog(context);
          }
          return CustomNoteForm();
        },
      ),
    );
  }
}
