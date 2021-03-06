..
   .. _options-optimise:

   Optimisation (code improvement)
   -------------------------------

   .. index::
      single: optimisation
      single: improvement, code

   The ``-O*`` options specify convenient "packages" of optimisation flags;
   the ``-f*`` options described later on specify *individual*
   optimisations to be turned on/off; the ``-m*`` options specify
   *machine-specific* optimisations to be turned on/off.

.. _options-optimise:

最適化 (コードの改善)
---------------------

.. index::
   single: 最適化
   single: 改善, コードの〜

``-O*`` オプションば便利な最適化フラグの「詰め合わせ」を指定するのに使います．
*個別の* 最適化を有効/無効にするには，後述する ``-f*`` オプションを使います．
*マシン固有* の最適化を有効/無効にするには ``-m*`` オプションを使います．

..
   Most of these options are boolean and have options to turn them both "on" and
   "off" (beginning with the prefix ``no-``). For instance, while ``-fspecialise``
   enables specialisation, ``-fno-specialise`` disables it. When multiple flags for
   the same option appear in the command-line they are evaluated from left to
   right. For instance, ``-fno-specialise -fspecialise`` will enable
   specialisation.

こうしたオプションのほとんどは，オプションをオン/オフする論理値になっています(オフにする場合は ``no-`` が前置されます)．
``-fspecialise`` は特定化を有効にし，``-fno-specialise`` は無効にします．
同じオプションに関して複数のフラグが1つのコマンドラインにあらわれたときは左から右への順で評価されますので，
``-fno-specialise -fspecialise`` という指定では，特定化は有効になります．

..
   It is important to note that the ``-O*`` flags are roughly equivalent to
   combinations of ``-f*`` flags. For this reason, the effect of the
   ``-O*`` and ``-f*`` flags is dependent upon the order in which they
   occur on the command line.

``-O*`` という型のフラグは大まかにいって ``-f*`` という型のフラグの組み合わせを指定しているものになっているということに注意をしてください．
したがって ``-O*`` フラグと ``-f*`` フラグの効果はコマンドライン中にあらわれる順番に依存します．

..
   For instance, take the example of ``-fno-specialise -O1``. Despite the
   ``-fno-specialise`` appearing in the command line, specialisation will
   still be enabled. This is the case as ``-O1`` implies ``-fspecialise``,
   overriding the previous flag. By contrast, ``-O1 -fno-specialise`` will
   compile without specialisation, as one would expect.

``-fno-specialise -O1`` を例にとってみましょう．
コマンドラインに ``-fno-specialise`` があっても，特定化(specialisation)は有効になります．
これは ``-O1`` が ``-fspecialise`` を有効にするので，先に指定したフラグを上書きしてしまいます．
これとは対照的に ``-O1 -fno-specialise`` のようにすると予想どおり特定化は発動しません．

..
   .. _optimise-pkgs:

   ``-O*``: convenient “packages” of optimisation flags.
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   There are *many* options that affect the quality of code produced by
   GHC. Most people only have a general goal, something like "Compile
   quickly" or "Make my program run like greased lightning." The following
   "packages" of optimisations (or lack thereof) should suffice.

.. _optimise-pkgs:

``-O*``: 便利な最適化フラグの「詰め合わせ」
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHCが生成するコードの質に影響を与えるオプションは *大量に* あります．
ほとんどの人にとっては，最適化の目標は「素早くコンパイルする」とか「電光石火のごとく走るプログラムコードを生成する」など一般的なものです．
したがって，以下にしめすような最適化の「詰め合わせ」を指定(あるいは指定しない)する選択をするだけで十分です．

..
   Note that higher optimisation levels cause more cross-module
   optimisation to be performed, which can have an impact on how much of
   your program needs to be recompiled when you change something. This is
   one reason to stick to no-optimisation when developing code.

最適化のレベルを高くすると，モジュールを跨ぐ最適化が増えます．
これは，ソースコードを変更したときにどの程度の再コンパイルする必要があるかに大きく影響します．
これは開発中は最適化をしないようにすることの理由の1つです．

..
   .. ghc-flag:: -O*

       This is taken to mean: “Please compile quickly; I'm not
       over-bothered about compiled-code quality.” So, for example:
       ``ghc -c Foo.hs``

.. ghc-flag:: -O*

    このフラグの意味は「速くコンパイルしてね，生成したコードのインスタンスについてはうるさいことは言わないから」です．
    たとえば ``ghc -c Foo.hs`` のようにします．

..
   .. ghc-flag:: -O0

       Means "turn off all optimisation", reverting to the same settings as
       if no ``-O`` options had been specified. Saying ``-O0`` can be
       useful if e.g. ``make`` has inserted a ``-O`` on the command line
       already.

