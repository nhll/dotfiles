import qualified Data.Map as M

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86
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
        } 
        `additionalKeysP` myKeys

myLogHook h = dynamicLogWithPP $ defaultPP 
    { ppOutput = hPutStrLn h
    , ppOrder  = \(ws:l:t:_) -> [ws]
    , ppCurrent = xmobarColor "#6a9fb5" ""
    , ppUrgent  = xmobarColor "#ac4142" ""
    , ppHiddenNoWindows = xmobarColor "#282828" ""
    , ppWsSep   = " "
    }

myKeys =
    [ ("M-p",                       spawn "dmenu_run -h 42 -fn Inconsolata-16")
    , ("M-<F1>",                    spawn "randbg")
    , ("M-<F2>",                    spawn "randbg 'math|maths|mathematics'")
    , ("M-<F3>",                    spawn "randbg 'alcohol|drunk'")
    , ("M-<F4>",                    spawn "randbg 'berlin'")
    , ("M-<F5>",                    spawn "randbg 'funny|hilarious'")
    , ("M-<F6>",                    spawn "randbg 'elegant|simple|minimalistic'")
    , ("M-<F7>",                    spawn "randbg 'music|electro|minimal|party'")
    , ("M-<F8>",                    spawn "randbg 'graffiti|streetart'")
    , ("M-<F9>",                    spawn "randbg 'fractals|fractal'")
    , ("M-<F10>",                   spawn "randbg 'computer|tech|technic|programming'")
    , ("M-<F11>",                   spawn "randbg 'nature|landscape'")
    -- Multimedia keys
    , ("<XF86AudioLowerVolume>",    spawn "amixer set Master 2%- unmute")
    , ("<XF86AudioRaiseVolume>",    spawn "amixer set Master 2%+ unmute")
    , ("<XF86AudioMute>",           spawn "amixer set Master toggle")
    , ("<XF86MonBrightnessDown>",   spawn "xbacklight -10")
    , ("<XF86MonBrightnessUp>",     spawn "xbacklight +10")
    , ("<XF86KbdBrightnessDown>",   spawn "sudo /home/nik/bin/keyboard-backlight down")
    , ("<XF86KbdBrightnessUp>",     spawn "sudo /home/nik/bin/keyboard-backlight up")
    ]
