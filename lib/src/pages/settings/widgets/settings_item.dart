import '../../../core/exports/view_exports.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({Key? key, required this.title, required this.onTap}) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 1.sw,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.sp,
            ),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 19.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