.. ghc-flag:: -O0

    「すべての最適化を無効にする」という意味です． ``-O``オプションを全く指定しないのと同じ状態にするということです．
    わざわざ ``-O0`` を指定するのは ``make`` が既に ``-O`` オプションを指定してしまっているときに便利です．

..
   .. ghc-flag:: -O
		 -O1

       .. index::
	  single: optimise; normally

       Means: "Generate good-quality code without taking too long about
       it." Thus, for example: ``ghc -c -O Main.lhs``

.. ghc-flag:: -O
              -O1

    .. index::
       single: 最適化する; 通常の〜

    「高品質のコードをそれほど時間をかけないで生成する」という意味です．
    ``ghc -c -O Main.lhs`` のように使います．

..
   .. ghc-flag:: -O2

       .. index::
	  single: optimise; aggressively

       Means: "Apply every non-dangerous optimisation, even if it means
       significantly longer compile times."

       The avoided "dangerous" optimisations are those that can make
       runtime or space *worse* if you're unlucky. They are normally turned
       on or off individually.

.. ghc-flag:: -O2

    .. index::
       single: 最適化する; アグレッシブに〜

    「危険のない最適化をすべて適用する．コンパイルにかなりの時間を書けてもよい」という意味です．

    ここで回避しようとしている「危険な」最適化とは，運が悪ければ，実行時における時間・空間性能を *悪化させる* 可能性があるということです．
    通常これらの最適化は個別に指定します．

..
   .. ghc-flag:: -Odph

       .. index::
	  single: optimise; DPH

       Enables all ``-O2`` optimisation, sets
       ``-fmax-simplifier-iterations=20`` and ``-fsimplifier-phases=3``.
       Designed for use with :ref:`Data Parallel Haskell (DPH) <dph>`.

.. ghc-flag:: -Odph

    .. index::
       single: 最適化する; DPH〜

    すべての ``-O2`` の最適化を有効にした上で ``-fmax-simplifier-iterations=20`` と ``-fsimplifier-phases=3`` を設定します．
    :ref:`Data Parallel Haskell (DPH) <dph>` を使うときように設計されました．

..
   We don't use a ``-O*`` flag for day-to-day work. We use ``-O`` to get
   respectable speed; e.g., when we want to measure something. When we want
   to go for broke, we tend to use ``-O2`` (and we go for lots of coffee
   breaks).

   The easiest way to see what ``-O`` (etc.) “really mean” is to run with
   :ghc-flag:`-v`, then stand back in amazement.

日常の作業で ``-O*`` フラグを使うことはありません．
それなりの速度が必要なときには ``-O`` を使います．
たとえば，何かを計測したいときなどです．
ちょっと休憩したいときには ``-O2`` を使い(たっぷりのコーヒーブレイクに行き)ます．

``-O`` (など)の「実際の意味」を知りたければ :ghc-flag:`-v` を付ければいいでしょう．
びっくりして，後ずさりすることになるでしょうね．

..
   .. _options-f:

   ``-f*``: platform-independent flags
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   .. index::
      single: -f\* options (GHC)
      single: -fno-\* options (GHC)

   These flags turn on and off individual optimisations. Flags marked as
   on by default are enabled by ``-O``, and as such you shouldn't
   need to set any of them explicitly. A flag ``-fwombat`` can be negated
   by saying ``-fno-wombat``. See :ref:`options-f-compact` for a compact
   list.

.. _options-f:

``-f*``: プラットフォーム非依存のフラグ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. index::
   single: -f\* オプション (GHC)
   single: -fno-\* オプション (GHC)

これらのフラグは個々の最適化を有効/無効にするのに使います．
``-O`` を使えば，「デフォルトで有効」となっているフラグをすべて有効にできます．
したがって，明示的に指定する必要はないはずです．
``-fwombat`` というフラグの否定は ``-fno-wombat`` です．概略の一覧表は :ref:`options-f-compact` を参照してください．

..
   .. ghc-flag:: -fcase-merge

       :default: on

       Merge immediately-nested case expressions that scrutinse the same variable.
       For example, ::

	     case x of
		Red -> e1
		_   -> case x of 
			 Blue -> e2
			 Green -> e3

       Is transformed to, ::

	     case x of
		Red -> e1
		Blue -> e2
		Green -> e2

.. ghc-flag:: -fcase-merge

    :default: 有効

    直接入れ子になった case 式の検査対象が同じ変数である場合，1つにまとめます．
    たとえば， ::

          case x of
             Red -> e1
             _   -> case x of 
                      Blue -> e2
                      Green -> e3

    は以下のよう変換する． ::

          case x of
             Red -> e1
             Blue -> e2
             Green -> e2

