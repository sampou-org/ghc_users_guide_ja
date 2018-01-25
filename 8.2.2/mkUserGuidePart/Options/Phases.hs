module Options.Phases where

import Types

phaseOptions :: [Flag]
phaseOptions =
  [ flag { flagName = "-F"
         , flagDescription =
           ":ref:`pre-processor <pre-processor>` を使えるようにする． " ++
           "(:ghc-flag:`-pgmF ⟨cmd⟩` で設定する)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-E"
         , flagDescription = "プリプロセッサ実行まで (``.hspp`` ファイル)"
         , flagType = ModeFlag
         }
  , flag { flagName = "-C"
         , flagDescription = "C 生成まで (``.hc`` ファイル)"
         , flagType = ModeFlag
         }
  , flag { flagName = "-S"
         , flagDescription = "アセンブリ生成まで (``.s`` ファイル)"
         , flagType = ModeFlag
         }
  , flag { flagName = "-c"
         , flagDescription = "オブジェクトファイル生成まで (``.o`` ファイル)"
         , flagType = ModeFlag
         }
  , flag { flagName = "-x ⟨suffix⟩"
         , flagDescription = "ソースファイルの種類に対してデフォルトではない動作"
         , flagType = DynamicFlag
         }
  ]
