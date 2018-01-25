module Options.Modes where

import Types

modeOptions :: [Flag]
modeOptions =
  [ flag { flagName = "--help,-?"
         , flagDescription = "ヘルプを表示"
         , flagType = ModeFlag
         }
  , flag { flagName = "--interactive"
         , flagDescription =
           "対話モード - 通常は単に ``ghci`` を走らせるたときに使用． "++
           "詳細については :ref:`ghci` 参照"
         , flagType = ModeFlag
         }
  , flag { flagName = "--make"
         , flagDescription =
           "複数のモジュールを含む Haskell のプログラムをビルド． " ++
           "依存性は自動的に検出する． " ++ "`make` を使うよりはるかに簡単で速い． " ++
           "詳細については :ref:`make-mode` を参照"
         , flagType = ModeFlag
         }
  , flag { flagName = "-e ⟨expr⟩"
         , flagDescription =
           "``expr`` を評価する． 詳細については :ref:`eval-mode` を参照"
         , flagType = ModeFlag
         }
  , flag { flagName = "--show-iface ⟨file⟩"
         , flagDescription = "インターフェイスファイルの中身を表示"
         , flagType = ModeFlag
         }
  , flag { flagName = "-M"
         , flagDescription =
           "``Makefile`` 用の依存情報生成する． " ++
           "詳細については :ref:`makefile-dependencies` を参照"
         , flagType = ModeFlag
         }
  , flag { flagName = "--frontend ⟨module⟩"
         , flagDescription =
           "指定したフロントエンドプラグインを使って GHC を走らせる． " ++
           "詳細については :ref:`frontend_plugins` を参照"
         , flagType = ModeFlag
         }
  , flag { flagName = "--supported-extensions, --supported-languages"
         , flagDescription = "サポートされている言語拡張を表示"
         , flagType = ModeFlag
         }
  , flag { flagName = "--show-options"
         , flagDescription = "サポートされているコマンドラインオプションを表示"
         , flagType = ModeFlag
         }
  , flag { flagName = "--info"
         , flagDescription = "当該コンパイラに関する情報を表示"
         , flagType = ModeFlag
         }
  , flag { flagName = "--version, -V"
         , flagDescription = "GHC のバージョンを表示"
         , flagType = ModeFlag
         }
  , flag { flagName = "--numeric-version"
         , flagDescription = "GHC のバージョンを表示(数値のみ)"
         , flagType = ModeFlag
         }
  , flag { flagName = "--print-libdir"
         , flagDescription = "GHC ライブラリのディレクトリを表示"
         , flagType = ModeFlag
         }
  ]
