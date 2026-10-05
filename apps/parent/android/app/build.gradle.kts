import java.util.Properties

// Ключ подписи лежит вне репозитория: ~/child-keys/key.properties.
// Без него собирается отладочная подпись — так CI и новые машины не ломаются.
val keystoreProperties = Properties().apply {
    val file = File(System.getProperty("user.home"), "child-keys/key.properties")
    if (file.exists()) file.inputStream().use { load(it) }
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.sagaman.parent"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // Бренд Sag-Aman. После публикации в Google Play applicationId
        // менять нельзя — он навсегда.
        applicationId = "com.sagaman.parent"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val storePath = keystoreProperties.getProperty("storeFile")
            if (storePath != null) {
                storeFile = file(storePath)
                storePassword = keystoreProperties.getProperty("storePassword")
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
            }
        }
    }

    // Два варианта сборки. prod — то, что ставят семьи. hometest — для
    // проверки на домашнем Wi-Fi: ему разрешён адрес без шифрования,
    // потому что сервер на ноутбуке работает по http. Разрешать это
    // обычному релизу нельзя: приложение возит детей, и трафик с их
    // адресами не должен уходить открытым.
    flavorDimensions += "mode"
    productFlavors {
        create("prod") {
            dimension = "mode"
        }
        create("hometest") {
            dimension = "mode"
            // Своё имя пакета: домашняя сборка ставится рядом с обычной
            // и не затирает её.
            applicationIdSuffix = ".hometest"
            versionNameSuffix = "-hometest"
        }
    }

    buildTypes {
        release {
            // Есть ключ — подписываем релизным, нет — отладочным.
            signingConfig = if (keystoreProperties.getProperty("storeFile") != null) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
        }
    }

    // Отдельный APK под каждую архитектуру даёт флаг сборки
    // `flutter build apk --split-per-abi`: блок splits здесь конфликтовал бы
    // со списком архитектур, который Flutter подставляет сам.
}

flutter {
    source = "../.."
}
