import '../../core/exports/view_exports.dart';

class DisconnectedWidget extends StatelessWidget {
  const DisconnectedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.white,
      child: const Center(
        child: Text("No internet connection"),
      ),
    );
  }
}