..
   .. ghc-flag:: -fcall-arity

       :default: on

       Enable call-arity analysis.

.. ghc-flag:: -fcall-arity

    :default: 有効

    コール・アリティ解析を有効にします．

..
   .. ghc-flag:: -fcmm-elim-common-blocks

       :default: on

       Enables the common block elimination optimisation
       in the code generator. This optimisation attempts to find identical
       Cmm blocks and eliminate the duplicates.

.. ghc-flag:: -fcmm-elim-common-blocks

    :default: 有効

    コード生成器における共通ブロック除去を有効にします．
    この最適化の目的は，同一の Cmm ブロックを探し，それを除去します．

..
   .. ghc-flag:: -fcmm-sink

       :default: on

       Enables the sinking pass in the code generator.
       This optimisation attempts to find identical Cmm blocks and
       eliminate the duplicates attempts to move variable bindings closer
       to their usage sites. It also inlines simple expressions like
       literals or registers.

.. ghc-flag:: -fcmm-sink

    :default: 有効

    コード生成器におけるシンキング(コード位置を後ろにずらすこと)のパスを有効にします．
    この最適化の目的は Cmm の同一のブロックを探すことです．
    その重複を除去すれば変数束縛を使う場所に近づけられます．
    このパスではリテラルやレジスタなどの単純な式を埋め込みます．

..
   .. ghc-flag:: -fcpr-off

       Switch off CPR analysis in the demand analyser.

.. ghc-flag:: -fcpr-off

    デマンド解析器における CPR 解析を無効にする．

..
   .. ghc-flag:: -fcse

       :default: on

       Enables the common-sub-expression elimination
       optimisation. Switching this off can be useful if you have some
       ``unsafePerformIO`` expressions that you don't want commoned-up.

.. ghc-flag:: -fcse

    :default: 有効

    共通部分式除去の最適化を有効にします．
    共通式としてまとめたくないような ``unsafePerformIO`` 式を使っている場合にはこれを無効にするのが便利です．

..
   .. ghc-flag:: -fdicts-cheap

       A very experimental flag that makes dictionary-valued expressions
       seem cheap to the optimiser.

.. ghc-flag:: -fdicts-cheap

    かなり実験的なフラグで，辞書を値にもつような式のコストを最適化器が安く見積るようにします．

..
   .. ghc-flag:: -fdicts-strict

       Make dictionaries strict.

.. ghc-flag:: -fdicts-strict

    辞書を正格にします．

..
   .. ghc-flag:: -fdmd-tx-dict-sel

       *On by default for ``-O0``, ``-O``, ``-O2``.*

       Use a special demand transformer for dictionary selectors.

.. ghc-flag:: -fdmd-tx-dict-sel

    *オプション ``-O0`` ， ``-O`` ， ``-O2`` のもとではデフォルトで有効*

    辞書選択子ように特別な要求変換子を使います．

..
   .. ghc-flag:: -fdo-eta-reduction

       :default: on

       Eta-reduce lambda expressions, if doing so gets rid of a whole group of
       lambdas.

.. ghc-flag:: -fdo-eta-reduction

    :default: 有効

    λ抽象式をη簡約することで，複数のλ抽象式をまとめて除去できるなら，そうします．

..
   .. ghc-flag:: -fdo-lambda-eta-expansion

       :default: on

       Eta-expand let-bindings to increase their arity.

.. ghc-flag:: -fdo-lambda-eta-expansion

    :default: 有効

    アリティを増やすために let 束縛をη展開します．

..
   .. ghc-flag:: -feager-blackholing

       Usually GHC black-holes a thunk only when it switches threads. This
       flag makes it do so as soon as the thunk is entered. See `Haskell on
       a shared-memory
       multiprocessor <http://research.microsoft.com/en-us/um/people/simonpj/papers/parallel/>`__.

.. ghc-flag:: -feager-blackholing

    通常 GHC はスレッドを切り替える場合にのみサンクをブラックホール化します．
    このフラグは，サンクに入ってすぐにこれを行うようにします．
    以下を参照してください． `Haskell on a shared-memory
    multiprocessor <http://research.microsoft.com/en-us/um/people/simonpj/papers/parallel/>`__.

