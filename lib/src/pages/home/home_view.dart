import '../../core/exports/view_exports.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: const Text("Home"),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Center(
          child: Container(
            width: 150.sp,
            height: 150.sp,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.flutter.provider(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
