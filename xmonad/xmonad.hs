import Graphics.X11.ExtraTypes.XF86
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmobar <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook         = manageDocks <+> manageHook defaultConfig
        , layoutHook         = avoidStruts  $  layoutHook defaultConfig
        , logHook            = myLogHook xmobar
        , modMask            = mod4Mask
        , terminal           = "urxvtc"
        , borderWidth        = 2
        , normalBorderColor  = "#202020"
        , focusedBorderColor = "#6a9fb5"
        } `additionalKeys`
        [ ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
        , ((0, xF86XK_MonBrightnessUp),   spawn "xbacklight +10")
        , ((0, xF86XK_AudioLowerVolume),  spawn "amixer set Master 2%- unmute")
        , ((0, xF86XK_AudioRaiseVolume),  spawn "amixer set Master 2%+ unmute")
        , ((0, xF86XK_AudioMute),         spawn "amixer set Master toggle")
        ]

myLogHook h = dynamicLogWithPP $ defaultPP 
    { ppOutput = hPutStrLn h
    , ppOrder  = \(ws:l:t:_) -> [ws]
    , ppCurrent = xmobarColor "#6a9fb5" ""
    , ppUrgent  = xmobarColor "#ac4142" ""
    , ppHiddenNoWindows = xmobarColor "#282828" ""
    , ppWsSep   = " "
    }
