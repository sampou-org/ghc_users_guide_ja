module Options.PhasePrograms where

import Types

phaseProgramsOptions :: [Flag]
phaseProgramsOptions =
  [ flag { flagName = "-pgmL ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ を文芸的コードのプリプロセッサとして使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgmP ⟨cmd⟩"
         , flagDescription =
           "⟨cmd⟩ を C プリプロセッサとして使う(``-cpp`` を指定したときのみ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgmc ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ を C のコンパイラとして使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgmlo ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ を LLVM 最適化器として使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgmlc ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ を LLVM コンパイラとして使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgms ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ をスプリッタとして使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgma ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ をアセンブラとして使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgml ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ をリンカとして使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgmdll ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ を DLL 生成器として使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgmF ⟨cmd⟩"
         , flagDescription = "⟨cmd⟩ を プリプロセッサとして使う(``-F`` を指定したときのみ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgmwindres ⟨cmd⟩"
         , flagDescription =
           "⟨cmd⟩ を Windows でマニフェストを埋め込むためのプログラムとして使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pgmlibtool ⟨cmd⟩"
         , flagDescription =
           "⟨cmd⟩ を libtool用のコマンドとして使う(``-staticlib`` を指定したときのみ)"
         , flagType = DynamicFlag
         }
  ]
