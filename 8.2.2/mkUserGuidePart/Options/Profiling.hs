module Options.Profiling where

import Types

profilingOptions :: [Flag]
profilingOptions =
  [ flag { flagName = "-prof"
         , flagDescription = "プロファイリングを有効にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fprof-auto"
         , flagDescription =
           "INLINEマークが付かないすべての束縛に ``SCC`` を自動付与する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-prof-auto"
         }
  , flag { flagName = "-fprof-auto-top"
         , flagDescription =
           "INLINEマークが付かないすべてのトップレベルの束縛に ``SCC`` を自動付与する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-prof-auto"
         }
  , flag { flagName = "-fprof-auto-exported"
         , flagDescription =
           "INLINEマークが付かないすべてのエクスポートされる束縛に ``SCC`` を自動付与する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-prof-auto"
         }
  , flag { flagName = "-fprof-cafs"
         , flagDescription = "すべての CAF に ``SCC`` を自動付与する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-prof-cafs"
         }
  , flag { flagName = "-fno-prof-count-entries"
         , flagDescription = "エントリー数を収集しない"
         , flagType = DynamicFlag
         , flagReverse = "-fprof-count-entries"
         }
  , flag { flagName = "-ticky"
         , flagDescription =
           ":ref:`ticky-ticky プロファイリング <ticky-ticky>` を有効にする"
         , flagType = DynamicFlag
         }
  ]
