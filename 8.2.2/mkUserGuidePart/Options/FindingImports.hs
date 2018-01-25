module Options.FindingImports where

import Types

findingImportsOptions :: [Flag]
findingImportsOptions =
  [ flag { flagName = "-i⟨dir⟩[:⟨dir⟩]*"
         , flagDescription = "⟨dir⟩, ⟨dir2⟩, などをインポートパスに追加"
         , flagType = DynamicSettableFlag
         }
  , flag { flagName = "-i"
         , flagDescription = "インポートディレクトリの一覧を空にする"
         , flagType = DynamicSettableFlag
         }
  ]
