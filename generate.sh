# Utility file for regeneration of resources
# To use it on mac, execute before :
# ===================================
#        chmod +x generate.sh
# ===================================
# Then run by ./generate.sh
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs