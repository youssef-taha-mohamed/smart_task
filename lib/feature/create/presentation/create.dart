import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/create_fatoura_cubit.dart';
import 'widgets/add_button.dart';
import 'widgets/app_bar.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/card_item.dart';

class AddFatoura extends StatefulWidget {
  const AddFatoura({super.key});

  @override
  State<AddFatoura> createState() => _AddFatouraState();
}

class _AddFatouraState extends State<AddFatoura> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateFatouraCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: BlocBuilder<CreateFatouraCubit, CreateFatouraState>(
              builder: (context, state) {
                final cubit = context.read<CreateFatouraCubit>();
                final items = state is CreateFatouraItemsUpdated
                    ? state.items
                    : cubit.items;

                return Column(
                  children: [
                    const CreateAppBar(),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 120),
                        itemCount: items.length + 2,
                        // Items + Add button + Total
                        itemBuilder: (context, index) {
                          if (index < items.length) {
                            return _buildItemCard(context, items[index], cubit);
                          } else if (index == items.length) {
                            return AddButtonWidget(cubit: cubit);
                          }
                          return null; //else {
                          //   return BottomSheetWidget(cubit: cubit);
                          // }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        bottomSheet: Container(
          color: Colors.white,
          child: BottomSheetWidget(),
        ), //cubit: cubit),
      ),
    );
  }

  Widget _buildItemCard(
      BuildContext context, FatouraItem item, CreateFatouraCubit cubit) {
    return CardItemWidget(item: item, cubit: cubit);
  }
}
