module Options.ProgramCoverage where

import Types

programCoverageOptions :: [Flag]
programCoverageOptions =
  [ flag { flagName = "-fhpc"
         , flagDescription =
           "Haskell プログラム網羅率の計測器付与を有効にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-hpcdir ⟨dir⟩"
         , flagDescription =
           "コンパイル中に ``.mix`` ファイルを保管するディレクトリ(デフォルトは ``.hpc``)を設定する"
         , flagType = DynamicFlag
         }
  ]
