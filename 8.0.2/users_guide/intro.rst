..
   .. _introduction-GHC:

   Introduction to GHC
   ===================

.. _introduction-GHC:

GHC の紹介
==========

..
   This is a guide to using the Glasgow Haskell Compiler (GHC): an
   interactive and batch compilation system for the
   `Haskell 2010 <http://www.haskell.org/>`__ language.

これはGlasgow Haskell Compiler (GHC)の使い方ガイドです．
GHCはプログラミング言語
`Haskell 2010 <http://www.haskell.org/>`__
用の対話式インタプリタ・一括処理式コンパイラです．

..
   GHC has two main components: an interactive Haskell interpreter (also
   known as GHCi), described in :ref:`ghci`, and a batch compiler,
   described throughout :ref:`using-ghc`. In fact, GHC consists of a single
   program which is just run with different options to provide either the
   interactive or the batch system.

GHCには主に2つの構成要素があります．
1つは，GHCiとも呼ぶ対話方式のHaskellインタプリタで，これについては
:ref:`ghci`
で説明します．
もう1つは，一括処理方式のコンパイラで，これについては
:ref:`using-ghc`
で説明します．
GHCは実際のところは単一のプログラムで，起動時のオプション指定によって，対話方式のインタプリタになったり，一括処理方式のコンパイラになったりします．

..
   The batch compiler can be used alongside GHCi: compiled modules can be
   loaded into an interactive session and used in the same way as
   interpreted code, and in fact when using GHCi most of the library code
   will be pre-compiled. This means you get the best of both worlds: fast
   pre-compiled library code, and fast compile turnaround for the parts of
   your program being actively developed.

一括処理のコンパイラはGHCiと並行して使えます．
対話的セッション中にコンパイル済みモジュールをロードすることができ，ロードされたものは解釈実行コードと同じように扱えます．
実際，GHCiを使うとき，ライブラリコードの大部分はコンパイル済みのものが使われています．
つまり，二つの方法の良いとこどりができるということです．
どういうことかというと，あらかじめコンパイルしておいた高速で実行できるライブラリコードが手にはいり，活発に開発されている部分を繰り返しコンパイルするのにかかる時間を短くできるということです．

..
   GHC supports numerous language extensions, including concurrency, a
   foreign function interface, exceptions, type system extensions such as
   multi-parameter type classes, local universal and existential
   quantification, functional dependencies, scoped type variables and
   explicit unboxed types. These are all described in
   :ref:`ghc-language-features`.

GHCはたくさんの言語拡張をサポートしています．
たとえば，並行性，外部関数インタフェース，例外，それにさまざまな型システムの拡張などです．
型システムの拡張には，多引数の型クラス，局所的な全称/存在量化，関数従属，スコープを持つ型変数，明示的な非ボックス化型などの拡張があります．
これらの言語拡張については全て
:ref:`ghc-language-features`
で説明します．
     
..
   GHC has a comprehensive optimiser, so when you want to Really Go For It
   (and you've got time to spare) GHC can produce pretty fast code.
   Alternatively, the default option is to compile as fast as possible
   while not making too much effort to optimise the generated code
   (although GHC probably isn't what you'd describe as a fast compiler :-).

GHCには広範囲にわたって最適化を行う機構があり，そのつもりになれば（そして，時間に余裕があるなら）GHCでそうとう速いコードを生成できます．
それとは反対に，デフォルトのオプションは生成するコードを過度に最適化しようとはせずに，なるべく速くコンパイルできるように調整されています．
（そうはいっても，GHCは，たぶん，いわゆる速いコンパイラではありません．笑）

..
   GHC's profiling system supports "cost centre stacks": a way of seeing
   the profile of a Haskell program in a call-graph like structure. See
   :ref:`profiling` for more details.

GHCのプロファイリングシステムは「コスト集約点スタック」をサポートしています．
コスト集約点スタックとはHaskellプログラムのプロフィールをコールグラフ状の構造として見るためのものです．
詳しくは
:ref:`profiling`
を参照してください．

..
   GHC comes with a number of libraries. These are described in separate
   documentation.

GHCには多数のライブラリが付属しています．
これらのライブラリについて別の文書で説明されています．

..
   .. _getting:

   Obtaining GHC
   -------------

.. _getting:

GHCの入手方法
-------------

..
   Go to the `GHC home page <http://www.haskell.org/ghc/>`__ and follow the
   "download" link to download GHC for your platform.

`GHC home page <http://www.haskell.org/ghc/>`__
に行って「download」のリンクを辿って自分のプラットフォーム用のGHCをダウンロードしてください．

..
   Alternatively, if you want to build GHC yourself, head on over to the
   :ghc-wiki:`GHC Building Guide <Building>` to find out how to get the sources,
   and build it on your system. Note that GHC itself is written in Haskell, so you
   will still need to install GHC in order to build it.

そうする以外に，自分でGHCをビルドしたい場合には，
:ghc-wiki:`GHC Building Guide <Building>`
に行けば，ソースを入手する方法，手元でビルドする方法が判ります．
GHCそれ自身はHaskellで書かれていることに注意してください．
ビルドするためには，そのためのGHCをインストールしなければならないということです．

..
   .. _mailing-lists-GHC:

   Meta-information: Web sites, mailing lists, etc.
   ------------------------------------------------

.. _mailing-lists-GHC:

メタ情報: Webサイト，メーリングリストなど
-----------------------------------------

..
   .. index::
      single: mailing lists, Glasgow Haskell
      single: Glasgow Haskell mailing lists

.. index::
   single: メーリングリスト, Glasgow Haskell
   single: Glasgow Haskell メーリングリスト

..
   On the World-Wide Web, there are several URLs of likely interest:

   -  `GHC home page <http://www.haskell.org/ghc/>`__

   -  `GHC Developers Home <http://ghc.haskell.org/trac/ghc/>`__ (developer
      documentation, wiki, and bug tracker)

関連サイトとしては以下があります．

-  `GHC home page <http://www.haskell.org/ghc/>`__

-  `GHC Developers Home <http://ghc.haskell.org/trac/ghc/>`__
   （開発者用文書，wiki，バグトラッカー）

..
   We run the following mailing lists about GHC. We encourage you to join,
   as you feel is appropriate.

GHCに関しては以下のようなメーリングリストを運営しています．
参加したいと思ったところに参加することをおすすめします．

..
   ``glasgow-haskell-users``
       This list is for GHC users to chat among themselves. If you have a
       specific question about GHC, please check the
       `FAQ <http://www.haskell.org/haskellwiki/GHC/FAQ>`__ first.

       Subscribers can post to the list by sending their message to 
       glasgow-haskell-users@haskell.org. Further information can be found
       on the
       `Mailman page <http://www.haskell.org/mailman/listinfo/glasgow-haskell-users>`__.

``glasgow-haskell-users``
    ここはGHCの利用者が互いにおしゃべりをする場です．
    なにかGHCに関して具体的な質問があれば、先ず
    `FAQ <http://www.haskell.org/haskellwiki/GHC/FAQ>`__
    を見てください．

    参加者の投稿先は
    glasgow-haskell-users@haskell.org
    です．
    詳しくは
    `Mailman page <http://www.haskell.org/mailman/listinfo/glasgow-haskell-users>`__
    を見てください．

..
   ``ghc-devs``
       The GHC developers hang out here. If you are working with the GHC API
       or have a question about GHC's implementation, feel free to chime in.

       Subscribers can post to the list by sending their message to 
       ghc-devs@haskell.org. Further information can be found on the
       `Mailman page <http://www.haskell.org/mailman/listinfo/ghc-devs>`__.

``ghc-devs``
    GHC開発者はここに出入りしています．
    GHC APIを使っていたり，GHCの実装に関して質問があれば，遠慮なく話に割って入ってください．

    参加者の投稿先は
    ghc-devs@haskell.org
    です.
    詳しくは
    `Mailman page <http://www.haskell.org/mailman/listinfo/ghc-devs>`__
    を見てください．

..
   There are several other Haskell and GHC-related mailing lists served by
   ``www.haskell.org``. Go to http://www.haskell.org/mailman/listinfo/
   for the full list.

``www.haskell.org``
では，他にもHaskellやGHCに関連するメーリングリストが提供されています．
http://www.haskell.org/mailman/listinfo/
に一覧があります．

..
   .. _bug-reporting:

   Reporting bugs in GHC
   ---------------------

.. _bug-reporting:

GHCのバグの報告方法
-------------------

..
   .. index::
      single: bugs; reporting
      single: reporting bugs

.. index::
   single: バグの報告方法
   single: 報告方法; バグ

..
   Glasgow Haskell is a changing system so there are sure to be bugs in it.
   If you find one, please see :ghc-wiki:`this wiki page <ReportABug>` for
   information on how to report it.

Glasgow Haskellは変化を続けるシステムであり，そこには必ずバグがあります．
バグを見つけたら，
:ghc-wiki:`このwikiページ <ReportABug>`
を見て，バグを報告する方法を知ってください．

..
   .. _version-numbering:

   GHC version numbering policy
   ----------------------------

.. _version-numbering:

GHCのバージョン番号付けの方針
-----------------------------

..
   .. index::
      single: version, of ghc

.. index::
   single: バージョン, ghcの

..
   As of GHC version 6.8, we have adopted the following policy for
   numbering GHC versions:

GHCバージョン6.8以降，GHCのバージョン番号の振り方は以下の方針にしたがっています．

    ..
       Stable branches are numbered ``x.y``, where ⟨y⟩ is *even*. Releases
       on the stable branch ``x.y`` are numbered ``x.y.z``, where ⟨z⟩ (>=
       1) is the patchlevel number. Patchlevels are bug-fix releases only,
       and never change the programmer interface to any system-supplied
       code. However, if you install a new patchlevel over an old one you
       will need to recompile any code that was compiled against the old
       libraries.

    安定版ブランチには ``x.y`` と振ります．
    ただし ``y`` は *偶数* です．
    安定版ブランチ ``x.y`` でのリリースには ``x.y.z`` と振ります．
    ただし， ``z`` (1以上)はパッチレベル番号です．
    パッチレベルのリリースはバグ修正のみで，システムが提供するコードへの
    プログラマ用インターフェイスを変更することはありません．
    しかし，新しいパッチレベルリリースを古いリリースに上書きインストールした場合，
    古いライブラリに対してコンパイルされたコードは全てコンパイルし直さなければなりません．

    ..
       The value of ``__GLASGOW_HASKELL__`` (see :ref:`c-pre-processor`)
       for a major release ``x.y.z`` is the integer ⟨xyy⟩ (if ⟨y⟩ is a
       single digit, then a leading zero is added, so for example in
       version 6.8.2 of GHC we would have ``__GLASGOW_HASKELL__==608``).

    メジャーリリース ``x.y.z`` では ``__GLASGOW_HASKELL__`` (:ref:`c-pre-processor` 参照)
    の値は ``xy`` (ただし， `y` が一桁のときは前に ``0`` を置きます．たとえば，GHCバージョン6.8.2
    では， ``__GLASGOW_HASKELL__==608``) となります．

    .. index::
       single: __GLASGOW_HASKELL__

    ..
       We may make snapshot releases of the current stable branch
       `available for
       download <http://www.haskell.org/ghc/dist/stable/dist/>`__, and the
       latest sources are available from
       :ghc-wiki:`the git repositories <Repositories>`.

    現在の安定版ブランチのスナップショットリリースを作成して，
    `ここからダウンロード可能 <http://www.haskell.org/ghc/dist/stable/dist/>`__
    にすることもあります．
    また、最新のソースは
    :ghc-wiki:`gitリポジトリ <Repositories>`
    からダウンロード可能です．

    ..
       Stable snapshot releases are named ``x.y.z.YYYYMMDD``. where
       ``YYYYMMDD`` is the date of the sources from which the snapshot was
       built, and ``x.y.z+1`` is the next release to be made on that
       branch. For example, ``6.8.1.20040225`` would be a snapshot of the
       ``6.8`` branch during the development of ``6.8.2``.

    安定版スナップショットリリースは ``x.y.z.YYYYMMDD`` という名前になります．
    ここで， ``YYYYMMDD`` はスナップショットのビルド元になったソースの日付けです．
    ``x.y.z+1`` が，そのブランチでの次のリリースになります．
    たとえば ``6.8.1.20040225`` は ``6.8`` ブランチのスナップショットで，
    ``6.8.2`` の開発中に作るものです．

    ..
       The value of ``__GLASGOW_HASKELL__`` for a snapshot release is the
       integer ⟨xyy⟩. You should never write any conditional code which
       tests for this value, however: since interfaces change on a
       day-to-day basis, and we don't have finer granularity in the values
       of ``__GLASGOW_HASKELL__``, you should only conditionally compile
       using predicates which test whether ``__GLASGOW_HASKELL__`` is equal
       to, later than, or earlier than a given major release.

    スナップショットリリースでは ``__GLASGOW_HASKELL__`` の値は(安定版のときと同様) ``xy`` となります．
    しかし，この値をチェックする条件コードを書いてはいけません．
    インターフェイスは日毎に変わるにもかかわらず ``__GLASGOW_HASKELL__`` では，
    これ以上細かい精度の値を表せませんから ``__GLASGOW_HASKELL__`` の値をチェックするなら
    メジャーリリース番号との間でだけ大小・等値比較を行ってください．

    ..
       We may make snapshot releases of the HEAD `available for
       download <http://www.haskell.org/ghc/dist/current/dist/>`__, and the
       latest sources are available from
       :ghc-wiki:`the git repositories <Repositories>`.

    ``HEAD`` のスナップショットリリースは
    `ダウンロード <http://www.haskell.org/ghc/dist/current/dist/>`__
    できるようにし，最新のソースは
    :ghc-wiki:`the git repositories <Repositories>`
    で利用できるようにします．

    ..
       Unstable snapshot releases are named ``x.y.YYYYMMDD``. where
       ``YYYYMMDD`` is the date of the sources from which the snapshot was
       built. For example, ``6.7.20040225`` would be a snapshot of the HEAD
       before the creation of the ``6.8`` branch.

    不安定版スナップショットリリースは ``x.y.YYYYMMDD`` という名前になります．
    ここで， ``YYYYMMDD`` はスナップショットのビルド元になったソースの日付けです．
    たとえば ``6.7.20040225`` は ``HEAD`` のスナップショットで ``6.8`` ブランチ
    を作成する前の段階で作成します．

    ..
       The value of ``__GLASGOW_HASKELL__`` for a snapshot release is the
       integer ⟨xyy⟩. You should never write any conditional code which
       tests for this value, however: since interfaces change on a
       day-to-day basis, and we don't have finer granularity in the values
       of ``__GLASGOW_HASKELL__``, you should only conditionally compile
       using predicates which test whether ``__GLASGOW_HASKELL__`` is equal
       to, later than, or earlier than a given major release.

    スナップショットリリースでは ``__GLASGOW_HASKELL__`` の値は(安定版のときと同様) ``xy`` となります．
    しかし，この値をチェックする条件コードを書いてはいけません．
    インターフェイスは日毎に変わるにもかかわらず ``__GLASGOW_HASKELL__`` では，
    これ以上細かい精度の値を表せませんから ``__GLASGOW_HASKELL__`` の値をチェックするなら
    メジャーリリース番号との間でだけ大小・等値比較を行ってください．

..
   The version number of your copy of GHC can be found by invoking ``ghc``
   with the ``--version`` flag (see :ref:`options-help`).

手元のGHCのバージョン番号は ``ghc`` を ``--version`` フラグ付きで起動すれば判ります
(:ref:`options-help` 参照)．

..
   The compiler version can be tested within compiled code with the
   ``MIN_VERSION_GLASGOW_HASKELL`` CPP macro (defined only when
   :ghc-flag:`-XCPP` is used). See :ref:`standard-cpp-macros` for details. 

コンパイラのバージョンはコンパイルするコードの中でチェックできます．
これは CPP のマクロ ``MIN_VERSION_GLASGOW_HASKELL`` を使います
(このマクロは :ghc-flag:`-XCPP` が指定されたときのみ有効です)．
詳しくは :ref:`standard-cpp-macros` を参照してください．
