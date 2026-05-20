import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val keyProps = Properties()
val keyPropsFile = rootProject.file("key.properties")
if (keyPropsFile.exists()) keyPropsFile.inputStream().use { keyProps.load(it) }

android {
    namespace = "com.khyber.khyber"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    lint {
        checkReleaseBuilds = false
    }

    signingConfigs {
        create("release") {
            keyAlias      = keyProps.getProperty("keyAlias",      "khyber")
            keyPassword   = keyProps.getProperty("keyPassword",   "")
            storeFile     = file(keyProps.getProperty("storeFile", "khyber.keystore"))
            storePassword = keyProps.getProperty("storePassword", "")
        }
    }

    defaultConfig {
        applicationId = "com.khyber.khyber"
        minSdk        = flutter.minSdkVersion
        targetSdk     = flutter.targetSdkVersion
        versionCode   = flutter.versionCode
        versionName   = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig     = signingConfigs.getByName("release")
            isMinifyEnabled   = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
