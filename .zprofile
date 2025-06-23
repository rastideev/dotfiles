### --- SYSTEM CONFIGURATION ----------------------------------------

export $(envsubst < $HOME/.env)
export QT_QPA_PLATFORMTHEME="qt5ct"  

### --- ANDROID -----------------------------------------------------

# export ANDROID_HOME=$HOME/.local/share/android
# export ANDROID_SDK_ROOT=${ANDROID_HOME}
#export PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${PATH}
