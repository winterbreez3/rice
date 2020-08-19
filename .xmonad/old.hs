import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ def
    { terminal    = myTerminal 
    ,manageHook = manageDocks <+> manageHook def
    , layoutHook = avoidStruts  $  layoutHook def
    , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    }

myTerminal    = "urxvt"
myModMask     = mod4Mask -- win key
myBorderWidth = 2
