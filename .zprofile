### --- SYSTEM CONFIGURATION ----------------------------------------

export $(envsubst < $HOME/.env)
export QT_QPA_PLATFORMTHEME="qt5ct"  

export PATH="\
    ${HOME}/.local/bin:\
    ${HOME}/.local/scripts:\
    ${PATH}"