..
   .. ghc-flag:: -fexcess-precision

       When this option is given, intermediate floating point values can
       have a *greater* precision/range than the final type. Generally this
       is a good thing, but some programs may rely on the exact
       precision/range of ``Float``/``Double`` values and should not use
       this option for their compilation.

       Note that the 32-bit x86 native code generator only supports
       excess-precision mode, so neither ``-fexcess-precision`` nor
       ``-fno-excess-precision`` has any effect. This is a known bug, see
       :ref:`bugs-ghc`.

.. ghc-flag:: -fexcess-precision

    このオプションを指定すると，中間の浮動小数点数が最終的な型よりも *大きな* 精度/範囲をもつことを許すことになります．
    このことは一般的には良いことです．
    しかし ``Float``/``Double`` 値がその精度/範囲に正確におさまっていることに依存するプログラムが存在することもあり，
    そのようなプログラムにはこのオプションを指定してコンパイルしてはいけません．

    32-bit x86 のネイティブコード生成器は excess-precision モードしかサポートしておらず ``-fexcess-precision`` も
    ``-fno-excess-precision`` も効果を持ちません．これは既知のバグです． :ref:`bugs-ghc` を参照してください．

..
   .. ghc-flag:: -fexpose-all-unfoldings

       An experimental flag to expose all unfoldings, even for very large
       or recursive functions. This allows for all functions to be inlined
       while usually GHC would avoid inlining larger functions.

.. ghc-flag:: -fexpose-all-unfoldings

    実験的なフラグです．非常に大きな関数や再帰関数も含め，すべての展開を露出します．
    通常GHCは大きい関数をインライン化することを避けますが，このフラグによって，全ての関数がインライン化可能になります．

..
   .. ghc-flag:: -ffloat-in

       :default: on

       Float let-bindings inwards, nearer their binding
       site. See `Let-floating: moving bindings to give faster programs
       (ICFP'96) <http://research.microsoft.com/en-us/um/people/simonpj/papers/float.ps.gz>`__.

       This optimisation moves let bindings closer to their use site. The
       benefit here is that this may avoid unnecessary allocation if the
       branch the let is now on is never executed. It also enables other
       optimisation passes to work more effectively as they have more
       information locally.

       This optimisation isn't always beneficial though (so GHC applies
       some heuristics to decide when to apply it). The details get
       complicated but a simple example is that it is often beneficial to
       move let bindings outwards so that multiple let bindings can be
       grouped into a larger single let binding, effectively batching their
       allocation and helping the garbage collector and allocator.

.. ghc-flag:: -ffloat-in

    :default: 有効

    let 束縛を内側，利用位置に近づく方向に移動します．
    `Let-floating: moving bindings to give faster programs
    (ICFP'96) <http://research.microsoft.com/en-us/um/people/simonpj/papers/float.ps.gz>`__
    を参照してください．
    
    この最適化は let 束縛を仕様の位置に近づけます．
    こうすることの利点は，let の移動先の選択肢が実行されない場合，不要なメモリ領域確保を防ぐことができる点です．
    また，局所的により多くの情報が得られることになるので，他の最適化パスがより効率よく機能できることになります．

    この最適化は常によい方向の効果があるというわけではありません．
    そういうわけで，GHC はこれを適用するかどうかをある種のヒューリスティクスを使って決定しています．
    詳細は複雑ですが，この最適化がよい効果をもたらさない単純な例としては，let 束縛を外側に移動することで，
    複数の束縛を1つの大きな束縛にまとめ，メモリ領域の確保を一度に行うことで，ガーベッジコレクタとアロケータが楽になるという場合です．

..
   .. ghc-flag:: -ffull-laziness

       :default: on

       Run the full laziness optimisation (also known as
       let-floating), which floats let-bindings outside enclosing lambdas,
       in the hope they will be thereby be computed less often. See
       `Let-floating: moving bindings to give faster programs
       (ICFP'96) <http://research.microsoft.com/en-us/um/people/simonpj/papers/float.ps.gz>`__.
       Full laziness increases sharing, which can lead to increased memory
       residency.

       .. note::
	  GHC doesn't implement complete full-laziness. When
	  optimisation in on, and ``-fno-full-laziness`` is not given, some
	  transformations that increase sharing are performed, such as
	  extracting repeated computations from a loop. These are the same
	  transformations that a fully lazy implementation would do, the
	  difference is that GHC doesn't consistently apply full-laziness, so
	  don't rely on it.

