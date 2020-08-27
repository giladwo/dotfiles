import System.Environment
import System.IO
import XMonad.Actions.CycleWS
import XMonad.Actions.DynamicWorkspaces
import XMonad.Config
import XMonad.Config.Kde
import XMonad hiding ((|||))
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.TwoPane
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce


main = do
    config <- getEnv "XDG_SESSION_DESKTOP"
    let myXmonad = xmonad . addWorkspaceKeys . sensibleDefaults
    case config of
        "" -> do
            xmproc <- spawnPipe "/usr/bin/xmobar $HOME/.config/xmobar/xmobarrc"
            myXmonad myConfig
                { logHook = dynamicLogWithPP xmobarPP
                    { ppOutput = hPutStrLn xmproc
                    , ppTitle = xmobarColor "green" "" . shorten 120
                    }
                }

        "KDE" -> do
            myXmonad kde4Config

        other -> do
            putStrLn $ "Unexpected XDG_SESSION_DESKTOP='" ++ other ++ "'. Using default XMonad config."
            myXmonad def


myConfig = def { {- workspaces = ["1:Terminal", "2:Editor", "3:Reactor", "4:Web"] ++ map show [5..9]
               , -} manageHook = manageDocks <+> manageHook def
               , handleEventHook = docksEventHook <+> handleEventHook def
               , startupHook = spawnOnce "$HOME/.xmonad/xmonad-restart.sh" <+> setWMName "LG3D" <+> startupHook def
               , modMask = mod4Mask
               } `additionalKeysP`
               [ ("M-S-z", spawn "xscreensaver-command -lock")
               , ("M-S-r", renameWorkspace def)
               , ("C-<Print>", spawn "scrot -sd 0.1")
               , ("<Print>", spawn "scrot")
               , ("M-<Escape>", spawn "~/bin/switch_layout.sh")
               , ("M-<F2>", spawn "amixer set -q Master 5%-")
               , ("M-<F3>", spawn "amixer set -q Master 5%+")
               ]


sensibleDefaults conf = conf { borderWidth = 1
                             , focusedBorderColor = "green"
                             , layoutHook = avoidStruts $ smartBorders $ spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True myLayoutHook
                             , terminal = "urxvt +sb -tr -blr 3 -sh 30 -fg grey -bg black -fn \"xft:Bitstream Vera Sans Mono:pixelsize=12\""
                             }


addWorkspaceKeys = flip additionalKeysP [ ("M-n", nextWS)
                                        , ("M-b", prevWS)
                                        , ("M-S-n", shiftToNext)
                                        , ("M-S-b", shiftToPrev)
                                        ]


myLayoutHook = tall ||| Mirror tall ||| Full ||| twoPane ||| Mirror twoPane
    where
        tall = Tall 1 (3/100) (1/2)
        twoPane = TwoPane (3/100) (1/2)
