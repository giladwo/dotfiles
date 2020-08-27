import System.IO
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.DynamicWorkspaces
import XMonad.Config
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce


main = do
    xmproc <- spawnPipe "/usr/bin/xmobar $HOME/.config/xmobar/xmobarrc"
    xmonad $ myConfig
        { logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 120
            }
        }


myConfig = def { {- workspaces = ["1:Terminal", "2:Editor", "3:Reactor", "4:Web"] ++ map show [5..9]
               , -} manageHook = manageDocks <+> manageHook def
               , handleEventHook = docksEventHook <+> handleEventHook def
               , startupHook = spawnOnce "$HOME/.xmonad/xmonad-restart.sh" <+> setWMName "LG3D" <+> startupHook def
               , layoutHook = avoidStruts $ smartBorders $ spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True $ layoutHook def
               , borderWidth = 1
               , modMask = mod4Mask
               , focusedBorderColor = "green"
               , terminal = "urxvt +sb -tr -blr 3 -sh 30 -fg grey -bg black -fn \"xft:Bitstream Vera Sans Mono:pixelsize=12\""
               } `additionalKeysP`
               [ ("M-S-z", spawn "xscreensaver-command -lock")
               , ("M-S-r", renameWorkspace def)
               , ("M-n", nextWS)
               , ("M-b", prevWS)
               , ("M-S-n", shiftToNext)
               , ("M-S-b", shiftToPrev)
               , ("C-<Print>", spawn "scrot -sd 0.1")
               , ("<Print>", spawn "scrot")
               , ("M-<Escape>", spawn "~/bin/switch_layout.sh")
               , ("M-<F2>", spawn "amixer set -q Master 5%-")
               , ("M-<F3>", spawn "amixer set -q Master 5%+")
               ]

