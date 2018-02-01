module Options.PhaseSpecific where

import Types

phaseSpecificOptions :: [Flag]
phaseSpecificOptions =
  [ flag { flagName = "-optL ⟨option⟩"
         , flagDescription = "⟨option⟩ を文芸的コードのプリプロセッサに渡す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-optP ⟨option⟩"
         , flagDescription = "⟨option⟩ を cpp に渡す(``-cpp`` を指定したときのみ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-optF ⟨option⟩"
         , flagDescription = "⟨option⟩ をカスタムプリプロセッサに渡す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-optc ⟨option⟩"
         , flagDescription = "⟨option⟩ を C コンパイラに渡す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-optlo ⟨option⟩"
         , flagDescription = "⟨option⟩ を LLVM 最適化器に渡す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-optlc ⟨option⟩"
         , flagDescription = "⟨option⟩ を LLVM コンパイラに渡す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-opta ⟨option⟩"
         , flagDescription = "⟨option⟩ をアセンブラに渡す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-optl ⟨option⟩"
         , flagDescription = "⟨option⟩ をリンカに渡す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-optdll ⟨option⟩"
         , flagDescription = "⟨option⟩ を DLL 生成器に渡す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-optwindres ⟨option⟩"
         , flagDescription = "⟨option⟩ を ``windres`` に渡す"
         , flagType = DynamicFlag
         }
  ]
