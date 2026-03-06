import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_head_lines_cubit/get_head_lines_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/top_head_line_widget.dart';

class TopHeadLineListView extends StatelessWidget {
  const TopHeadLineListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHeadLinesCubit, GetHeadLinesState>(
      builder: (context, state) {
        if (state is GetHeadLinesLoading) {
          return const CircularProgressIndicator();
        }
        if (state is GetHeadLinesFailure) {
          return Text(state.errorMessage);
        }
        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return TopHeadLineWidget();
            },
          ),
        );
      },
    );
  }
}
