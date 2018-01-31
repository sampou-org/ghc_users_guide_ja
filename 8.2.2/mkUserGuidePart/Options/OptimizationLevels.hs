module Options.OptimizationLevels where

import Types

optimizationLevelsOptions :: [Flag]
optimizationLevelsOptions =
  [ flag { flagName = "-O0"
         , flagDescription = "最適化を無効にする(デフォルト)"
         , flagType = DynamicFlag
         , flagReverse = "-O"
         }
  , flag { flagName = "-O, -O1"
         , flagDescription = "レベル 1 の最適化を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-O0"
         }
  , flag { flagName = "-O2"
         , flagDescription = "レベル 2 の最適化を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-O0"
         }
  , flag { flagName = "-Odph"
         , flagDescription =
           "レベル 2 の最適化を有効にした上で， "++
           "``-fmax-simplifier-iterations=20`` および "++
           "``-fsimplifier-phases=3`` を設定する"
         , flagType = DynamicFlag
         }
  ]
