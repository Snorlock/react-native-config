# Config variables for React Native apps

Swift cocoapods module to expose config variables to your javascript and native code in React Native, supporting both iOS and Android.

Bring some [12 factor](http://12factor.net/config) love to your mobile apps!

## Setup

Install the package:

```
$ npm install react-native-config --save
```

Link the library through your podfile:

```
pod 'RNConfig', :path => '../node_modules/react-native-config-swift'
```
PS: you have to add this to your podfile, to have the buildphase read your config

```
post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name.include? 'RNConfig'
            phase = target.new_shell_script_build_phase("Build env file")
            phase.shell_script = "cd .. && cd .. && ./node_modules/.bin/build-ios-env"
            target.build_phases.move_from(4,0)
        end
    end
  end
```

### Extra step for Android

Apply a plugin to your app build in `android/app/build.gradle`:

```
// 2nd line, add a new apply:
apply from: project(':react-native-config-swift').projectDir.getPath() + "/dotenv.gradle"
```

## Usage

Create a new file, fex `.env.develop`  in the root of your React Native app:

```
{
  "BASE_URL"="https://localhost:8080"
  "APP_ID"="qwertasdfg"
}
```
This might be where the localhost web server and view is hosted.

Then access variables defined there from your app:

```js
import Config from 'react-native-config-swift'

Config.BASE_URL  // 'https://localhost:8080'
Config.APP_ID // 'qwertasdfg'
```

Keep in mind this module doesn't obfuscate or encrypt secrets for packaging, so do not store sensitive keys in `.env`files. It's [basically impossible to prevent users from reverse engineering mobile app secrets](https://rammic.github.io/2015/07/28/hiding-secrets-in-android-apps/), so design your app (and APIs) with that in mind.


### Android

Config variables set in `.env`files are available to your Java classes via `BuildConfig`:

```java
public HttpURLConnection getApiClient() {
    URL url = new URL(BuildConfig.BASE_URL);
    // ...
}
```

You can also read them from your Gradle configuration:

```groovy
defaultConfig {
    applicationId project.env.get("APP_ID")
}
```

And use them to configure libraries in `AndroidManifest.xml` and others:

```xml
<meta-data
  android:name="com.google.android.geo.API_KEY"
  android:value="@string/API_ID" />
```

Once again keep in mind variables stored in `.env`files are published with your code, so do not put anything sensitive there like your app `signingConfigs`.


### iOS

Read variables declared in `.env`files from your Swift classes like:

```swift
// import library
import RNConfig

// then read individual keys like:
let baseUrl = RNConfig().read("BASE_URL")

// or just fetch the whole config
let config = RNConfig().readFile();
```

### Different environments

Save config for different environments in different files: `.env.staging`, `.env.production`, etc.

By default react-native-config will read from `.env.develop`.
But you can change it with a simple ENVFILE envrionment variable.

#### Android / iOS

You can set `ENVFILE` before building/running your app. For instance:

```
$ ENVFILE=.env.staging react-native run-android
$ ENVFILE=.env.prod react-native run-ios
```

## Troubleshooting

### Have you added the post_install step

You have to add the post_install step in your podfile.
If you already have one, then just incorporate our code
