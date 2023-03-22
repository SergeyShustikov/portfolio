@REM  Utility file for regeneration of resources
@REM  To use it on mac, execute before :
@REM  ===================================
@REM         chmod +x generate.sh
@REM  ===================================
@REM  Then run by ./generate.sh

flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs