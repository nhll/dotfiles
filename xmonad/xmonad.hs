import Graphics.X11.ExtraTypes.XF86
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#90a959" "" . shorten 50
                        }
        , modMask = mod4Mask
        , terminal = "urxvtc"
        , borderWidth = 2
        , normalBorderColor = "#202020"
        , focusedBorderColor = "#90a959"
        } `additionalKeys`
        [ ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
        , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight +10")
        ]
