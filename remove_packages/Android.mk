LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_OVERRIDES_PACKAGES := AudioFX \
                            BasicDreams \
                            Browser \
                            Calendar \
                            Camera2 \
                            CMUpdater \
                            CMWallpapers \
                            CyanogenSetupWizard \
                            DownloadProviderUi \
                            Eleven \
                            ExactCalculator \
                            Galaxy4 \
                            HexoLibre \
                            HoloSpiralWallpaper \
                            MagicSmokeWallpapers \
                            NoiseField \
                            PhaseBeam \
                            PhotoPhase \
                            PhotoTable \
                            Screencast \
                            SoundRecorder \
                            Terminal \
                            ThemeChooser \
                            ThemeManagerService \
                            ThemesProvider \
                            Trebuchet \
                            WallpaperCropper
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)
