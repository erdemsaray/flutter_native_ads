import '../../../core/exports/view_exports.dart';

class SettingsSwitchItem extends StatelessWidget {
  const SettingsSwitchItem(
      {Key? key,
      required this.title,
      required this.onChanged,
      required this.switchValue})
      : super(key: key);

  final String title;
  final ValueChanged<bool> onChanged;
  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70.h,
        width: 1.sw,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border(
            bottom: BorderSide(
              color: ColorConstants.graySecondary,
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
              child: Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: switchValue,
                  onChanged: (value) => onChanged(value),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
