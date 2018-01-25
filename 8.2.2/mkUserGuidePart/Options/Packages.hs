module Options.Packages where

import Types

packagesOptions :: [Flag]
packagesOptions =
  [ flag { flagName = "-this-unit-id ⟨unit-id⟩"
         , flagDescription =
           "⟨unit-id⟩ ユニット(たとえばパッケージ)の一部としてコンパイル"

         , flagType = DynamicFlag
         }
  , flag { flagName = "-package ⟨pkg⟩"
         , flagDescription = "パッケージ ⟨pkg⟩ の露出"
         , flagType = DynamicSettableFlag
         }
  , flag { flagName = "-hide-all-packages"
         , flagDescription = "デフォルトですべてのパッケージを隠す"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-hide-package ⟨pkg⟩"
         , flagDescription = "パッケージ ⟨pkg⟩ を隠す"
         , flagType = DynamicSettableFlag
         }
  , flag { flagName = "-ignore-package ⟨pkg⟩"
         , flagDescription = "パッケージ ⟨pkg⟩ を無視"
         , flagType = DynamicSettableFlag
         }
  , flag { flagName = "-package-db ⟨file⟩"
         , flagDescription = "⟨file⟩ をパッケージ DB スタックに追加"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-clear-package-db"
         , flagDescription = "パッケージ DB スタックをクリア"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-no-global-package-db"
         , flagDescription = "グローバルパッケージ DB をスタックから除去"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-global-package-db"
         , flagDescription = "グローバルパッケージ DB をスタックへ追加"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-no-user-package-db"
         , flagDescription = "ユーザーパッケージ DB をスタックから除去"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-user-package-db"
         , flagDescription = "ユーザーパッケージ DB をスタックへ追加"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-no-auto-link-packages"
         , flagDescription =
           "base パッケージと rts パッケージの自動リンクを無効に設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-trust ⟨pkg⟩"
         , flagDescription = "パッケージ ⟨pkg⟩ を露出し trusted に設定"
         , flagType = DynamicSettableFlag
         }
  , flag { flagName = "-distrust ⟨pkg⟩"
         , flagDescription =
           "パッケージ ⟨pkg⟩ を露出し distrusted に設定"
         , flagType = DynamicSettableFlag
         }
  , flag { flagName = "-distrust-all"
         , flagDescription = "デフォルトですべてのパッケージを distrusted に設定"
         , flagType = DynamicSettableFlag
         }
  , flag { flagName = "-package-env ⟨file⟩|⟨name⟩"
         , flagDescription = "指定したパッケージ環境を使用"
         , flagType = DynamicFlag
         }
  ]