.. ghc-flag:: -ffull-laziness

    :default: 有効

    完全遅延性最適化(let-floating ともいいます)を走らせます．
    これは let 束縛を計算が少くなるようにと願って，それを囲むλ抽象の外へ移動させることです．
    これについては
    `Let-floating: moving bindings to give faster programs
    (ICFP'96) <http://research.microsoft.com/en-us/um/people/simonpj/papers/float.ps.gz>`__
    を参照してください．共有を促進する完全遅延性はメモリの使用量を増加させることになります．

    .. note::
       GHC は完全遅延性を完全には実装していません．
       最適化が有効で ``-fno-full-laziness`` が指定されていなければ，
       共有を促進するある種の変換が実施されます．
       たとえば，ループの中から繰り返し計算される部分を抽出するといった変換です．
       この変換は完全遅延の実装で行われるのと同じものですが，GHC は常に完全遅延性を適用するとは限らないので，これに頼ってはいけません．

..
   .. ghc-flag:: -ffun-to-thunk

       :default: off

       Worker-wrapper removes unused arguments, but usually we do not
       remove them all, lest it turn a function closure into a thunk,
       thereby perhaps creating a space leak and/or disrupting inlining.
       This flag allows worker/wrapper to remove *all* value lambdas.

.. ghc-flag:: -ffun-to-thunk

    :default: 無効

    worker-wrapper は使われていない引数を削除しますが，通常はクロージャをサンクにしてしまわないように，全部を削除することはしません．
    そんなことをしてしまうと，スペースリークしたり，インライン化の妨げになるからです．
    このフラグは worker/wrapper が *すべての* λ抽象値を削除できるようにします．

