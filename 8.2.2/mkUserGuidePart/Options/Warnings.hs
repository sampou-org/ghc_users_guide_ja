module Options.Warnings where

import Types

warningsOptions :: [Flag]
warningsOptions =
  [ flag { flagName = "-W"
         , flagDescription = "通常の警告を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-w"
         }
  , flag { flagName = "-w"
         , flagDescription = "すべての警告を無効にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-Wall"
         , flagDescription =
           "ほぼすべての警告を有効にする (詳細は :ref:`options-sanity` にある)"
         , flagType = DynamicFlag
         , flagReverse = "-w"
         }
  , flag { flagName = "-Wcompat"
         , flagDescription =
           "将来の互換性のための警告を有効にする " ++
           "(詳細は :ref:`options-sanity` にある)"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-compat"
         }
  , flag { flagName = "-Werror"
         , flagDescription = "警告を致命的エラーにする"
         , flagType = DynamicFlag
         , flagReverse = "-Wwarn"
         }
  , flag { flagName = "-Werror=⟨wflag⟩"
         , flagDescription = "指定した警告を致命的エラーにする"
         , flagType = DynamicFlag
         , flagReverse = "-Wwarn=⟨wflag⟩"
         }
  , flag { flagName = "-Wwarn"
         , flagDescription = "警告を致命的エラーにしない"
         , flagType = DynamicFlag
         , flagReverse = "-Werror"
         }
  , flag { flagName = "-Wwarn=⟨wflag⟩"
         , flagDescription = "指定した警告を致命的エラーにしない"
         , flagType = DynamicFlag
         , flagReverse = "-Werror=⟨wflag⟩"
         }
  , flag { flagName = "-Wunrecognised-warning-flags"
         , flagDescription =
           "認識できない ``-W...`` フラグがコマンドラインで指定されたとき " ++
           "警告を出す"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unrecognised-warning-flags"
         }
  , flag { flagName = "-fshow-warning-groups"
         , flagDescription = "どのグループ所属の警告が出たかを表示する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-show-warning-groups"
         }
  , flag { flagName = "-fdefer-type-errors"
         , flagDescription =
           "型エラーを警告にし :ref:`そのエラーの発動を実行時まで遅延する． <defer-type-errors>` " ++
           "これを有効にすると :ghc-flag:`-fdefer-typed-holes` および " ++
           ":ghc-flag:`-fdefer-out-of-scope-variables` が有効になる． " ++
           ":ghc-flag:`-Wdeferred-type-errors` も参照のこと"
         , flagType = DynamicFlag
         , flagReverse = "-fno-defer-type-errors"
         }
  , flag { flagName = "-fdefer-typed-holes"
         , flagDescription =
           ":ref:`型付ホール <typed-holes>` のエラーを警告にし " ++
           ":ref:`そのエラーを実行時まで遅延 <defer-type-errors>` する． " ++
           "これは :ghc-flag:`-fdefer-type-errors` を設定すると有効になる． " ++
           ":ghc-flag:`-Wtyped-holes` も参照のこと"
         , flagType = DynamicFlag
         , flagReverse = "-fno-defer-typed-holes"
         }
  , flag { flagName = "-fdefer-out-of-scope-variables"
         , flagDescription =
           "変数の有効範囲外エラーを警告に変更する． "++
           "これは :ghc-flag:`-fdefer-type-errors` を設定すると有効になる． "++
           ":ghc-flag:`-Wdeferred-out-of-scope-variables` も参照のこと"
         , flagType = DynamicFlag
         , flagReverse = "-fno-defer-out-of-scope-variables"
         }
  , flag { flagName = "-fhelpful-errors"
         , flagDescription = "綴り間違いの名前について推測した名前を提案する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-helpful-errors"
         }
  , flag { flagName = "-freverse-errors"
         , flagDescription =
           "GHC/GHCi でエラーをソースコード位置の逆順で表示する"
           
         , flagType = DynamicFlag
         , flagReverse = "-fno-reverse-errors"
         }
  , flag { flagName = "-fmax-errors"
         , flagDescription =
           "GHC/GHCi で表示するエラーの上限を設定する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-max-errors"
         }
  , flag { flagName = "-Wdeprecated-flags"
         , flagDescription =
           "コマンドラインで非推奨のフラグを用いたときに警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-deprecated-flags"
         }
  , flag { flagName = "-Wduplicate-constraints"
         , flagDescription =
           "型シグネチャで制約が重複して現れたときに警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-duplicate-constraints"
         }
  , flag { flagName = "-Wduplicate-exports"
         , flagDescription = "エクスポートリストに重複したエントリーがあるときに警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-duplicate-exports"
         }
  , flag { flagName = "-Whi-shadowing"
         , flagDescription =
           "現在のディレクトリにある ``.hi`` ファイルがライブラリをシャドウしたときに警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-hi-shadowing"
         }
  , flag { flagName = "-Widentities"
         , flagDescription =
           "Prelude の数値変換が恒等変換と推測される場合 "++
           "(省略可能) に警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-identities"
         }
  , flag { flagName = "-Wimplicit-prelude"
         , flagDescription = "Prelude が暗黙にインポートされた場合に警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-implicit-prelude"
         }
  , flag { flagName = "-Wincomplete-patterns"
         , flagDescription = "パターン照合が失敗する可能性があるとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-incomplete-patterns"
         }
  , flag { flagName = "-Wincomplete-uni-patterns"
         , flagDescription =
           "λ 抽象式あるいはパターン束縛でのパターン照合が" ++
           "失敗する可能性があるとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-incomplete-uni-patterns"
         }
  , flag { flagName = "-fmax-pmcheck-iterations=⟨n⟩"
         , flagDescription =
           "パターン照合検査の反復上限を設定する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-Wincomplete-record-updates"
         , flagDescription = "レコードの更新が失敗する可能性があるとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-incomplete-record-updates"
         }
  , flag { flagName = "-Wmissing-fields"
         , flagDescription = "レコードフィールドの初期化が不完全のとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-fields"
         }
  , flag { flagName = "-Wmissing-import-lists"
         , flagDescription =
           "インポート宣言がインポートリストで有効範囲に 持ち込む名前を列挙しないとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-fnowarn-missing-import-lists"
         }
  , flag { flagName = "-Wmissing-methods"
         , flagDescription = "クラスメソッドが未定義のとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-methods"
         }
  , flag { flagName = "-Wmissing-signatures"
         , flagDescription = "トップレベルの関数が型シグネチャを持たないとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-signatures"
         }
  , flag { flagName = "-Wmissing-exported-sigs"
         , flagDescription =
           "*(非推奨)* " ++
           "型シグネチャを持たないトップレベルの関数がエクスポートされているときにのみ警告する． " ++
           "これは -Wmissing-signatures より優先される"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-exported-sigs"
         }
  , flag { flagName = "-Wmissing-exported-signatures"
         , flagDescription =
           "型シグネチャを持たないトップレベルの関数がエクスポートされているときにのみ警告する． " ++
           "これは -Wmissing-signatures より優先される"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-exported-signatures"
         }
  , flag { flagName = "-Wmissing-local-sigs"
         , flagDescription =
           "*(非推奨)* " ++
           "型シグネチャのない多相の局所的束縛について警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-local-sigs"
         }
  , flag { flagName = "-Wmissing-local-signatures"
         , flagDescription =
           "型シグネチャのない多相の局所的束縛について警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-local-signatures"
         }
  , flag { flagName = "-Wmissing-monadfail-instances"
         , flagDescription =
           "do-ブロックで失敗する可能性のあるパターンが使われ " ++
           "``MonadFail`` のインスタンスでないときに警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-monadfail-instances"
         }
  , flag { flagName = "-Wsemigroup"
         , flagDescription =
           "``Monoid`` であって ``Semigroup`` のインスタンスではなく " ++
           "``Semigroup`` で定義された ``(<>)`` を使っているとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-semigroup"
         }
  , flag { flagName = "-Wmissed-specialisations"
         , flagDescription =
           "インポートされた多重定義の関数の特定に失敗したとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missed-specialisations"
         }
  , flag { flagName = "-Wall-missed-specialisations"
         , flagDescription =
           "多重定義された関数の特定に失敗したとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-all-missed-specialisations"
         }
  , flag { flagName = "-Wmonomorphism-restriction"
         , flagDescription = "モノモルフィズム制限が適用されたとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-monomorphism-restriction"
         }
  , flag { flagName = "-Wname-shadowing"
         , flagDescription = "名前がシャドウイングされたとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-name-shadowing"
         }
  , flag { flagName = "-Wnoncanonical-monad-instances"
         , flagDescription =
           "``Applicative`` あるいは ``Monad`` のインスタンスが " ++
           "非標準の ``return``, ``pure``, ``(>>)``, あるいは ``(*>)`` の定義を持つとき警告する． " ++
           "詳細はフラグ解説 :ref:`options-sanity` 参照"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-noncanonical-monad-instances"
         }
  , flag { flagName = "-Wnoncanonical-monadfail-instances"
         , flagDescription =
           "``Monad`` あるいは ``MonadFail`` のインスタンスが " ++
           "非標準の ``fail`` の定義を持つとき警告する． " ++
           "詳細はフラグ解説 :ref:`options-sanity` 参照"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-noncanonical-monadfail-instances"
         }
  , flag { flagName = "-Wnoncanonical-monoid-instances"
         , flagDescription =
           "``Semigroup`` あるいは ``Monoid`` のインスタンスが "++
           "非標準の ``(<>)`` あるいは ``mappend`` の定義を持つとき警告する． " ++
           "詳細はフラグ解説 :ref:`options-sanity` 参照"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-noncanonical-monoid-instances"
         }
  , flag { flagName = "-Worphans"
         , flagDescription =
           "モジュールが :ref:`孤立した instance 宣言あるいは書き換え規則 <orphan-modules>` " ++
           "を持つとき警告する"           
         , flagType = DynamicFlag
         , flagReverse = "-Wno-orphans"
         }
  , flag { flagName = "-Woverlapping-patterns"
         , flagDescription = "オーバーラップしたパターンに関して警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-overlapping-patterns"
         }
  , flag { flagName = "-Wtabs"
         , flagDescription = "ソースファイルにタブ文字があると警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-tabs"
         }
  , flag { flagName = "-Wtype-defaults"
         , flagDescription = "デフォルト化が起ったとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-type-defaults"
         }
  , flag { flagName = "-Wunrecognised-pragmas"
         , flagDescription =
           "GHC が認識できないプラグマが使われていることを警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unrecognised-pragmas"
         }
  , flag { flagName = "-Wunticked-promoted-constructors"
         , flagDescription = "昇格した構成子にアポストロフィが前置されていないことを警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unticked-promoted-constructors"
         }
  , flag { flagName = "-Wunused-binds"
         , flagDescription =
           "未使用の束縛に警告する． 以下をすべて指定するのと同義． " ++
           ":ghc-flag:`-Wunused-top-binds`, :ghc-flag:`-Wunused-local-binds` および "++
           ":ghc-flag:`-Wunused-pattern-binds`"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-binds"
         }
  , flag { flagName = "-Wunused-top-binds"
         , flagDescription = "未使用のトップレベルの束縛に警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-top-binds"
         }
  , flag { flagName = "-Wunused-local-binds"
         , flagDescription = "未使用の局所定義に警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-local-binds"
         }
  , flag { flagName = "-Wunused-pattern-binds"
         , flagDescription = "未使用のパターン照合束縛に警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-pattern-binds"
         }
  , flag { flagName = "-Wunused-imports"
         , flagDescription = "不必要なインポートに警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-imports"
         }
  , flag { flagName = "-Wunused-matches"
         , flagDescription = "未使用のパターン中の変数に警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-matches"
         }
  , flag { flagName = "-Wunused-foralls"
         , flagDescription = "ユーザーの書いた ``forall`` にある未使用型変数に警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-foralls"
         }
  , flag { flagName = "-Wunused-type-variables"
         , flagDescription = "型族あるいはデータ族のインスタンス中の 未使用変数に警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-type-variables"
         }
  , flag { flagName = "-Wunused-do-bind"
         , flagDescription =
           "do-束縛で ``()`` 型以外の値を捨てているように見えるとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unused-do-bind"
         }
  , flag { flagName = "-Wwrong-do-bind"
         , flagDescription =
           "do-束縛で束縛すべきモナド値が捨てているように見えるとき警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-wrong-do-bind"
         }
  , flag { flagName = "-Wunsafe"
         , flagDescription =
           "コンパイルしようとするモジュールが unsafe と見なされる場合に警告する． " ++
           "安全性推論を使うときは, モジュールが安全かどうかを確認するために " ++
           "このフラグを使うべきである． " ++
           "すべてのモジュールタイプで機能するので, " ++
           "明示的に :ref:`Safe Haskell <safe-haskell>` モードを使用 " ++
           "(:ghc-flag:`-XTrustworthy`) している場合でも " ++
           "あらゆる仮定をコンパイラに確認するようこのフラグを使うべきである．"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-unsafe"
         }
  , flag { flagName = "-Wsafe"
         , flagDescription =
           "コンパイルしようとするモジュールが safe と見なされる場合に警告する． " ++
           "安全性推論を使うときは, モジュールが安全かどうかを確認するために " ++
           "このフラグを使うべきである． " ++
           "すべてのモジュールタイプで機能するので, " ++
           "明示的に :ref:`Safe Haskell <safe-haskell>` モードを使用 " ++
           "(:ghc-flag:`-XTrustworthy`) している場合でも " ++
           "あらゆる仮定をコンパイラに確認するようこのフラグを使うべきである．"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-safe"
         }
  , flag { flagName = "-Wtrustworthy-safe"
         , flagDescription =
           "コンパイルしようとするモジュールが " ++
           ":ghc-flag:`-XTrustworthy` マーク付きであるが, " ++
           ":ghc-flag:`-XSafe` マーク付きにするほうがより有益な境界になる場合に警告する" ++
           "このフラグを利用すると 依存関係が更新されたとき " ++
           "Safe Haskell 境界が改善できるようになったことを検出できる"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-safe"
         }
  , flag { flagName = "-Wwarnings-deprecations"
         , flagDescription =
           "``WARNING`` あるい ``DEPRECATED`` プラグマの付いた関数および型を使うと警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-warnings-deprecations"
         }
  , flag { flagName = "-Wdeprecations"
         , flagDescription =
           "``WARNING`` あるい ``DEPRECATED`` プラグマの付いた関数および型を使うと警告する" ++
           ":ghc-flag:`-Wwarnings-deprecations` の別名"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-deprecations"
         }
  , flag { flagName = "-Wamp"
         , flagDescription =
           "*(非推奨)* Applicative-Monad Proposal (AMP) と衝突する定義について警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-amp"
         }
  , flag { flagName = "-Wredundant-constraints"
         , flagDescription =
           "型シグネチャに冗長な制約があると警告する"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-redundant-constraints"
         }
  , flag { flagName = "-Wdeferred-type-errors"
         , flagDescription =
           ":ref:`deferred type errors <defer-type-errors>` が有効になっていると警告する． "
           "このオプションはデフォルトで有効． :ghc-flag:`-fdefer-type-errors` 参照"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-deferred-type-errors"
         }
  , flag { flagName = "-Wtyped-holes"
         , flagDescription =
           ":ref:`型ホール <typed-holes>` エラーが :ref:`実行時まで遅延 <defer-type-errors>` " ++
           "されているとき警告する． :ghc-flag:`-fdefer-typed-holes` 参照"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-typed-holes"
         }
  , flag { flagName = "-Wdeferred-out-of-scope-variables"
         , flagDescription =
           "変数のスコープ外エラーが実行時まで遅延されているとき警告する． " ++
           ":ghc-flag:`-fdefer-out-of-scope-variables` 参照"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-deferred-out-of-scope-variables"
         }
  , flag { flagName = "-Wpartial-type-signatures"
         , flagDescription =
           ":ghc-flag:`-XPartialTypeSignatures` が有効になっているとき "++
           "部分型シグネチャ中にホールがあれば警告する． "++
           ":ghc-flag:`-XPartialTypesignatures` が無効であれば "++
           "このようなホールがあるとエラーになります． "++
           ":ref:`partial-type-signatures` 参照"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-partial-type-signatures"
         }
  , flag { flagName = "-Wderiving-typeable"
         , flagDescription =
           "``Typeable`` クラスのインスタンスを導出する宣言がある場合 警告する． " ++
           "GHC 7.10 以降このような宣言は不要で" ++
           "GHC はこのタイプの制約を無にする独自ソルバがあるので " ++
           "このフラグは単に無視される"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-deriving-typeable"
         }
  , flag { flagName = "-Wmissing-home-modules"
         , flagDescription =
           "コマンドラインで指定されていないホームモジュールがあるとき警告する． " ++ 
           "Cabal で ``exposed-modules`` にも ``other-modules`` にもリストされていない " ++
           "モジュールを GHC が取り上げないようにするのに役立つ"
         , flagType = DynamicFlag
         , flagReverse = "-Wno-missing-home-modules"
         }
  ]
