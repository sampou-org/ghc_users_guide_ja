module Options.RecompilationChecking where

import Types

recompilationCheckingOptions :: [Flag]
recompilationCheckingOptions =
  [ flag { flagName = "-fforce-recomp"
         , flagDescription =
           "再コンパイル検査を無効にする． 単位ファイルをコンパイルするとき " ++
           "(すなわち :ghc-flag:`-c` を使っているとき) " ++
           "``-ddump-X`` 系のオプションが1つでも指定されていれば " ++
           "自動的に有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-force-recomp"
         }
  ]
