module Options.Optimizations where

import Types

optimizationsOptions :: [Flag]
optimizationsOptions =
  [ flag { flagName = "-fcall-arity"
         , flagDescription =
           "コール・アリティ最適化を有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-call-arity"
         }
  , flag { flagName = "-fcase-merge"
         , flagDescription = "case式併合を有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-case-merge"
         }
  , flag { flagName = "-fcase-folding"
         , flagDescription = "case 式での定数畳み込みを有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-case-folding"
         }
  , flag { flagName = "-fcmm-elim-common-blocks"
         , flagDescription =
           "Cmm の共通ブロック除去を有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-cmm-elim-common-blocks"
         }
  , flag { flagName = "-fcmm-sink"
         , flagDescription = "Cmm シンキングを有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-cmm-sink"
         }
  , flag { flagName = "-fcpr-anal"
         , flagDescription =
           "デマンド解析器での CPR 解析を有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-cpr-anal"
         }
  , flag { flagName = "-fcse"
         , flagDescription =
           "共通部分式除去を有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-cse"
         }
  , flag { flagName = "-fdicts-cheap"
         , flagDescription =
           "辞書の値になる式のコストを最適化器が安く見積るようにする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-dicts-cheap"
         }
  , flag { flagName = "-fdicts-strict"
         , flagDescription = "辞書を正格にする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-dicts-strict"
         }
  , flag { flagName = "-fdmd-tx-dict-sel"
         , flagDescription =
           "辞書選択子専用の要求変換子を使う． "++
           "つねにデフォルトで有効"
         , flagType = DynamicFlag
         , flagReverse = "-fno-dmd-tx-dict-sel"
         }
  , flag { flagName = "-fdo-eta-reduction"
         , flagDescription = "η-簡約を有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-do-eta-reduction"
         }
  , flag { flagName = "-fdo-lambda-eta-expansion"
         , flagDescription =
           "λ-η 展開を有効にする． つねにデフォルトで有効"
         , flagType = DynamicFlag
         , flagReverse = "-fno-do-lambda-eta-expansion"
         }
  , flag { flagName = "-feager-blackholing"
         , flagDescription =
           ":ref:`先行ブラックホール化 <parallel-compile-options>` を有効にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fenable-rewrite-rules"
         , flagDescription =
           "(多重定義された関数の自動特定により生成された規則を含む) " ++
           "すべての書き換え規則を有効にする． " ++
           ":ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-enable-rewrite-rules"
         }
  , flag { flagName = "-fexcess-precision"
         , flagDescription = "中間精度超過を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-excess-precision"
         }
  , flag { flagName = "-fexpose-all-unfoldings"
         , flagDescription =
           "非常に大きい関数，再帰関数を含めすべての展開を露出する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-expose-all-unfoldings"
         }
  , flag { flagName = "-ffloat-in"
         , flagDescription =
           "float-in 変換を有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-float-in"
         }
  , flag { flagName = "-ffull-laziness"
         , flagDescription =
           "完全遅延性最適化変換(束縛の外側への移動)を有効にする． "++
           ":ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-full-laziness"
         }
  , flag { flagName = "-ffun-to-thunk"
         , flagDescription =
           "関数が引数を全く使っていない場合， " ++
           "関数クロージャをサンクに変換できるようにする． " ++
           "デフォルトでは無効"
         , flagType = DynamicFlag
         , flagReverse = "-fno-fun-to-thunk"
         }
  , flag { flagName = "-fignore-asserts"
         , flagDescription =
           "ソースプログラム中のアサーションを無視する． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-ignore-asserts"
         }
  , flag { flagName = "-fignore-interface-pragmas"
         , flagDescription =
           "インターフェイスファイル中のプラグマを無視する． :ghc-flag:`-O0` でのみ有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-ignore-interface-pragmas"
         }
  , flag { flagName = "-flate-dmd-anal"
         , flagDescription =
           "単純化パイプラインの最後に要求解析を再度走らせる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-late-dmd-anal"
         }
  , flag { flagName = "-fliberate-case"
         , flagDescription =
           "liberate-case 変換を有効にする． :ghc-flag:`-O2` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-liberate-case"
         }
  , flag { flagName = "-fliberate-case-threshold=⟨n⟩"
         , flagDescription =
           "*デフォルト: 2000* liberate-case 変換の回数を ⟨n⟩ に設定する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-liberate-case-threshold"
         }
  , flag { flagName = "-floopification"
         , flagDescription =
           "自己再帰的飽和末尾呼び出しを " ++
           "アセンブリ生成時にローカルジャンプに変換する． " ++
           ":ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-loopification"
         }
  , flag { flagName = "-fmax-inline-alloc-size=⟨n⟩"
         , flagDescription =
           "*デフォルト: 128* インライン配列の割り当ての最大サイズを⟨n⟩バイトに設定する． " ++
           "GHC は苗床ブロックに，静的に判明しているサイズの非固定配列を⟨n⟩バイトで割り当てる． " ++
           "GC の過熱を無視しての割り当てになる． " ++
           "この値はブロックサイズ（通常は4096）よりもかなり小さくする必要がある"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fmax-inline-memcpy-insns=⟨n⟩"
         , flagDescription =
           "*デフォルト: 32*  展開後の疑似命令が⟨n⟩バイトを超えない場合 " ++
           "`memcpy` の呼び出しをインライン展開する．"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fmax-inline-memset-insns=⟨n⟩"
         , flagDescription =
           "*デフォルト: 32*  展開後の疑似命令が⟨n⟩バイトを超えない場合 " ++
           "`memset` の呼び出しをインライン展開する．"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fmax-relevant-binds=⟨n⟩"
         , flagDescription =
           "*デフォルト: 6* エラーメッセージに表示する束縛の最大数を設定する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-max-relevant-bindings"
         }
  , flag { flagName = "-fmax-uncovered-patterns=⟨n⟩"
         , flagDescription =
           "*デフォルト: 4* パターンが網羅的でない警告において" ++
           "表示するパターンの最大数を設定する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fmax-simplifier-iterations=⟨n⟩"
         , flagDescription =
           "*デフォルト: 4* 単純化器の反復最大数を設定する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fmax-worker-args=⟨n⟩"
         , flagDescription =
           "*デフォルト: 10* この数までのワーカー引数はアンパックされない"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-opt-coercion"
         , flagDescription = "強制変換最適化を無効にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-pre-inlining"
         , flagDescription = "事前インライン展開を無効にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-state-hack"
         , flagDescription =
           "実世界トークンを引数とするλ抽象式をシングルエントリーであるとみなす “state hack” を無効にする． " ++
           "これにより，その内部のものをインライン化してもよいことになる"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fomit-interface-pragmas"
         , flagDescription =
           "インターフェイスプラグマを生成しない． :ghc-flag:`-O0` でのみ有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-omit-interface-pragmas"
         }
  , flag { flagName = "-fomit-yields"
         , flagDescription =
           "メモリ確保がない場合，GHC がヒープ検査を省略するようする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-omit-yields"
         }
  , flag { flagName = "-foptimal-applicative-do"
         , flagDescription =
           "遅いがよりよい ApplicativeDo のアルゴリズムを使う"
         , flagType = DynamicFlag
         , flagReverse = "-fno-optimal-applicative-do"
         }
  , flag { flagName = "-fpedantic-bottoms"
         , flagDescription =
           "GHC が底値(ボトム，⊥)をより精密に扱うようにする " ++
           "(ただし :ghc-flag:`-fno-state-hack` も参照のこと)． " ++
           "具体的には，case 式を通しての η 展開が行われなくなる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-pedantic-bottoms"
         }
  , flag { flagName = "-fregs-graph"
         , flagDescription =
           "ネイティブコード生成器において，グラフ彩色レジスタ割り付けを使う" ++
           ":ghc-flag:`-O2` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-regs-graph"
         }
  , flag { flagName = "-fregs-iterative"
         , flagDescription =
           "ネイティブコード生成器において，反復合併グラフ彩色レジスタ割り付けを使う"
         , flagType = DynamicFlag
         , flagReverse = "-fno-regs-iterative"
         }
  , flag { flagName = "-fsimplifier-phases=⟨n⟩"
         , flagDescription =
           "*デフォルト: 2* 単純化器のフェーズ数を⟨n⟩に設定する． " ++
           ":ghc-flag:`-O0` を指定するとこの値は無視する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fsimpl-tick-factor=⟨n⟩"
         , flagDescription =
           "*デフォルト: 100* 単純化器の tick に対するパーセンテージ係数を設定する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fspec-constr"
         , flagDescription =
           "SpecConstr 変換を有効にする． :ghc-flag:`-O2` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-spec-constr"
         }
  , flag { flagName = "-fspec-constr-count=⟨n⟩"
         , flagDescription =
           "デフォルト: 3* SpecConstr 変換による1つの関数に対する特定の最大数を⟨n⟩に設定する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-spec-constr-count"
         }
  , flag { flagName = "-fspec-constr-threshold=⟨n⟩"
         , flagDescription =
           "*デフォルト: 2000.* SpecConstr 変換用のサイズ閾値を⟨n⟩に設定する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-spec-constr-threshold"
         }
  , flag { flagName = "-fspecialise"
         , flagDescription =
           "多重定義関数の特定を有効にする． :ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-specialise"
         }
  , flag { flagName = "-fcross-module-specialise"
         , flagDescription =
           "他のモジュール由来の多重定義関数の特定を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-cross-module-specialise"
         }
  , flag { flagName = "-fstatic-argument-transformation"
         , flagDescription = "静的引数変換を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-static-argument-transformation"
         }
  , flag { flagName = "-fstrictness"
         , flagDescription = "正格性解析を有効にする． " ++
           ":ghc-flag:`-O` で有効になり :ghc-flag:`-fworker-wrapper` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-strictness"
         }
  , flag { flagName = "-fstrictness-before=⟨n⟩"
         , flagDescription =
           "単純化器フェーズ⟨n⟩の前に正格性解析を追加で走らせる"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-funbox-small-strict-fields"
         , flagDescription =
           "ポインタサイズ以下の表現をもつ正格性構成子を平坦化する． " ++
           ":ghc-flag:`-O` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-fno-unbox-small-strict-fields"
         }
  , flag { flagName = "-funbox-strict-fields"
         , flagDescription = "正格性構成子を平坦化する"
         , flagType = DynamicFlag
         , flagReverse = "-fno-unbox-strict-fields"
         }
  , flag { flagName = "-funfolding-creation-threshold=⟨n⟩"
         , flagDescription = "*デフォルト: 750* 展開設定の微調整"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-funfolding-dict-discount=⟨n⟩"
         , flagDescription = "*デフォルト: 30* 展開設定の微調整"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-funfolding-fun-discount=⟨n⟩"
         , flagDescription = "*デフォルト: 60* 展開設定の微調整"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-funfolding-keeness-factor=⟨n⟩"
         , flagDescription = "*デフォルト: 1.5* 展開設定の微調整"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-funfolding-use-threshold=⟨n⟩"
         , flagDescription = "*デフォルト: 60* 展開設定の微調整"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fvectorisation-avoidance"
         , flagDescription =
           "ベクトル化回避を有効にする． つねにデフォルトで有効"
         , flagType = DynamicFlag
         , flagReverse = "-fno-vectorisation-avoidance"
         }
  , flag { flagName = "-fvectorise"
         , flagDescription = "入れ子になったデータ並列のベクトル化を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-vectorise"
         }
  , flag { flagName = "-fworker-wrapper"
         , flagDescription =
           "正格性解析パスの後の worker-wrapper 変換を有効にする． " ++
           ":ghc-flag:`-O` および :ghc-flag:`-fstrictness` で有効になる． " ++
           ":ghc-flag:`-fno-strictness` で無効になる． " ++
           "正格性解析が無効(:ghc-flag:`-fno-strictness`)のときに " ++
           ":ghc-flag:`-fworker-wrapper` を有効にしても何の効果もない"
         , flagType = DynamicFlag
         , flagReverse = "-fno-worker-wrapper"
         }
  ]
