import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = xmonad defaultConfig
        { modMask = mod4Mask
        , terminal = "urxvtc"
        , borderWidth = 1
        , normalBorderColor = "#303030"
        , focusedBorderColor = "#c47f2c"
        }
