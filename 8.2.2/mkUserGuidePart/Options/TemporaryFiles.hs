module Options.TemporaryFiles where

import Types

temporaryFilesOptions :: [Flag]
temporaryFilesOptions =
  [ flag { flagName = "-tmpdir ⟨dir⟩"
         , flagDescription = "一時ファイルを置くディレクトリを設定"
         , flagType = DynamicFlag
         }
  ]
