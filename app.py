import sys
import os

print(sys.argv)

splash_build_request= 'splash-build'
splash_build_command = 'fvm flutter pub run flutter_native_splash:create --path=splash.yaml'

get_request = 'get'
get_command = 'fvm flutter pub get'

clean_get_request = 'clean-get'
clean_get_command = 'fvm flutter clean && fvm flutter pub get'

fresh_pods_request = 'fresh-pods'
fresh_pods_command = 'fvm flutter clean && fvm flutter pub get && cd ios && pod deintegrate && rm -rf podfile.lock  && arch -x86_64 pod install --repo-update'

build_runner_request = 'build-runner'

## for assets gen create(check path in pubspec.yaml) 
build_runner_command = 'fvm flutter pub run build_runner build --delete-conflicting-outputs'

## it's awesome -- just write "python app.py easy" on terminal
build_codegen_loader = 'fvm flutter pub run easy_localization:generate --source-dir ./assets/translations -O ./lib/src/core/generated'
build_locale_keys = 'fvm flutter pub run easy_localization:generate --source-dir ./assets/translations -O ./lib/src/core/generated -f keys -o locale_keys.g.dart'
easy = build_codegen_loader + ' && ' + build_locale_keys

## it's awesome -- just write "python app.py assets" for image assets
images = "flutter pub run build_runner build --delete-conflicting-outputs"

# Check if the given argument matches any command variable
for arg in sys.argv[1:]:  # skip the first argument, which is the script name
    if arg in globals():  # check if the argument matches a variable name
        command = globals()[arg]  # retrieve the command using the variable name
        os.system(command)  # execute the command
