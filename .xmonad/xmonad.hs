import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig

main = do
xmproc <- spawnPipe "xmobar"
xmonad $ defaultConfig
  { terminal = "urxvt"
  , manageHook = manageDocks <+> manageHook defaultConfig
  , layoutHook = avoidStruts $ layoutHook defaultConfig
  , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
  , logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn xmproc, ppOrder = \(ws:_:t:_) -> [ws,t] }
  , borderWidth = 3
  , modMask = mod4Mask
  }
  `additionalKeys`
  [ ((mod1Mask, xK_p), spawn "exe=`dmenu_path | $HOME/.cabal/bin/yeganesh -- -b -fn xft:JetBrains Mono:size=10` && eval \"exec $exe\"") ]