..
   .. ghc-flag:: -fignore-asserts

       :default: on

       Causes GHC to ignore uses of the function ``Exception.assert`` in source
       code (in other words, rewriting ``Exception.assert p e`` to ``e`` (see
       :ref:`assertions`).

.. ghc-flag:: -fignore-asserts

    :default: 有効

    ソースコード中で ``Exception.assert`` を使っていても，GHC はこれを無視し(すなわち ``Exception.assert p e`` を ``e`` に書き換え)ます(:ref:`assertions` を参照してください)．

..
   .. ghc-flag:: -fignore-interface-pragmas

       Tells GHC to ignore all inessential information when reading
       interface files. That is, even if :file:`M.hi` contains unfolding or
       strictness information for a function, GHC will ignore that
       information.

.. ghc-flag:: -fignore-interface-pragmas

    インターフェイスファイルを読み込むときに不必要な情報はすべて無視するよう GHC に指示します．
    すなわち :file:`M.hi` にある関数の展開情報や正格性情報があっても，GHC はこれらの情報を無視します．

..
   .. ghc-flag:: -flate-dmd-anal

       Run demand analysis again, at the end of the simplification
       pipeline. We found some opportunities for discovering strictness
       that were not visible earlier; and optimisations like
       :ghc-flag:`-fspec-constr` can create functions with unused arguments which
       are eliminated by late demand analysis. Improvements are modest, but
       so is the cost. See notes on the :ghc-wiki:`Trac wiki page <LateDmd>`.

.. ghc-flag:: -flate-dmd-anal

    単純化パイプラインの最後に再度，要求解析(demand analysys)を走らせます．
    前段階では見えなかった正格性を発見する場合があり
    :ghc-flag:`-fspec-constr` などの最適化によって作られた関数の未使用引数をこの後段階で取り除けることが判っています．
    改善はささやかなものですが，コストもわずかです．
    :ghc-wiki:`Trac wiki page <LateDmd>` にある注も参照してください．

..
   .. ghc-flag:: -fliberate-case

       *Off by default, but enabled by -O2.* Turn on the liberate-case
       transformation. This unrolls recursive function once in its own RHS,
       to avoid repeated case analysis of free variables. It's a bit like
       the call-pattern specialiser (:ghc-flag:`-fspec-constr`) but for free
       variables rather than arguments.

.. ghc-flag:: -fliberate-case

    *デフォルトでは無効，-O2で有効*
    liberate-case変換を有効にします．
    これは再帰関数をその右辺で1回展開して，自由変数がくりかえしcaseで検査されるのを回避します．
    これは，呼び出しパターンの特殊化(:ghc-flag:`-fspec-constr`)に似ていますが :ghc-flag:`-fliberate-case` は引数ではなく自由変数を対象にしています．

..
   .. ghc-flag:: -fliberate-case-threshold=<n>

       :default: 2000

       Set the size threshold for the liberate-case transformation.

.. ghc-flag:: -fliberate-case-threshold=<n>

    :default: 2000

    Set the size threshold for the liberate-case transformation.

.. ghc-flag:: -floopification

    :default: on

    When this optimisation is enabled the code generator will turn all
    self-recursive saturated tail calls into local jumps rather than
    function calls.

.. ghc-flag:: -fmax-inline-alloc-size=<n>

    :default: 128

    Set the maximum size of inline array allocations to n bytes.
    GHC will allocate non-pinned arrays of statically known size in the current
    nursery block if they're no bigger than n bytes, ignoring GC overheap. This
    value should be quite a bit smaller than the block size (typically: 4096).

.. ghc-flag:: -fmax-inline-memcpy-insn=<n>

    :default: 32

    Inline ``memcpy`` calls if they would generate no more than ⟨n⟩ pseudo-instructions.

.. ghc-flag:: -fmax-inline-memset-insns=<n>

    :default: 32

    Inline ``memset`` calls if they would generate no more than n pseudo
    instructions.

.. ghc-flag:: -fmax-relevant-binds=<n>
              -fno-max-relevant-bindings

    :default: 6

    The type checker sometimes displays a fragment of the type
    environment in error messages, but only up to some maximum number,
    set by this flag. Turning it off with
    ``-fno-max-relevant-bindings`` gives an unlimited number.
    Syntactically top-level bindings are also usually excluded (since
    they may be numerous), but ``-fno-max-relevant-bindings`` includes
    them too.

.. ghc-flag:: -fmax-simplifier-iterations=<n>

    :default: 4

    Sets the maximal number of iterations for the simplifier.

.. ghc-flag:: -fmax-worker-args=<n>

    :default: 10

    If a worker has that many arguments, none will be unpacked anymore.

.. ghc-flag:: -fno-opt-coercion

    Turn off the coercion optimiser.

.. ghc-flag:: -fno-pre-inlining

    Turn off pre-inlining.

.. ghc-flag:: -fno-state-hack

    Turn off the "state hack" whereby any lambda with a ``State#`` token
    as argument is considered to be single-entry, hence it is considered
    okay to inline things inside it. This can improve performance of IO
    and ST monad code, but it runs the risk of reducing sharing.

.. ghc-flag:: -fomit-interface-pragmas

    Tells GHC to omit all inessential information from the interface
    file generated for the module being compiled (say M). This means
    that a module importing M will see only the *types* of the functions
    that M exports, but not their unfoldings, strictness info, etc.
    Hence, for example, no function exported by M will be inlined into
    an importing module. The benefit is that modules that import M will
    need to be recompiled less often (only when M's exports change their
    type, not when they change their implementation).

.. ghc-flag:: -fomit-yields

    :default: on

    Tells GHC to omit heap checks when no allocation is
    being performed. While this improves binary sizes by about 5%, it
    also means that threads run in tight non-allocating loops will not
    get preempted in a timely fashion. If it is important to always be
    able to interrupt such threads, you should turn this optimization
    off. Consider also recompiling all libraries with this optimization
    turned off, if you need to guarantee interruptibility.

.. ghc-flag:: -fpedantic-bottoms

    Make GHC be more precise about its treatment of bottom (but see also
    :ghc-flag:`-fno-state-hack`). In particular, stop GHC eta-expanding through
    a case expression, which is good for performance, but bad if you are
    using ``seq`` on partial applications.

.. ghc-flag:: -fregs-graph

    *Off by default due to a performance regression bug. Only applies in
    combination with the native code generator.* Use the graph colouring
    register allocator for register allocation in the native code
    generator. By default, GHC uses a simpler, faster linear register
    allocator. The downside being that the linear register allocator
    usually generates worse code.

.. ghc-flag:: -fregs-iterative

    *Off by default, only applies in combination with the native code
    generator.* Use the iterative coalescing graph colouring register
    allocator for register allocation in the native code generator. This
    is the same register allocator as the ``-fregs-graph`` one but also
    enables iterative coalescing during register allocation.

.. ghc-flag:: -fsimplifier-phases=<n>

    :default: 2

    Set the number of phases for the simplifier. Ignored with ``-O0``.

.. ghc-flag:: -fsimpl-tick-factor=<n>

    :default: 100

    GHC's optimiser can diverge if you write rewrite rules
    (:ref:`rewrite-rules`) that don't terminate, or (less satisfactorily)
    if you code up recursion through data types (:ref:`bugs-ghc`). To
    avoid making the compiler fall into an infinite loop, the optimiser
    carries a "tick count" and stops inlining and applying rewrite rules
    when this count is exceeded. The limit is set as a multiple of the
    program size, so bigger programs get more ticks. The
    ``-fsimpl-tick-factor`` flag lets you change the multiplier. The
    default is 100; numbers larger than 100 give more ticks, and numbers
    smaller than 100 give fewer.

    If the tick-count expires, GHC summarises what simplifier steps it
    has done; you can use ``-fddump-simpl-stats`` to generate a much
    more detailed list. Usually that identifies the loop quite
    accurately, because some numbers are very large.

.. ghc-flag:: -fspec-constr

    *Off by default, but enabled by -O2.* Turn on call-pattern
    specialisation; see `Call-pattern specialisation for Haskell
    programs <http://research.microsoft.com/en-us/um/people/simonpj/papers/spec-constr/index.htm>`__.

    This optimisation specializes recursive functions according to their
    argument "shapes". This is best explained by example so consider: ::

        last :: [a] -> a
        last [] = error "last"
        last (x : []) = x
        last (x : xs) = last xs

    In this code, once we pass the initial check for an empty list we
    know that in the recursive case this pattern match is redundant. As
    such ``-fspec-constr`` will transform the above code to: ::

        last :: [a] -> a
        last []       = error "last"
        last (x : xs) = last' x xs
            where
              last' x []       = x
              last' x (y : ys) = last' y ys

    As well avoid unnecessary pattern matching it also helps avoid
    unnecessary allocation. This applies when a argument is strict in
    the recursive call to itself but not on the initial entry. As strict
    recursive branch of the function is created similar to the above
    example.

    It is also possible for library writers to instruct GHC to perform
    call-pattern specialisation extremely aggressively. This is
    necessary for some highly optimized libraries, where we may want to
    specialize regardless of the number of specialisations, or the size
    of the code. As an example, consider a simplified use-case from the
    ``vector`` library: ::

        import GHC.Types (SPEC(..))

        foldl :: (a -> b -> a) -> a -> Stream b -> a
        {-# INLINE foldl #-}
        foldl f z (Stream step s _) = foldl_loop SPEC z s
          where
            foldl_loop !sPEC z s = case step s of
                                    Yield x s' -> foldl_loop sPEC (f z x) s'
                                    Skip       -> foldl_loop sPEC z s'
                                    Done       -> z

    Here, after GHC inlines the body of ``foldl`` to a call site, it
    will perform call-pattern specialisation very aggressively on
    ``foldl_loop`` due to the use of ``SPEC`` in the argument of the
    loop body. ``SPEC`` from ``GHC.Types`` is specifically recognised by
    the compiler.

    (NB: it is extremely important you use ``seq`` or a bang pattern on
    the ``SPEC`` argument!)

    In particular, after inlining this will expose ``f`` to the loop
    body directly, allowing heavy specialisation over the recursive
    cases.

.. ghc-flag:: -fspec-constr-count=<n>

    :default: 3

    Set the maximum number of specialisations that will be created for
    any one function by the SpecConstr transformation.

.. ghc-flag:: -fspec-constr-threshold=<n>

    :default: 2000

    Set the size threshold for the SpecConstr transformation.

.. ghc-flag:: -fspecialise

    :default: on

    Specialise each type-class-overloaded function
    defined in this module for the types at which it is called in this
    module. If :ghc-flag:`-fcross-module-specialise` is set imported functions
    that have an INLINABLE pragma (:ref:`inlinable-pragma`) will be
    specialised as well.

.. ghc-flag:: -fcross-module-specialise

    :default: on

    Specialise ``INLINABLE`` (:ref:`inlinable-pragma`)
    type-class-overloaded functions imported from other modules for the types at
    which they are called in this module. Note that specialisation must be
    enabled (by ``-fspecialise``) for this to have any effect.

.. ghc-flag:: -fstatic-argument-transformation

    Turn on the static argument transformation, which turns a recursive
    function into a non-recursive one with a local recursive loop. See
    Chapter 7 of `Andre Santos's PhD
    thesis <http://research.microsoft.com/en-us/um/people/simonpj/papers/santos-thesis.ps.gz>`__

.. ghc-flag:: -fstrictness

    :default: on

    Switch on the strictness analyser. There is a very
    old paper about GHC's strictness analyser, `Measuring the
    effectiveness of a simple strictness
    analyser <http://research.microsoft.com/en-us/um/people/simonpj/papers/simple-strictnes-analyser.ps.gz>`__,
    but the current one is quite a bit different.

    The strictness analyser figures out when arguments and variables in
    a function can be treated 'strictly' (that is they are always
    evaluated in the function at some point). This allow GHC to apply
    certain optimisations such as unboxing that otherwise don't apply as
    they change the semantics of the program when applied to lazy
    arguments.

.. ghc-flag:: -fstrictness-before=⟨n⟩

    Run an additional strictness analysis before simplifier phase ⟨n⟩.

.. ghc-flag:: -funbox-small-strict-fields

    :default: on

    .. index::
       single: strict constructor fields
       single: constructor fields, strict

    This option causes all constructor fields which
    are marked strict (i.e. “!”) and which representation is smaller or
    equal to the size of a pointer to be unpacked, if possible. It is
    equivalent to adding an ``UNPACK`` pragma (see :ref:`unpack-pragma`)
    to every strict constructor field that fulfils the size restriction.

    For example, the constructor fields in the following data types ::

        data A = A !Int
        data B = B !A
        newtype C = C B
        data D = D !C

    would all be represented by a single ``Int#`` (see
    :ref:`primitives`) value with ``-funbox-small-strict-fields``
    enabled.

    This option is less of a sledgehammer than
    ``-funbox-strict-fields``: it should rarely make things worse. If
    you use ``-funbox-small-strict-fields`` to turn on unboxing by
    default you can disable it for certain constructor fields using the
    ``NOUNPACK`` pragma (see :ref:`nounpack-pragma`).

    Note that for consistency ``Double``, ``Word64``, and ``Int64``
    constructor fields are unpacked on 32-bit platforms, even though
    they are technically larger than a pointer on those platforms.

.. ghc-flag:: -funbox-strict-fields

    .. index::
       single: strict constructor fields
       single: constructor fields, strict

    This option causes all constructor fields which are marked strict
    (i.e. ``!``) to be unpacked if possible. It is equivalent to adding an
    ``UNPACK`` pragma to every strict constructor field (see
    :ref:`unpack-pragma`).

    This option is a bit of a sledgehammer: it might sometimes make
    things worse. Selectively unboxing fields by using ``UNPACK``
    pragmas might be better. An alternative is to use
    ``-funbox-strict-fields`` to turn on unboxing by default but disable
    it for certain constructor fields using the ``NOUNPACK`` pragma (see
    :ref:`nounpack-pragma`).

.. ghc-flag:: -funfolding-creation-threshold=<n>

    :default: 750

    .. index::
       single: inlining, controlling
       single: unfolding, controlling

    Governs the maximum size that GHC will allow a
    function unfolding to be. (An unfolding has a “size” that reflects
    the cost in terms of “code bloat” of expanding (aka inlining) that
    unfolding at a call site. A bigger function would be assigned a
    bigger cost.)

    Consequences:

    a. nothing larger than this will be inlined (unless it has an ``INLINE`` pragma)
    b. nothing larger than this will be spewed into an interface file.

    Increasing this figure is more likely to result in longer compile
    times than faster code. The :ghc-flag:`-funfolding-use-threshold` is more
    useful.

.. ghc-flag:: -funfolding-dict-discount=<n>

    :default: 30

    .. index::
       single: inlining, controlling
       single: unfolding, controlling

    How eager should the compiler be to inline dictionaries?

.. ghc-flag:: -funfolding-fun-discount=<n>

    :default: 60

    .. index::
       single: inlining, controlling
       single: unfolding, controlling

    How eager should the compiler be to inline functions?

.. ghc-flag:: -funfolding-keeness-factor=<n>

    :default: 1.5

    .. index::
       single: inlining, controlling
       single: unfolding, controlling

    How eager should the compiler be to inline functions?

.. ghc-flag:: -funfolding-use-threshold=<n>

    :default: 60

    .. index::
       single: inlining, controlling
       single: unfolding, controlling

    This is the magic cut-off figure for unfolding (aka
    inlining): below this size, a function definition will be unfolded
    at the call-site, any bigger and it won't. The size computed for a
    function depends on two things: the actual size of the expression
    minus any discounts that apply depending on the context into which
    the expression is to be inlined.

    The difference between this and :ghc-flag:`-funfolding-creation-threshold`
    is that this one determines if a function definition will be inlined
    *at a call site*. The other option determines if a function
    definition will be kept around at all for potential inlining.

.. ghc-flag:: -fvectorisation-avoidance

    :default: on

    .. index::
       single: -fvectorisation-avoidance

    Part of :ref:`Data Parallel Haskell (DPH) <dph>`.

    Enable the *vectorisation* avoidance optimisation.
    This optimisation only works when used in combination with the
    ``-fvectorise`` transformation.

    While vectorisation of code using DPH is often a big win, it can
    also produce worse results for some kinds of code. This optimisation
    modifies the vectorisation transformation to try to determine if a
    function would be better of unvectorised and if so, do just that.

.. ghc-flag:: -fvectorise

    :default: off

    Part of :ref:`Data Parallel Haskell (DPH) <dph>`.

    Enable the *vectorisation* optimisation
    transformation. This optimisation transforms the nested data
    parallelism code of programs using DPH into flat data parallelism.
    Flat data parallel programs should have better load balancing,
    enable SIMD parallelism and friendlier cache behaviour.
