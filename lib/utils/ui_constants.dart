// ignore_for_file: unnecessary_this

part of 'utils.dart';

const kMinMobileLayoutWidth = 580;
const kMinTabletLayoutWidth = 860;
const kMinDesktopLayoutWidth = 1200;
const kHeaderHeight = kToolbarHeight + 22;
const kFooterheight = kHeaderHeight / 2;
const _kDefaultPadding = 16.0;
const kDefaultPadding = EdgeInsets.all(_kDefaultPadding);
const kDefaultPaddingVertical = EdgeInsets.symmetric(vertical: _kDefaultPadding);
const kDefaultPaddingHorizontal = EdgeInsets.symmetric(horizontal: _kDefaultPadding);

extension EdgeInsetsExtension on EdgeInsets {
  EdgeInsets operator /(double value) {
    return this.copyWith(
      left: left / value,
      right: this.right / value,
      top: this.top / value,
      bottom: this.bottom / value,
    );
  }

  EdgeInsets operator *(double value) {
    return this.copyWith(
      left: left * value,
      right: this.right * value,
      top: this.top * value,
      bottom: this.bottom * value,
    );
  }

  EdgeInsets operator +(double value) {
    return this.copyWith(
      left: left + value,
      right: this.right + value,
      top: this.top + value,
      bottom: this.bottom + value,
    );
  }

  EdgeInsets operator -(double value) {
    return this.copyWith(
      left: left - value,
      right: this.right - value,
      top: this.top - value,
      bottom: this.bottom - value,
    );
  }
}
