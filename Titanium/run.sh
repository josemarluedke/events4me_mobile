#!/bin/sh

# Separate parameters (thanks @felipek)
for param in $@; do eval "${param%%=*}=${param##*=}"; done

# Compile CoffeeScript
# Default
coffee -c -o ./Resources/lib/ ./Resources/lib/*.coffee
coffee -c -o ./Resources/ui/ ./Resources/ui/*.coffee
coffee -c -o ./Resources/ ./Resources/*.coffee

# Android
coffee -c -o ./Resources/android/ ./Resources/android/*.coffee
coffee -c -o ./Resources/android/ui/ ./Resources/android/ui/*.coffee
coffee -c -o ./Resources/android/lib/ ./Resources/android/lib/*.coffee

# iPhone
coffee -c -o ./Resources/iphone/ ./Resources/iphone/*.coffee
coffee -c -o ./Resources/iphone/ui/ ./Resources/iphone/ui/*.coffee
coffee -c -o ./Resources/iphone/lib/ ./Resources/iphone/lib/*.coffee

printf "CoffeeScript compiled\n"
printf "Running application\n"

# Run Application
if [ ! -z "${platform}" ] && [ "${platform}" == "android" ]; then
	make deploy platform="${platform}"
else
	make run
fi