..
   .. _ghci:

   Using GHCi
   ==========

.. _ghci:

GHCiを使う
==========

..
   .. index::
      single: GHCi
      single: interpreter
      single: interactive
      single: Hugs
      single: Foreign Function Interface; GHCi support
      single: FFI; GHCi support

.. index::
   single: GHCi
   single: インタプリタ
   single: 対話方式
   single: Hugs
   single: 外部関数インターフェイス; GHCiがサポートする
   single: FFI; GHCiがサポートする

..
   GHCi [1]_ is GHC's interactive environment, in which Haskell expressions
   can be interactively evaluated and programs can be interpreted. If
   you're familiar with `Hugs <http://www.haskell.org/hugs/>`__, then
   you'll be right at home with GHCi. However, GHCi also has support for
   interactively loading compiled code, as well as supporting all [2]_ the
   language extensions that GHC provides. GHCi also includes an interactive
   debugger (see :ref:`ghci-debugger`).

   .. [1]
      The "i" stands for “Interactive”

   .. [2]
      except ``foreign export``, at the moment

GHCi [1]_ はGHCの対話環境であり，Haskellの式を対話方式で評価したり
プログラムを解釈実行したりできます．
`Hugs <http://www.haskell.org/hugs/>`__ の経験があるなら，
すぐにでもGHCiに慣れることでしょう．
しかしながら， GHCiはコンパイル済みのコードを対話的にロードすることができます．
また，GHCが提供する言語拡張のすべて[2]_ をサポートしています．
GHCi は対話方式のデバッガも備えています(:ref:`ghci-debugger` 参照)．

.. [1]
   "i"は“Interactive”の i です．

.. [2]
   ただし今のところ ``foreign export`` は除きます．


..
   .. _ghci-introduction:

   Introduction to GHCi
   --------------------

.. _ghci-introduction:

GHCi入門
--------

..
   Let's start with an example GHCi session. You can fire up GHCi with the
   command ``ghci``:

   .. code-block:: none

       $ ghci
       GHCi, version 8.0.1: http://www.haskell.org/ghc/  :? for help
       Prelude>

   There may be a short pause while GHCi loads the prelude and standard
   libraries, after which the prompt is shown. As the banner says, you can
   type :ghci-cmd:`:?` to see the list of commands available, and a half line
   description of each of them. We'll explain most of these commands as we
   go along, and there is complete documentation for all the commands in
   :ref:`ghci-commands`.

GHCiセッションの例を見ていくことから始めましょう．
GHCiは ``ghci`` コマンドで起動します．

.. code-block:: none

    $ ghci
    GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
    Prelude>

GHCiがプレリュードと標準ライブラリをロードするのにすこしかかるかもしれませんが，
それが完了するとプロンプトが現れます．
バナーにあるとおり，:ghci-cmd:`:?` をタイプすれば，利用可能なコマンド一覧と
それぞれの短い説明が表示されます．
これ以降ほとんどのコマンドを説明します．
すべてのコマンドの完全な説明は :ref:`ghci-commands` にあります．

..
   Haskell expressions can be typed at the prompt:

   .. index::
      single: prompt; GHCi

   .. code-block:: none

       Prelude> 1+2
       3
       Prelude> let x = 42 in x / 9
       4.666666666666667
       Prelude>

   GHCi interprets the whole line as an expression to evaluate. The
   expression may not span several lines - as soon as you press enter, GHCi
   will attempt to evaluate it.

プロンプトにはHaskellの式をタイプします．

.. index::
   single: プロンプト; GHCi

.. code-block:: none

    Prelude> 1+2
    3
    Prelude> let x = 42
    Preldue> x / 9
    4.666666666666667		
    Prelude>

GHCiは行全体を1つの式だと解釈し，これを評価します．
式は複数行にまたがることはできません．
エンターキーを押したとたん，GHCiはそこまでにタイプされたものを評価しようとします．


..
   In Haskell, a ``let`` expression is followed by ``in``. However, in
   GHCi, since the expression can also be interpreted in the ``IO`` monad,
   a ``let`` binding with no accompanying ``in`` statement can be signalled
   by an empty line, as in the above example.

Haskellでは ``let`` 式は ``in`` をともないます．
しかし，GHCiでは，式は ``IO`` モナドの中でも解釈されますので，上の例は
``in`` を伴わない ``let`` 束縛文であることは，行が表示されないことで示されています．

..
   .. _loading-source-files:

   Loading source files
   --------------------

.. _loading-source-files:

ソースファイルをロードする
--------------------------

..
   Suppose we have the following Haskell source code, which we place in a
   file ``Main.hs``: ::

       main = print (fac 20)

       fac 0 = 1
       fac n = n * fac (n-1)

   You can save ``Main.hs`` anywhere you like, but if you save it somewhere
   other than the current directory [3]_ then we will need to change to the
   right directory in GHCi:

   .. code-block:: none

       Prelude> :cd dir

   where ⟨dir⟩ is the directory (or folder) in which you saved ``Main.hs``.

次のようなHaskellのソースコードが ``Main.hs`` というファイルに書かれているとしましょう． ::

    main = print (fac 20)

    fac 0 = 1
    fac n = n * fac (n-1)

``Main.hs`` は好きな場所に置けますが，GHCiを起動したファイルがあるカレントディレクトリ
[3]_ 以外の場所に置いたときには，GHCiでディレクトリを正しく変更する必要があります．

.. code-block:: none

    Prelude> :cd dir

ここで ⟨dir⟩ は ``Main.hs`` を保存したディレクトリ(あるいはフォルダ）です．

..
   To load a Haskell source file into GHCi, use the :ghci-cmd:`:load` command:

   .. index::
      single: :load

   .. code-block:: none

       Prelude> :load Main
       Compiling Main             ( Main.hs, interpreted )
       Ok, modules loaded: Main.
       *Main>

   GHCi has loaded the ``Main`` module, and the prompt has changed to
   ``*Main>`` to indicate that the current context for expressions
   typed at the prompt is the ``Main`` module we just loaded (we'll explain
   what the ``*`` means later in :ref:`ghci-scope`). So we can now type
   expressions involving the functions from ``Main.hs``:

   .. code-block:: none

       *Main> fac 17
       355687428096000

HaskellのソースファイルをGHCiにロードするには :ghci-cmd:`:load` コマンドを使います．

.. index::
   single: :load

.. code-block:: none

    Prelude> :load Main
    Compiling Main             ( Main.hs, interpreted )
    Ok, modules loaded: Main.
    *Main>

GHCiは ``Main`` モジュールをロードし，プロンプトが ``*Main>`` に変りました．
このプロンプトは，ここにユーザが入力する式を評価するときの文脈が，たったいまロードした
``Main`` モジュールであることを示しています
(``*`` の意味については :ref:`ghci-scope` で説明します)．
これで ``Main.hs`` で定義した関数を含む式が評価できるようになりました．

.. code-block:: none

    *Main> fac 17
    355687428096000

..
   Loading a multi-module program is just as straightforward; just give the
   name of the "topmost" module to the :ghci-cmd:`:load` command (hint:
   :ghci-cmd:`:load` can be abbreviated to ``:l``). The topmost module will
   normally be ``Main``, but it doesn't have to be. GHCi will discover which
   modules are required, directly or indirectly, by the topmost module, and load
   them all in dependency order.

複数のモジュールからなるプログラムをロードするのも同様に簡単です．
「最上位の」モジュールの名前を :ghci-cmd:`:load` コマンドに指定すればいいだけです
(ヒント: :ghci-cmd:`load` は ``:l`` に短縮できます)．
最上位のモジュールはふつうは ``Main`` ですが，必ずしもそうである必要はありません．
GHCiは最上位のモジュールから直接・間接に必要とされているモジュールを見つけ，
それらを依存関係の順にロードします．

..
   .. [3]
      If you started up GHCi from the command line then GHCi's current
      directory is the same as the current directory of the shell from
      which it was started. If you started GHCi from the “Start” menu in
      Windows, then the current directory is probably something like
      ``C:\Documents and Settings\user name``.

.. [3]
   コマンドラインから GHCi を起動した場合は GHCi のカレントディレクトリは
   シェルから起動したときのカレントディレクトリと同じです．
   Windowsの「スタート」メニューから GHCi を起動した場合は，
   カレントディレクトリはおそく ``C:\Documents and Settings\user name`` あたりでしょう．


..
   .. _ghci-modules-filenames:

   Modules vs. filenames
   ~~~~~~~~~~~~~~~~~~~~~

.. _ghci-modules-filenames:

モジュールとファイル名
~~~~~~~~~~~~~~~~~~~~~~

..
   .. index::
      single: modules; and filenames
      single: filenames; of modules

.. index::
   single: モジュール; 〜とファイル名
   single: ファイル名; モジュールの〜

..
   Question: How does GHC find the filename which contains module ⟨M⟩?
   Answer: it looks for the file ``M.hs``, or ``M.lhs``. This means that
   for most modules, the module name must match the filename. If it
   doesn't, GHCi won't be able to find it.

問: GHCi はモジュール ⟨M⟩ がどのファイルにあるかをどうやって知るのですか．
答: ``M.hs`` あるいは ``M.lhs`` というファイルを探します．
したがって，大部分のモジュールでは，モジュール名とファイル名は一致している必要があります．
一致しなかった場合，GHCiはモジュールを見つけ出すことができません．

..
   There is one exception to this general rule: when you load a program
   with :ghci-cmd:`:load`, or specify it when you invoke ``ghci``, you can give a
   filename rather than a module name. This filename is loaded if it
   exists, and it may contain any module you like. This is particularly
   convenient if you have several ``Main`` modules in the same directory
   and you can't call them all ``Main.hs``.

この規則には一つの例外があります．
:ghci-cmd:`:load` を使ってプログラムをロードするとき，
あるいは ``ghci`` を起動するときには，モジュール名ではなくファイル名を指定することができます．
その名前のファイルがあれば，それをロードします．
このときそのファイルにはどのような名前のモジュールを含んでいてもかまいません．
これは，複数の ``Main`` モジュールが1つのディレクトリにある場合，
全てを ``Main.hs`` と呼ぶことはできませんので，特に便利です．

..
   The search path for finding source files is specified with the :ghc-flag:`-i`
   option on the GHCi command line, like so:

   .. code-block:: none

       ghci -idir1:...:dirn

   or it can be set using the :ghci-cmd:`:set` command from within GHCi (see
   :ref:`ghci-cmd-line-options`) [4]_


ソースファイルを探すときの探索パスは，次に示すように，
GHCiを起動するコマンドラインで :ghc-flag:`-i` オプションで指定できます．

.. code-block:: none

    ghci -idir1:...:dirn

あるいは，GHCiの中で :ghci-cmd:`:set` コマンドで指定できます
(:ref:`ghci-cmd-line-options` 参照) [4]_

..
   One consequence of the way that GHCi follows dependencies to find
   modules to load is that every module must have a source file. The only
   exception to the rule is modules that come from a package, including the
   ``Prelude`` and standard libraries such as ``IO`` and ``Complex``. If
   you attempt to load a module for which GHCi can't find a source file,
   even if there are object and interface files for the module, you'll get
   an error message.

GHCiは，このように依存関係を追ってロードすべきモジュールを見つけようとするので，
モジュールごとに，1つのソースファイルがなければなりません．
この規則の唯一の例外はパッケージ由来のモジュールで，それには ``Prelude`` のほか
``IO`` や ``Complex`` といった標準ライブラリも含まれます．
モジュールをロードしようとしたとき，GHCiがソースファイルを見つけられなければ，
たとえ，そのモジュールのオブジェクトファイルやインターフェイスファイルがあったとしても，
エラーメッセージが表示されます．

..
   .. [4]
      Note that in GHCi, and :ghc-flag:`--make` mode, the :ghc-flag:`-i` option is used to
      specify the search path for *source* files, whereas in standard
      batch-compilation mode the :ghc-flag:`-i` option is used to specify the
      search path for interface files, see :ref:`search-path`.

.. [4]
   GHCiや :ghc-flag:`--make` モードでは :ghc-flag:`-i` オプションは，
   *ソースファイル* の探索パスを指定するのに対し，標準の一括コンパイルモードでは
   :ghc-flag:`-i` オプションはインターフェイスファイルの探索パスを指定することに注意してください．
   詳しくは :ref:`search-path` を参照してください．

..
   Making changes and recompilation
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ソースコードの変更と再コンパイル
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   .. index::
      single: :reload

   If you make some changes to the source code and want GHCi to recompile
   the program, give the :ghci-cmd:`:reload` command. The program will be
   recompiled as necessary, with GHCi doing its best to avoid actually
   recompiling modules if their external dependencies haven't changed. This
   is the same mechanism we use to avoid re-compiling modules in the batch
   compilation setting (see :ref:`recomp`).

.. index::
   single: :reload

ソースコードに変更を加えて，GHCiに再コンパイルさせたいときは :ghci-cmd:`:reload`
コマンドを使います．
プログラムは必要に応じて再コンパイルされます．
このとき，GHCiは依存関係の変化がないモジュールを実際に再コンパイルするのを避けようと最善をつくします．
これは一括コンパイル時に再コンパイルを避ける機構と同じです
(:ref:`recomp` 参照)．

..
   .. _ghci-compiled:

   Loading compiled code
   ---------------------

.. _ghci-compiled:

コンパイル済みコードをロードする
--------------------------------

..
   .. index::
      single: compiled code; in GHCi

.. index::
   single: コンパイル済みコード; GHCiの〜

..
   When you load a Haskell source module into GHCi, it is normally
   converted to byte-code and run using the interpreter. However,
   interpreted code can also run alongside compiled code in GHCi; indeed,
   normally when GHCi starts, it loads up a compiled copy of the ``base``
   package, which contains the ``Prelude``.

HaskellのソースモジュールをGHCiにロードすると，通常はバイトコードに変換され，解釈実行器で実行されます．
しかし，GHCiでは解釈実行されるコードはコンパイル済みコードと一緒に実行することもできます．
実際，GHCiは起動すると通常は ``base`` パッケージのコンパイル済みのものをロードします．
その中には ``Prelude`` モジュールが含まれています．

..
   Why should we want to run compiled code? Well, compiled code is roughly
   10x faster than interpreted code, but takes about 2x longer to produce
   (perhaps longer if optimisation is on). So it pays to compile the parts
   of a program that aren't changing very often, and use the interpreter
   for the code being actively developed.

なぜコンパイル済みのコードを使う必要があるのでしょうか．
コンパイル済みコードは解釈実行されるコードに比べて大体10倍速いですが，生成するのに2倍の時間がかります
(最適化が有効ならもっと長くなるでしょう)．
そのため、プログラムのあまり変更されない部分をコンパイルしておき，
活発に開発されている部分には解釈実行器を使ことにすればいいわけです．

..
   When loading up source modules with :ghci-cmd:`:load`, GHCi normally looks for
   any corresponding compiled object files, and will use one in preference
   to interpreting the source if possible. For example, suppose we have a 4-module
   program consisting of modules ``A``, ``B``, ``C``, and ``D``. Modules ``B`` and
   ``C`` both import ``D`` only, and ``A`` imports both ``B`` and ``C``:

   .. code-block:: none

	     A
	    / \
	   B   C
	    \ /
	     D

:ghci-cmd:`:load` でソースモジュールをロードするとき，GHCiは通常対応する
コンパイル済みのオブジェクトファイルを探します．
可能ならソースコードの解釈実行よりも優先してそれを使います．
たとえば，A，B，C，Dという4つのモジュールからなるプログラムがあるとしましょう．
モジュールBとCはどちらもDのみをインポートしていて，AはBとCをインポートしているとしましょう．

.. code-block:: none

          A
         / \
        B   C
         \ /
          D

..
   We can compile ``D``, then load the whole program, like this:

   .. code-block:: none

       Prelude> :! ghc -c -dynamic D.hs
       Prelude> :load A
       Compiling B                ( B.hs, interpreted )
       Compiling C                ( C.hs, interpreted )
       Compiling A                ( A.hs, interpreted )
       Ok, modules loaded: A, B, C, D (D.o).
       *Main>

以下のように ``D`` をコンパイルしてから，プログラム全体をロードすることができます．

.. code-block:: none

    Prelude> :! ghc -c -dynamic D.hs
    Prelude> :load A
    Compiling B                ( B.hs, interpreted )
    Compiling C                ( C.hs, interpreted )
    Compiling A                ( A.hs, interpreted )
    Ok, modules loaded: A, B, C, D (D.o).
    *Main>

..
   In the messages from the compiler, we see that there is no line for
   ``D``. This is because it isn't necessary to compile ``D``, because the
   source and everything it depends on is unchanged since the last
   compilation.

コンパイラのメッセージ中に ``D`` についての行がありません．
これは，``D`` のソースファイルとその依存関係が，最後にコンパイルされたときから変更されていないので，
``D`` をコンパイルする必要ないからです．

..
   Note the :ghc-flag:`-dynamic` flag to GHC: GHCi uses dynamically-linked object
   code (if you are on a platform that supports it), and so in order to use
   compiled code with GHCi it must be compiled for dynamic linking.

:ghc-flag:`-dynamic` フラグはGHCに渡すものです．
これによって，GHCiはダイナミックリンクオブジェクトコードを使うようになります
(もちろんそれをサポートしているプラットフォームでの話です)．
したがって，GHCiでコンパイル済みのコードを利用するためには，そのコードは
ダイナミックリンク可能なようにコンパイルされていなければなりません．

..
   At any time you can use the command :ghci-cmd:`:show modules` to get a list of
   the modules currently loaded into GHCi:

   .. code-block:: none

       *Main> :show modules
       D                ( D.hs, D.o )
       C                ( C.hs, interpreted )
       B                ( B.hs, interpreted )
       A                ( A.hs, interpreted )
       *Main>

:ghci-cmd:`:show modules` を使えば，いつでも，その時点でGHCiにロードされている
モジュールの一覧を表示できます．

.. code-block:: none

    *Main> :show modules
    D                ( D.hs, D.o )
    C                ( C.hs, interpreted )
    B                ( B.hs, interpreted )
    A                ( A.hs, interpreted )
    *Main>

..
   If we now modify the source of ``D`` (or pretend to: using the Unix command
   ``touch`` on the source file is handy for this), the compiler will no
   longer be able to use the object file, because it might be out of date:

   .. code-block:: none

       *Main> :! touch D.hs
       *Main> :reload
       Compiling D                ( D.hs, interpreted )
       Ok, modules loaded: A, B, C, D.
       *Main>

ここで ``D`` を変更する(あるいは変更したふりをする: ``touch`` というUnixのコマンドを
使うのが簡単)と，コンパイラはオブジェクトファイルを使えなくなります．
その理由は，オブジェクトファイルがすでに古くなっているに違いないからです．

.. code-block:: none

    *Main> :! touch D.hs
    *Main> :reload
    Compiling D                ( D.hs, interpreted )
    Ok, modules loaded: A, B, C, D.
    *Main>

..
   Note that module ``D`` was compiled, but in this instance because its source
   hadn't really changed, its interface remained the same, and the
   recompilation checker determined that ``A``, ``B`` and ``C`` didn't need to be
   recompiled.

モジュール ``D`` がコンパイルされました．
しかし，この例では実際にはソースは変更されていないので，インターフェイスは同じままで，
再コンパイル検査器が ``A`` ， ``B`` ， ``C`` は再コンパイルする必要なしと判断したことに注意してください．

..
   So let's try compiling one of the other modules:

   .. code-block:: none

       *Main> :! ghc -c C.hs
       *Main> :load A
       Compiling D                ( D.hs, interpreted )
       Compiling B                ( B.hs, interpreted )
       Compiling C                ( C.hs, interpreted )
       Compiling A                ( A.hs, interpreted )
       Ok, modules loaded: A, B, C, D.

では，別のモジュールを1つコンパイルしてみましょう．

.. code-block:: none

    *Main> :! ghc -c C.hs
    *Main> :load A
    Compiling D                ( D.hs, interpreted )
    Compiling B                ( B.hs, interpreted )
    Compiling C                ( C.hs, interpreted )
    Compiling A                ( A.hs, interpreted )
    Ok, modules loaded: A, B, C, D.

..
   We didn't get the compiled version of ``C``! What happened? Well, in GHCi a
   compiled module may only depend on other compiled modules, and in this
   case ``C`` depends on ``D``, which doesn't have an object file, so GHCi also
   rejected ``C``\'s object file. Ok, so let's also compile ``D``:

   .. code-block:: none

       *Main> :! ghc -c D.hs
       *Main> :reload
       Ok, modules loaded: A, B, C, D.

``C`` のコンパイル済みのバージョンが使われていません．
何が起きたのでしょうか．
GHCi ではコンパイル済みのモジュールは別のコンパイル済みのモジュールにしか依存できません．
この場合は ``C`` が ``D`` に依存していますが ``D`` にはオブジェクトファイルがないので
GHCiは ``C`` のオブジェクトファイルを利用しなかったのです．
では ``D`` もコンパイルしてみましょう．

.. code-block:: none

    *Main> :! ghc -c D.hs
    *Main> :reload
    Ok, modules loaded: A, B, C, D.

..
   Nothing happened! Here's another lesson: newly compiled modules aren't
   picked up by :ghci-cmd:`:reload`, only :ghci-cmd:`:load`:

   .. code-block:: none

       *Main> :load A
       Compiling B                ( B.hs, interpreted )
       Compiling A                ( A.hs, interpreted )
       Ok, modules loaded: A, B, C (C.o), D (D.o).

何も起こりません．
もう1つ賢くなりました．
新しくコンパイルされたモジュールは :ghci-cmd:`:reload` では拾えません．
:ghci-cmd:`:load` を使う必要があります．

.. code-block:: none

    *Main> :load A
    Compiling B                ( B.hs, interpreted )
    Compiling A                ( A.hs, interpreted )
    Ok, modules loaded: A, B, C (C.o), D (D.o).

..
   The automatic loading of object files can sometimes lead to confusion,
   because non-exported top-level definitions of a module are only
   available for use in expressions at the prompt when the module is
   interpreted (see :ref:`ghci-scope`). For this reason, you might
   sometimes want to force GHCi to load a module using the interpreter.
   This can be done by prefixing a ``*`` to the module name or filename
   when using :ghci-cmd:`:load`, for example

   .. code-block:: none

       Prelude> :load *A
       Compiling A                ( A.hs, interpreted )
       *A>

このようなオブジェクトファイルの自動ロードは混乱の原因になることがあります．
モジュールのエクスポートされていないトップレベルの定義をプロンプトの式で使えるのは，
そのモジュールが解釈実行されているときだけだからです
(:ref:`ghci-scope` 参照)．
このため，GHCiにインタプリタを使ってモジュールのロードを強制したいことがあるかもしれません．
そうするには :ghci-cmd:`:load` を使うときにモジュール名またはファイル名の前に*を置きます．
たとえば，以下のようにします．

.. code-block:: none

    Prelude> :load *A
    Compiling A                ( A.hs, interpreted )
    *A>

..
   When the ``*`` is used, GHCi ignores any pre-compiled object code and
   interprets the module. If you have already loaded a number of modules as
   object code and decide that you wanted to interpret one of them, instead
   of re-loading the whole set you can use ``:add *M`` to specify that you
   want ``M`` to be interpreted (note that this might cause other modules
   to be interpreted too, because compiled modules cannot depend on
   interpreted ones).

``*`` を使うと，GHCiはコンパイル済みオブジェクトコードがあっても無視し，モジュールを解釈実行します．
既にモジュールをいくつかオブジェクトコードとしてロードしていて，そのうち1つを解釈実行したいときには，
全部を再ロードせず ``:add *M`` を使えば， ``M`` だけを解釈実行することを指定できます．
(これによって別のモジュールも解釈実行されるかもしれないことに注意してください．
これは，コンパイル済みモジュールは解釈実行モジュールに依存できないためです．)

..
   To always compile everything to object code and never use the
   interpreter, use the :ghc-flag:`-fobject-code` option (see :ref:`ghci-obj`).

   .. hint::
       Since GHCi will only use a compiled object file if it can be sure
       that the compiled version is up-to-date, a good technique when working
       on a large program is to occasionally run ``ghc --make`` to compile the
       whole project (say before you go for lunch :-), then continue working in
       the interpreter. As you modify code, the changed modules will be
       interpreted, but the rest of the project will remain compiled.

いつでも，すべてコンパイル済みのオブジェクトコードにしたければ，
インタプリタを使ってはいけません．
:ghc-flag:`-fobject-code` オプションを使ってください(:ref:`ghci-obj` 参照)．

.. hint::
   GHCi はコンパイル済みの版が最新であることが確かな場合にしか，
   コンパイル済みオブジェクトファイルを使わないので，
   大きいプロジェクトでは，ときどき ``ghc --make`` を実行してプロジェクト全体をコンパイルし
   (たとえば，昼食を食べに行く前にね)，解釈実行器を使って作業を続けるというのが良い方法です．
   コードを変更したときは，そのモジュールは解釈実行されますが，プロジェクト中の他の部分は
   変わらずコンパイル済みのものが使われます．

..
   .. _interactive-evaluation:

   Interactive evaluation at the prompt
   ------------------------------------

.. _interactive-evaluation:

プロンプトで対話的に評価する
----------------------------

..
   When you type an expression at the prompt, GHCi immediately evaluates
   and prints the result:

   .. code-block:: none

       Prelude> reverse "hello"
       "olleh"
       Prelude> 5+5
       10

プロンプトに式を入力すると，GHCi はただちに評価して結果を表示します．

.. code-block:: none

    Prelude> reverse "hello"
    "olleh"
    Prelude> 5+5
    10

..
   .. _actions-at-prompt:

   I/O actions at the prompt
   ~~~~~~~~~~~~~~~~~~~~~~~~~

.. _actions-at-prompt:

プロンプトでのI/Oアクション
~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   GHCi does more than simple expression evaluation at the prompt. If you
   enter an expression of type ``IO a`` for some ``a``, then GHCi
   *executes* it as an IO-computation.

   .. code-block:: none

       Prelude> "hello"
       "hello"
       Prelude> putStrLn "hello"
       hello

GHCi がプロンプトで行うのは単なる式の評価だけではありません．
ある型 ``a`` に関して ``IO a`` 型の式を入力すると，GHCiはそれをIOコンピュテーションとして
*実行* します．

.. code-block:: none

    Prelude> "hello"
    "hello"
    Prelude> putStrLn "hello"
    hello

..
   This works even if the type of the expression is more general, provided
   it can be *instantiated* to ``IO a``. For example

   .. code-block:: none

       Prelude> return True
       True

式の型がより一般的なものであっても ``IO a`` に *具体化* することができる限り動作します．
それ例が以下です．

.. code-block:: none

    Prelude> return True
    True

..
   Furthermore, GHCi will print the result of the I/O action if (and only
   if):

   -  The result type is an instance of ``Show``.

   -  The result type is not ``()``.

   For example, remembering that ``putStrLn :: String -> IO ()``:

   .. code-block:: none

       Prelude> putStrLn "hello"
       hello
       Prelude> do { putStrLn "hello"; return "yes" }
       hello
       "yes"

さらに，GHCiは以下の条件を満す場合(かつその限りにおいて)，I/Oアクションの結果を表示します．

-  結果の型が ``Show`` のインスタンスの場合．

-  結果の型が ``()`` ではない場合．

以下はその例です．ただし， ``putStrLn :: String -> IO ()`` です．

.. code-block:: none

    Prelude> putStrLn "hello"
    hello
    Prelude> do { putStrLn "hello"; return "yes" }
    hello
    "yes"

..
   .. _ghci-stmts:

   Using ``do`` notation at the prompt
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _ghci-stmts:

プロンプトで ``do`` 記法を使う
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   .. index::
      single: do-notation; in GHCi
      single: statements; in GHCi

.. index::
   single: do記法; GHCiの〜
   single: 文; GHCiの〜

..
   GHCi actually accepts statements rather than just expressions at the
   prompt. This means you can bind values and functions to names, and use
   them in future expressions or statements.

実際には，GHCiはプロンプトで受け付けているのは単なる式ではなく文です．
そのため，値や関数を名前に束縛して，後で式や文の中で使うことができます．

..
   The syntax of a statement accepted at the GHCi prompt is exactly the
   same as the syntax of a statement in a Haskell ``do`` expression.
   However, there's no monad overloading here: statements typed at the
   prompt must be in the ``IO`` monad.

   .. code-block:: none

       Prelude> x <- return 42
       Prelude> print x
       42
       Prelude>

The syntax of a statement accepted at the GHCi prompt is exactly the
GHCiがプロンプトで受け付ける文の構文は，Haskellのdo式における文の構文と全く同じです．
ただし，こちらにはモナドの多重定義はありません．
プロンプトに入力される文はIOモナドの中になければなりません．

.. code-block:: none

    Prelude> x <- return 42
    Prelude> print x
    42
    Prelude>

..
   The statement ``x <- return 42`` means “execute ``return 42`` in the
   ``IO`` monad, and bind the result to ``x``\ ”. We can then use ``x`` in
   future statements, for example to print it as we did above.

``x <- return 42`` という文は「``return 42`` を ``IO`` モナド内で実行し，
その結果で ``x`` を束縛する」という意味です．
以降 ``x`` は文の中で使用できます．
たとえば，上でしたように値を印字できます．

..
   .. ghc-flag:: -fprint-bind-result

       If :ghc-flag:`-fprint-bind-result` is set then GHCi will print the result of a
       statement if and only if:

       - The statement is not a binding, or it is a monadic binding
	 (``p <- e``) that binds exactly one variable.

       - The variable's type is not polymorphic, is not ``()``, and is an
	 instance of ``Show``.

.. ghc-flag:: -fprint-bind-result

    :ghc-flag:`-fprint-bind-result` が設定されていれば，GHCiは次の場合(かつ，その場合に限り)
    文の結果を表示します．

    - 当該の文が束縛ではないか，1つの変数だけを束縛するモナド束縛(``p <- e``)の場合．

    - 変数の型が多相的でなく， ``()`` でもなく， ``Show`` のインスタンスである場合．

..
   Of course, you can also bind normal non-IO expressions using the
   ``let``\-statement:

   .. code-block:: none

       Prelude> let x = 42
       Prelude> x
       42
       Prelude>

もちろん，``let`` 文を使って，ふつうの非IO式で束縛することもできます．

.. code-block:: none

    Prelude> let x = 42
    Prelude> x
    42
    Prelude>

..
   Another important difference between the two types of binding is that
   the monadic bind (``p <- e``) is *strict* (it evaluates ``e``), whereas
   with the ``let`` form, the expression isn't evaluated immediately:

   .. code-block:: none

       Prelude> let x = error "help!"
       Prelude> print x
       *** Exception: help!
       Prelude>

この2種類の束縛のもうひとつ重要な違いは，
モナド束縛(``p <- e``)は *正格* (``e`` を評価)ですが，
``let`` 形式では式はすぐには評価されないということです．

.. code-block:: none

    Prelude> let x = error "help!"
    Prelude> print x
    *** Exception: help!
    Prelude>

..
   Note that ``let`` bindings do not automatically print the value bound,
   unlike monadic bindings.

``let`` 束縛では，モナド束縛とは違い，束縛値が自動的に表示されることはありません．

..
   You can also define functions at the prompt:

   .. code-block:: none

       Prelude> add a b = a + b
       Prelude> add 1 2
       3
       Prelude>

プロンプトで関数を定義することもできます．

.. code-block:: none

    Prelude> add a b = a + b
    Prelude> add 1 2
    3
    Prelude>

..
   However, this quickly gets tedious when defining functions with multiple
   clauses, or groups of mutually recursive functions, because the complete
   definition has to be given on a single line, using explicit semicolons
   instead of layout:

   .. code-block:: none

       Prelude> f op n [] = n ; f op n (h:t) = h `op` f op n t
       Prelude> f (+) 0 [1..3]
       6
       Prelude>

しかし，複数の節からなる関数を定義したり，相互再帰的な関数を定義したりしようとすると，
このやりかたはすぐ面倒になります．
レイアウト規則が使えず，定義全体を明示的なブレースとセミコロンを使って一行で与えないといけないからです．

.. code-block:: none

    Prelude> f op n [] = n ; f op n (h:t) = h `op` f op n t
    Prelude> f (+) 0 [1..3]
    6
    Prelude>

..
   To alleviate this issue, GHCi commands can be split over multiple lines,
   by wrapping them in ``:{`` and ``:}`` (each on a single line of its
   own):

   .. code-block:: none

       Prelude> :{
       Prelude| g op n [] = n
       Prelude| g op n (h:t) = h `op` g op n t
       Prelude| :}
       Prelude> g (*) 1 [1..3]
       6

この問題を軽減するために，GHCi コマンドは複数行に渡って書くことができるようになっています．
``:{`` および ``:}`` で，それぞれ1行を使います．

.. code-block:: none

    Prelude> :{
    Prelude| g op n [] = n
    Prelude| g op n (h:t) = h `op` g op n t
    Prelude| :}
    Prelude> g (*) 1 [1..3]
    6

..
   Such multiline commands can be used with any GHCi command, and note that
   the layout rule is in effect. The main purpose of multiline commands is
   not to replace module loading but to make definitions in .ghci-files
   (see :ref:`ghci-dot-files`) more readable and maintainable.

Such multiline commands can be used with any GHCi command, and note that
このような複数行コマンドは任意のGHCiコマンドについて用いることができます．
このときレイアウト規則が有効であることに注意してください．
複数行コマンドの主な目的は，モジュールのロードの代替にすることではなく，
.ghciファイル(:ref:`ghci-dot-files` 参照)での定義を読みやすく保守しやするするためです．

..
   Any exceptions raised during the evaluation or execution of the
   statement are caught and printed by the GHCi command line interface (for
   more information on exceptions, see the module ``Control.Exception`` in
   the libraries :base-ref:`documentation <Control-Exception.html>`).

Any exceptions raised during the evaluation or execution of the
文を評価または実行している間に発生した例外は，GHCiのコマンド行インターフェイスによって捕捉され，
表示されます(例外について詳しくはライブラリドキュメント ``Control.Exception``
モジュールのライブラリ :base-ref:`文書 <Control-Exception.html>` を参照してください)．

..
   Every new binding shadows any existing bindings of the same name,
   including entities that are in scope in the current module context.

新しい束縛は，同じ名前の既存の束縛をシャドウし(覆い隠し)ます．
これは現在のモジュールの文脈でスコープにある実体もシャドウします．

..
   .. warning::
       Temporary bindings introduced at the prompt only last until the
       next :ghci-cmd:`:load` or :ghci-cmd:`:reload` command, at which time they
       will be simply lost. However, they do survive a change of context with
       :ghci-cmd:`:module`: the temporary bindings just move to the new location.

.. warning::
    プロンプトで導入さた束縛あ一時的なもので，
    次に :ghci-cmd:`:load` あるいは :ghci-cmd:`:reload` コマンドが実行されるまでの間のことです．
    これらのコマンドが実行されると，一時的な束縛は消えてしまいます．
    ただし，:ghci-cmd:`:module`: で文脈を変更しても一時的は束縛は新しい場所へ移動し，
    消えることはありません．

..
   .. hint::
       To get a list of the bindings currently in scope, use the
       :ghci-cmd:`:show bindings` command:

       .. code-block:: none

	   Prelude> :show bindings
	   x :: Int
	   Prelude>

.. hint::
    :ghci-cmd:`:show bindings` コマンドを使えば，その時点でスコープにある束縛の一覧がえられます．

    .. code-block:: none

        Prelude> :show bindings
        x :: Int
        Prelude>

..
   .. hint::
       If you turn on the ``+t`` option, GHCi will show the type of each
       variable bound by a statement. For example:

       .. code-block:: none

	   Prelude> :set +t
	   Prelude> let (x:xs) = [1..]
	   x :: Integer
	   xs :: [Integer]

       .. index::
	   single: +t option; in GHCi

.. hint::
    ``+t`` オプションを指定すると，GHCi は文が束縛したそれぞれの変数の型を表示するようになります．
    以下はその例です．

    .. code-block:: none

        Prelude> :set +t
        Prelude> let (x:xs) = [1..]
        x :: Integer
        xs :: [Integer]

    .. index::
        single: +t option; in GHCi

..
   .. _ghci-multiline:

   Multiline input
   ~~~~~~~~~~~~~~~

.. _ghci-multiline:

複数行入力
~~~~~~~~~~

..
   Apart from the ``:{ ... :}`` syntax for multi-line input mentioned
   above, GHCi also has a multiline mode, enabled by ``:set +m``,
   ``:set +m`` in which GHCi detects automatically when the current
   statement is unfinished and allows further lines to be added. A
   multi-line input is terminated with an empty line. For example:

   .. code-block:: none

       Prelude> :set +m
       Prelude> let x = 42
       Prelude|

上で説明しあた ``:{ ... :}`` 構文による複数行入力のほかに，GHCiでは ``:set +m``
とすると有効になる複数行モードがあります．
このモードでは，現在の文が入力途中であることをGHCiが自動的に検出します．
その先の入力ができるようになります．
複数行入力は空行で終端します．
実際の入力例は以下のとおりです．

.. code-block:: none

    Prelude> :set +m
    Prelude> let x = 42
    Prelude|

..
   Further bindings can be added to this ``let`` statement, so GHCi
   indicates that the next line continues the previous one by changing the
   prompt. Note that layout is in effect, so to add more bindings to this
   ``let`` we have to line them up:

   .. code-block:: none

       Prelude> :set +m
       Prelude> let x = 42
       Prelude|     y = 3
       Prelude|
       Prelude>

この ``let`` 文にはさらに束縛を追加できます．
GHCiのプロンプトが変り，直前の行の続きを入力できることが判ります．
レイアウト規則は有効ですので，この ``let`` にさらに束縛を加えるには
束縛の先頭位置をそろえる必要があることに注意してください．

.. code-block:: none

    Prelude> :set +m
    Prelude> let x = 42
    Prelude|     y = 3
    Prelude|
    Prelude>

..
   Explicit braces and semicolons can be used instead of layout:

   .. code-block:: none

       Prelude> do {
       Prelude| putStrLn "hello"
       Prelude| ;putStrLn "world"
       Prelude| }
       hello
       world
       Prelude>

   Note that after the closing brace, GHCi knows that the current statement
   is finished, so no empty line is required.

レイアウトではなく明示的にブレースをセミコロンを使うこともできます．

.. code-block:: none

    Prelude> do {
    Prelude| putStrLn "hello"
    Prelude| ;putStrLn "world"
    Prelude| }
    hello
    world
    Prelude>

閉じブレースの後は，現在の文がおわっていることが判るので，空行は必要ありません．

..
   Multiline mode is useful when entering monadic ``do`` statements:

   .. code-block:: none

       Control.Monad.State> flip evalStateT 0 $ do
       Control.Monad.State| i <- get
       Control.Monad.State| lift $ do
       Control.Monad.State|   putStrLn "Hello World!"
       Control.Monad.State|   print i
       Control.Monad.State|
       "Hello World!"
       0
       Control.Monad.State>

複数行モードはモナドの ``do`` 文を入力するのに便利です．

.. code-block:: none

    Control.Monad.State> flip evalStateT 0 $ do
    Control.Monad.State| i <- get
    Control.Monad.State| lift $ do
    Control.Monad.State|   putStrLn "Hello World!"
    Control.Monad.State|   print i
    Control.Monad.State|
    "Hello World!"
    0
    Control.Monad.State>

..
   During a multiline interaction, the user can interrupt and return to the
   top-level prompt.

   .. code-block:: none

       Prelude> do
       Prelude| putStrLn "Hello, World!"
       Prelude| ^C
       Prelude>

複数行モードで入力中に中断してトップレベルのプロンプトに戻ることもできます．

.. code-block:: none

    Prelude> do
    Prelude| putStrLn "Hello, World!"
    Prelude| ^C
    Prelude>

..
   .. _ghci-decls:

   Type, class and other declarations
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _ghci-decls:

型，クラス，その他の宣言
~~~~~~~~~~~~~~~~~~~~~~~~

..
   At the GHCi prompt you can also enter any top-level Haskell declaration,
   including ``data``, ``type``, ``newtype``, ``class``, ``instance``,
   ``deriving``, and ``foreign`` declarations. For example:

   .. code-block:: none

       Prelude> data T = A | B | C deriving (Eq, Ord, Show, Enum)
       Prelude> [A ..]
       [A,B,C]
       Prelude> :i T
       data T = A | B | C      -- Defined at <interactive>:2:6
       instance Enum T -- Defined at <interactive>:2:45
       instance Eq T -- Defined at <interactive>:2:30
       instance Ord T -- Defined at <interactive>:2:34
       instance Show T -- Defined at <interactive>:2:39

GHCi のプロンプトには，Haskellの任意のトップレベル宣言を入力できます．
これには ``data`` ， ``type`` ， ``newtype`` ， ``class`` ， ``instance`` ，
``deriving`` ， ``foreign`` 宣言が含まれています．
例は以下のとおり．

.. code-block:: none

    Prelude> data T = A | B | C deriving (Eq, Ord, Show, Enum)
    Prelude> [A ..]
    [A,B,C]
    Prelude> :i T
    data T = A | B | C      -- Defined at <interactive>:2:6
    instance Enum T -- Defined at <interactive>:2:45
    instance Eq T -- Defined at <interactive>:2:30
    instance Ord T -- Defined at <interactive>:2:34
    instance Show T -- Defined at <interactive>:2:39

..
   As with ordinary variable bindings, later definitions shadow earlier
   ones, so you can re-enter a declaration to fix a problem with it or
   extend it. But there's a gotcha: when a new type declaration shadows an
   older one, there might be other declarations that refer to the old type.
   The thing to remember is that the old type still exists, and these other
   declarations still refer to the old type. However, while the old and the
   new type have the same name, GHCi will treat them as distinct. For
   example:

   .. code-block:: none

       Prelude> data T = A | B
       Prelude> let f A = True; f B = False
       Prelude> data T = A | B | C
       Prelude> f A

       <interactive>:2:3:
	   Couldn't match expected type `main::Interactive.T'
		       with actual type `T'
	   In the first argument of `f', namely `A'
	   In the expression: f A
	   In an equation for `it': it = f A
       Prelude>

As with ordinary variable bindings, later definitions shadow earlier
通常の変数束縛と同様に，後で定義されたものは古い定義をシャドウしてしまうので，
定義を再入力すれば，問題を修正したり拡張したりできます．
ただし，落とし穴があります．
新しい型宣言が古い型宣言をシャドウするとき，古い型の定義を参照している別の宣言があるかもしれません．
この古い型はまだ存在し，この別の宣言はまだ古い型を参照しているということを覚えておいてください．
古い型と新しい型は同じ名前ですが，GHCiはこれらを区別するということです．
たとえば，

.. code-block:: none

    Prelude> data T = A | B
    Prelude> let f A = True; f B = False
    Prelude> data T = A | B | C
    Prelude> f A

    <interactive>:4:3: error:
        • Couldn't match expected type ‘Ghci1.T’
                      with actual type ‘T’
          NB: ‘T’ is defined at <interactive>:3:1-18
              ‘Ghci1.T’ is defined at <interactive>:1:1-14
        • In the first argument of ‘f’, namely ‘A’
          In the expression: f A
	  In an equation for ‘it’: it = f A
    Prelude>

..
   The old, shadowed, version of ``T`` is displayed as
   ``main::Interactive.T`` by GHCi in an attempt to distinguish it from the
   new ``T``, which is displayed as simply ``T``.

シャドウされた古いほうの ``T`` は ``Ghci1.T`` と表示されています．
これは，単に ``T`` と表示されている新しい方と区別するためです．

..
   Class and type-family instance declarations are simply added to the list
   of available instances, with one exception. Since you might want to
   re-define one, a class or type-family instance *replaces* any earlier
   instance with an identical head or left hand side (respectively). (See
   :ref:`type-families`.)

クラスや型族のインスタンス宣言は，単に利用可能なインスタンスの一覧に追加されるだけです．
ただし例外が一つあります．
クラスや型族インスタンスは再定義したいこともあるので，
頭部あるいは左辺が同一であるインスタンスはそれぞれ新しいもので *置き換える* ことになります
(:ref:`type-families` 参照)．

..
   .. _ghci-scope:

   What’s really in scope at the prompt?
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _ghci-scope:

プロンプトのスコープにあるもの
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   When you type an expression at the prompt, what identifiers and types
   are in scope? GHCi provides a flexible way to control exactly how the
   context for an expression is constructed:

   -  The :ghci-cmd:`:load`, :ghci-cmd:`:add`, and :ghci-cmd:`:reload` commands
      (:ref:`ghci-load-scope`).

   -  The ``import`` declaration (:ref:`ghci-import-decl`).

   -  The :ghci-cmd:`:module` command (:ref:`ghci-module-cmd`).

プロンプトに式を入力するとき，どの識別子や型がスコープにあるのでしょうか．
以下のように，GHCiでは，式を評価する際の環境を構成する方法を正確に指定できます．      

-  :ghci-cmd:`:load` ， :ghci-cmd:`:add` ， :ghci-cmd:`:reload` コマンド
   (:ref:`ghci-load-scope`)．

-  ``import`` 宣言(:ref:`ghci-import-decl`)．

-  :ghci-cmd:`:module` コマンド(:ref:`ghci-module-cmd`)．

..
   The command :ghci-cmd:`:show imports` will show a summary of which modules
   contribute to the top-level scope.

   .. hint::
       GHCi will tab-complete names that are in scope; for example, if
       you run GHCi and type ``J<tab>`` then GHCi will expand it to
       ``Just``.

:ghci-cmd:`:show imports` を使えば，トップレベルのスコープにどのモジュールがあるか要約を表示できます．

.. hint::
    GHCi ではスコープ内にある名前をタブ補完できます．
    たとえば，GHCiを起動して ``J<tab>`` と入力すると ``Just`` と展開されます．

..
   .. _ghci-load-scope:

   The effect of ``:load`` on what is in scope
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _ghci-load-scope:

スコープ内容に対する ``:load`` の影響
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..
   The :ghci-cmd:`:load`, :ghci-cmd:`:add`, and :ghci-cmd:`:reload` commands
   (:ref:`loading-source-files` and :ref:`ghci-compiled`) affect the
   top-level scope. Let's start with the simple cases; when you start GHCi
   the prompt looks like this:

   .. code-block:: none

       Prelude>

   which indicates that everything from the module ``Prelude`` is currently
   in scope; the visible identifiers are exactly those that would be
   visible in a Haskell source file with no ``import`` declarations.

:ghci-cmd:`:load` ， :ghci-cmd:`:add` ， :ghci-cmd:`:reload` コマンド
(:ref:`loading-source-files` と :ref:`ghci-compiled` を参照) はトップレベルのスコープに影響します．
単純な場合から始めましょう．
GHCi を起動すると最初のプロンプトは以下のようになります．

.. code-block:: none

    Prelude>

これは現在のスコープにあるものはすべて ``Prelude`` モジュール由来であるということを示しています．
ここで見える識別子は ``import`` 宣言のないHaskellのソースファイルから見える識別子と一致しています．

..
   If we now load a file into GHCi, the prompt will change:

   .. code-block:: none

       Prelude> :load Main.hs
       Compiling Main             ( Main.hs, interpreted )
       *Main>

   The new prompt is ``*Main``, which indicates that we are typing
   expressions in the context of the top-level of the ``Main`` module.
   Everything that is in scope at the top-level in the module ``Main`` we
   just loaded is also in scope at the prompt (probably including
   ``Prelude``, as long as ``Main`` doesn't explicitly hide it).

ここで，GHCiにファイルをロードすると，プロンプトは変化します．

.. code-block:: none

    Prelude> :load Main.hs
    Compiling Main             ( Main.hs, interpreted )
    *Main>

新しいプロンプトは ``*Main> `` です．
これはプロンプトに入力した式の文脈が ``Main`` モジュールのトップレベルの文脈であることを示しています．
ロードした ``Main`` モジュールのトップレベルのスコープにあるものはすべて，
このプロンプトのスコープにあります
(``Main`` が明示的に隠蔽していなければ ``Prelude`` も含まれます）．

..
   The syntax in the prompt ``*module`` indicates that it is the full
   top-level scope of ⟨module⟩ that is contributing to the scope for
   expressions typed at the prompt. Without the ``*``, just the exports of
   the module are visible.

   .. note::
       For technical reasons, GHCi can only support the ``*``-form for
       modules that are interpreted. Compiled modules and package modules can
       only contribute their exports to the current scope. To ensure that GHCi
       loads the interpreted version of a module, add the ``*`` when loading
       the module, e.g. ``:load *M``.

プロンプトの ``*module`` という構文は，このプロンプトに入力した式のスコープは
⟨module⟩ のトップレベルのスコープであることを示しています．
``*`` が付かない場合は当該モジュールからエクスポートされたものだけが見えるということです．

.. note::
    技術的理由により，GHCi が ``*`` 形式で表示できるのは解釈実行するモジュールに限られます．
    コンパイル済みのモジュールおよびパッケージモジュールの場合は，それらから，エクスポート
    されたものだけが現在のスコープに入ります．
    GHCi が解釈実行版のモジュールをロードするようにするには，モジュールをロードするときに
    ``*`` を付けます．たとえば ``:load *M`` のようにロードします．

..
   In general, after a :ghci-cmd:`:load` command, an automatic import is added to
   the scope for the most recently loaded "target" module, in a ``*``-form
   if possible. For example, if you say ``:load foo.hs bar.hs`` and
   ``bar.hs`` contains module ``Bar``, then the scope will be set to
   ``*Bar`` if ``Bar`` is interpreted, or if ``Bar`` is compiled it will be
   set to ``Prelude Bar`` (GHCi automatically adds ``Prelude`` if it isn't
   present and there aren't any ``*``-form modules). These
   automatically-added imports can be seen with :ghci-cmd:`:show imports`:

   .. code-block:: none

       Prelude> :load hello.hs
       [1 of 1] Compiling Main             ( hello.hs, interpreted )
       Ok, modules loaded: Main.
       *Main> :show imports
       :module +*Main -- added automatically
       *Main>

   and the automatically-added import is replaced the next time you use
   :ghci-cmd:`:load`, :ghci-cmd:`:add`, or :ghci-cmd:`:reload`. It can also be
   removed by :ghci-cmd:`:module` as with normal imports.

一般に :ghci-cmd:`:load` コマンドが発行された後，直近にロードされた「ターゲット」モジュールに対する
インポートが自動的にスコープに追加されます．
このとき，可能なら ``*`` 形式が使われます．
たとえば ``:load foo.hs bar.hs`` と入力したとき ``bar.hs`` に ``Bar`` というモジュールがあるとすると，
``Bar`` が解釈実行されているなら，スコープは ``*Bar`` に設定され， ``Bar`` がコンパイル済みなら，
スコープは ``Prelude Bar`` になります
(GHCiは ``Prelude`` が指定されておらず，しかも ``*`` 形式のモジュールが一つもなければ ``Prelude``
を自動的に付け加えます)．
これらの自動に追加されたインポートについては :ghci-cmd:`:show imports` で表示できます．

.. code-block:: none

    Prelude> :load hello.hs
    [1 of 1] Compiling Main             ( hello.hs, interpreted )
    Ok, modules loaded: Main.
    *Main> :show imports
    :module +*Main -- added automatically
    *Main>

この自動的に追加されたインポートは，次に :ghci-cmd:`:load` ，
:ghci-cmd:`:add` あるいは :ghci-cmd:`:reload` を発行すると別のものに置き換えられます．
通常のインポートと同様に :ghci-cmd:`:module` で削除することもできます．

..
   .. _ghci-import-decl:

   Controlling what is in scope with ``import``
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _ghci-import-decl:

``import`` によるスコープ制御
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..
   We are not limited to a single module: GHCi can combine scopes from
   multiple modules, in any mixture of ``*`` and non-\ ``*`` forms. GHCi
   combines the scopes from all of these modules to form the scope that is
   in effect at the prompt.

GHCi が扱えるのは単一のモジュールだけではありません．
複数のモジュールからのスコープを組み合わせることもできます．
このとき ``*`` 形式とそうでない形式を混ぜて使えます．
GHCi はこのようなモジュールのスコープのを全て組み合わせて，プロンプトのスコープします．

..
   To add modules to the scope, use ordinary Haskell ``import`` syntax:

   .. code-block:: none

       Prelude> import System.IO
       Prelude System.IO> hPutStrLn stdout "hello\n"
       hello
       Prelude System.IO>

モジュールをスコープに加えるには，通常はHaskellの ``import`` 構文を使います．

.. code-block:: none

    Prelude> import System.IO
    Prelude System.IO> hPutStrLn stdout "hello"
    hello
    Prelude System.IO>

..
   The full Haskell import syntax is supported, including ``hiding`` and
   ``as`` clauses. The prompt shows the modules that are currently
   imported, but it omits details about ``hiding``, ``as``, and so on. To
   see the full story, use :ghci-cmd:`:show imports`:

   .. code-block:: none

       Prelude> import System.IO
       Prelude System.IO> import Data.Map as Map
       Prelude System.IO Map> :show imports
       import Prelude -- implicit
       import System.IO
       import Data.Map as Map
       Prelude System.IO Map>

``hiding`` 節および ``as`` 節を含む完全なHaskellのインポート構文がサポートされています．
プロンプトには現在インポートされているモジュールが表示されていますが，
``hiding`` や ``as`` やその他の詳細は省略されています．
その部分を知りたければ :ghci-cmd:`:show imports` を使って下さい．

.. code-block:: none

    Prelude> import System.IO
    Prelude System.IO> import Data.Map as Map
    Prelude System.IO Map> :show imports
    import Prelude -- implicit
    import System.IO
    import Data.Map as Map
    Prelude System.IO Map>

..
   Note that the ``Prelude`` import is marked as implicit. It can be
   overridden with an explicit ``Prelude`` import, just like in a Haskell
   module.

``Prelude`` のインポートについては implicit (暗黙) と表示されることに注意してください．
明示的に ``Prelude`` をインポートすれば，他のモジュールと同じように表示されます．

..
   With multiple modules in scope, especially multiple ``*``-form modules,
   it is likely that name clashes will occur. Haskell specifies that name
   clashes are only reported when an ambiguous identifier is used, and GHCi
   behaves in the same way for expressions typed at the prompt.

複数のモジュールがスコープにあるとき，特に複数の ``*`` 形式のモジュールがあるときは，
名前の衝突が起こりやすくなります．
Haskell では名前の衝突が起こったことが報告されるのは，実際に曖昧な名前が使われたときに限ると規定されています．
GHCi もプロンプトで入力される式についてはこれにならった振る舞いをします．

..
   .. _ghci-module-cmd:

   Controlling what is in scope with the ``:module`` command
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _ghci-module-cmd:

``:module`` コマンドによるスコープ制御
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..
   Another way to manipulate the scope is to use the :ghci-cmd:`:module`
   command, whose syntax is this:

   .. code-block:: none

       :module +|- *mod1 ... *modn

   Using the ``+`` form of the ``module`` commands adds modules to the
   current scope, and ``-`` removes them. Without either ``+`` or ``-``,
   the current scope is replaced by the set of modules specified. Note that
   if you use this form and leave out ``Prelude``, an implicit ``Prelude``
   import will be added automatically.

スコープを操作するもう1つの方法は :ghci-cmd:`:module` コマンドです．
構文は以下のとおりになります．

.. code-block:: none

    :module +|- *mod1 ... *modn

``+`` 形式の ``module`` コマンドでモジュールを現在のスコープに追加し，
``-`` 形式でモジュールを現在のスコープから削除します．
``+`` 形式でも ``-`` 形式でもない場合には，指定されたモジュール群が現在のスコープに置き換わります．
``+`` 形式でも ``-`` 形式でもなく，``Prelude`` も指定に含まれていない場合は，
自動的に，暗黙に ``Prelude`` をインポートします．

..
   The :ghci-cmd:`:module` command provides a way to do two things that cannot be
   done with ordinary ``import`` declarations:

   -  :ghci-cmd:`:module` supports the ``*`` modifier on modules, which opens the
      full top-level scope of a module, rather than just its exports.

   -  Imports can be *removed* from the context, using the syntax
      ``:module -M``. The ``import`` syntax is cumulative (as in a Haskell
      module), so this is the only way to subtract from the scope.

:ghci-cmd:`:module` コマンドでは通常の ``import`` 宣言ではできないことが2つ可能になります．

-  :ghci-cmd:`:module` コマンドでは，モジュールを ``*`` で修飾できます．そうすると，単にモジュールがエクスポートしているものだけではなく，モジュールのトップレベルのスコープが完全にオープンになります．

-  ``:module -M`` 構文を使うと，文脈からモジュールを削除できます．``import`` 構文は累積的(Haskellのモジュール内と同様)なので，これがスコープからモジュールを取り除く唯一の方法です．

..
   .. _ghci-import-qualified:

   Qualified names
   ^^^^^^^^^^^^^^^

.. _ghci-import-qualified:

修飾名
^^^^^^

..
   To make life slightly easier, the GHCi prompt also behaves as if there
   is an implicit ``import qualified`` declaration for every module in
   every package, and every module currently loaded into GHCi. This
   behaviour can be disabled with the ``-fno-implicit-import-qualified`` flag.

   .. index::
      single: -fno-implicit-import-qualified

To make life slightly easier, the GHCi prompt also behaves as if there
手間をすこし省くことができるように，GHCiのプロンプトは全てのパッケージの全てのモジュールと，現在GHCiにロードされている全てのモジュールについて，暗黙の ``import qualified`` 宣言があるかのように振る舞います．
これは ``-fno-implicit-import-qualified`` というフラグで無効にできます．

.. index::
   single: -fno-implicit-import-qualified

..
   ``:module`` and ``:load``
   ^^^^^^^^^^^^^^^^^^^^^^^^^

``:module`` と ``:load``
^^^^^^^^^^^^^^^^^^^^^^^^

..
   It might seem that :ghci-cmd:`:module`/``import`` and
   :ghci-cmd:`:load`/:ghci-cmd:`:add`/:ghci-cmd:`:reload` do similar things: you
   can use both to bring a module into scope. However, there is a very important
   difference. GHCi is concerned with two sets of modules:

   -  The set of modules that are currently *loaded*. This set is modified
      by :ghci-cmd:`:load`, :ghci-cmd:`:add` and :ghci-cmd:`:reload`, and can be shown with
      :ghci-cmd:`:show modules`.

   -  The set of modules that are currently *in scope* at the prompt. This set is
      modified by ``import`` and :ghci-cmd:`:module`, and it is also modified
      automatically after :ghci-cmd:`:load`, :ghci-cmd:`:add`, and
      :ghci-cmd:`:reload`, as described above. The set of modules in scope can be
      shown with :ghci-cmd:`:show imports`.

:ghci-cmd:`:module`/``import`` と :ghci-cmd:`:load`/:ghci-cmd:`:add`/:ghci-cmd:`:reload` とは同じものという気がするかもしれません．
どちらも，モジュールをスコープに入れるために使うものです．
しかし，この2つには大きな違いがあります．
GHCi は2種類のモジュール集合にかかわっています．

-  現在 *ロード済み* のモジュール集合．
   このモジュール集合は :ghci-cmd:`:load` ， :ghci-cmd:`:add` ， :ghci-cmd:`:reload` で変更し，
   :ghci-cmd:`:show modules` で表示できます．

-  現在，プロンプトの *スコープ内* にあるモジュール集合．
   このモジュール集合は ``import`` および :ghci-cmd:`:module` で変更します．
   :ghci-cmd:`:load` ， :ghci-cmd:`:add` ， :ghci-cmd:`:reload` コマンドを発行すると
   このモジュール集合は，上述のように自動的に変更されます．
   表示するためには :ghci-cmd:`:show imports` を使います．

..
   You can add a module to the scope (via :ghci-cmd:`:module` or ``import``) only
   if either (a) it is loaded, or (b) it is a module from a package that
   GHCi knows about. Using :ghci-cmd:`:module` or ``import`` to try bring into
   scope a non-loaded module may result in the message
   ``module M is not loaded``.

(:ghci-cmd:`:module` あるいは ``import`` 経由)モジュールをスコープに追加できるのは，
(a) ロード済みのモジュール，(b) GHCiが知っているパッケージ由来のモジュール，のどちらかだけです．
:ghci-cmd:`:module` あるいは ``import`` を使って，ロードされていないモジュールをスコープに
追加しようとすると ``module M is not loaded`` というメッセージが表示されることでしょう．

..
   The ``:main`` and ``:run`` commands
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``:main`` コマンドと ``:run`` コマンド
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   When a program is compiled and executed, it can use the ``getArgs``
   function to access the command-line arguments. However, we cannot simply
   pass the arguments to the ``main`` function while we are testing in
   ghci, as the ``main`` function doesn't take its directly.

プログラムをコンパイルして実行するとき ``getArgs`` 関数を使っていれば，コマンドライン引数にアクセスできます．
しかし ``main`` は直接引数を取りませんので，ghci でテストしているときは単純にコマンドライン引数を渡すことができません．

..
   Instead, we can use the :ghci-cmd:`:main` command. This runs whatever ``main``
   is in scope, with any arguments being treated the same as command-line
   arguments, e.g.:

   .. code-block:: none

       Prelude> main = System.Environment.getArgs >>= print
       Prelude> :main foo bar
       ["foo","bar"]

その代りとして :ghci-cmd:`:main` コマンドを使います．
このコマンドはスコープ内にある ``main`` を以下のようにコマンドライン引数を渡した状態にして起動します．

.. code-block:: none

    Prelude> main = System.Environment.getArgs >>= print
    Prelude> :main foo bar
    ["foo","bar"]

..
   We can also quote arguments which contains characters like spaces, and
   they are treated like Haskell strings, or we can just use Haskell list
   syntax:

   .. code-block:: none

       Prelude> :main foo "bar baz"
       ["foo","bar baz"]
       Prelude> :main ["foo", "bar baz"]
       ["foo","bar baz"]

スペースのような文字を含む文字列は引用符でかこって渡せます．
引数はそれぞれHaskellの文字列として扱われます．
また，Haskellのリスト構文をそのまま使うこともできます．

.. code-block:: none

    Prelude> :main foo "bar baz"
    ["foo","bar baz"]
    Prelude> :main ["foo", "bar baz"]
    ["foo","bar baz"]

..
   Finally, other functions can be called, either with the ``-main-is``
   flag or the :ghci-cmd:`:run` command:

   .. code-block:: none

       Prelude> foo = putStrLn "foo" >> System.Environment.getArgs >>= print
       Prelude> bar = putStrLn "bar" >> System.Environment.getArgs >>= print
       Prelude> :set -main-is foo
       Prelude> :main foo "bar baz"
       foo
       ["foo","bar baz"]
       Prelude> :run bar ["foo", "bar baz"]
       bar
       ["foo","bar baz"]

また ``-main-is`` フラグや :ghci-cmd:`:run` コマンドを使えば，その他の関数を呼べます．

.. code-block:: none

    Prelude> foo = putStrLn "foo" >> System.Environment.getArgs >>= print
    Prelude> bar = putStrLn "bar" >> System.Environment.getArgs >>= print
    Prelude> :set -main-is foo
    Prelude> :main foo "bar baz"
    foo
    ["foo","bar baz"]
    Prelude> :run bar ["foo", "bar baz"]
    bar
    ["foo","bar baz"]

..
   The ``it`` variable
   ~~~~~~~~~~~~~~~~~~~

   .. index::
      single: it variable

``it`` 変数
~~~~~~~~~~~

.. index::
   single: it変数

..
   Whenever an expression (or a non-binding statement, to be precise) is
   typed at the prompt, GHCi implicitly binds its value to the variable
   ``it``. For example:

   .. code-block:: none

       Prelude> 1+2
       3
       Prelude> it * 2
       6

プロンプトに式(正確には非束縛文)を入力すると，
GHCi は暗黙のうちにその値で ``it`` を束縛します．
以下はその一例です．

.. code-block:: none

    Prelude> 1+2
    3
    Prelude> it * 2
    6

..
   What actually happens is that GHCi typechecks the expression, and if it
   doesn't have an ``IO`` type, then it transforms it as follows: an
   expression ``e`` turns into

   .. code-block:: none

       let it = e;
       print it

   which is then run as an IO-action.

実際はなにが起こっているかというと，GHCi は型検査を行い，その式の型が ``IO`` 型でなければ，
次のように変形します．
すなわち，ここで当該の式を ``e`` とすると,

.. code-block:: none

    let it = e;
    print it

のように変形したのち，これをIOアクションとして実行します．

..
   Hence, the original expression must have a type which is an instance of
   the ``Show`` class, or GHCi will complain:

   .. code-block:: none

       Prelude> id

       <interactive>:1:0:
	   No instance for (Show (a -> a))
	     arising from use of `print' at <interactive>:1:0-1
	   Possible fix: add an instance declaration for (Show (a -> a))
	   In the expression: print it
	   In a 'do' expression: print it

   The error message contains some clues as to the transformation happening
   internally.

そういう訳で，元の式の型は ``Show`` クラスのインスタンスでなければなりません．
``Show`` クラスのインスタンスでなかったら，GHCiは文句をいいます．

.. code-block:: none

    Prelude> id

    <interactive>:1:0:
        No instance for (Show (a -> a))
          arising from use of `print' at <interactive>:1:0-1
        Possible fix: add an instance declaration for (Show (a -> a))
        In the expression: print it
        In a 'do' expression: print it

このエラーメッセージから，内部の変形で何が起こったのか少しだけうかがい知ることができます．

..
   If the expression was instead of type ``IO a`` for some ``a``, then
   ``it`` will be bound to the result of the ``IO`` computation, which is
   of type ``a``. eg.:

   .. code-block:: none

       Prelude> Time.getClockTime
       Wed Mar 14 12:23:13 GMT 2001
       Prelude> print it
       Wed Mar 14 12:23:13 GMT 2001

式の型がなにがしかの型 ``a`` について ``IO a`` 型である場合には，
``it`` はその ``IO`` コンピュテーションの結果，つまり ``a`` 型の値で束縛されます．

.. code-block:: none

    Prelude> Time.getClockTime
    Wed Mar 14 12:23:13 GMT 2001
    Prelude> print it
    Wed Mar 14 12:23:13 GMT 2001

..
   The corresponding translation for an IO-typed ``e`` is

   .. code-block:: none

       it <- e

   Note that ``it`` is shadowed by the new value each time you evaluate a
   new expression, and the old value of ``it`` is lost.

IO型の式 ``e`` に対する変形は，

.. code-block:: none

    it <- e

となります．
    
新しい式を評価するたびに ``it`` の値は新しい値でシャドウされ，古い ``it`` の値は失われることに注意してください．

..
   .. _extended-default-rules:

   Type defaulting in GHCi
   ~~~~~~~~~~~~~~~~~~~~~~~

   .. index::
      single: Type defaulting; in GHCi
      single: Show class

.. _extended-default-rules:

GHCi でのデフォルト型設定
~~~~~~~~~~~~~~~~~~~~~~~~~

.. index::
   single: デフォルト型設定; GHCiの〜
   single: Showクラス

..
   Consider this GHCi session:

   .. code-block:: none

	 ghci> reverse []

次のGHCiセッションを考えていみましょう．

.. code-block:: none

      ghci> reverse []

..
   What should GHCi do? Strictly speaking, the program is ambiguous.
   ``show (reverse [])`` (which is what GHCi computes here) has type
   ``Show a => String`` and how that displays depends on the type ``a``.
   For example:

   .. code-block:: none

	 ghci> reverse ([] :: String)
	 ""
	 ghci> reverse ([] :: [Int])
	 []

GHCi は何をすべきでしょうか．
厳密にいえば，このプログラムは曖昧です．
``show (reverse [])`` (ここでGHCiが計算するのはこれです)の型は，
``Show a => String`` であり，これをどのように表示するかは ``a`` の型に依存します．
たとえば，

.. code-block:: none

      ghci> reverse ([] :: String)
      ""
      ghci> reverse ([] :: [Int])
      []

..
   However, it is tiresome for the user to have to specify the type, so
   GHCi extends Haskell's type-defaulting rules (Section 4.3.4 of the
   Haskell 2010 Report) as follows. The standard rules take each group of
   constraints ``(C1 a, C2 a, ..., Cn a)`` for each type variable ``a``,
   and defaults the type variable if

   1. The type variable ``a`` appears in no other constraints

   2. All the classes ``Ci`` are standard.

   3. At least one of the classes ``Ci`` is numeric.

のようになります．
しかし，ユーザがこの型を指定しなければならないというのは面倒なので，
GHCiはHaskellのデフォルト型設定規則(Haskell 2010 Report の 4.3.4 節)
を以下のように拡張しています．
標準の規則では，個々の型変数 ``a`` についてのそれぞれ制約グループ ``(C1 a, C2 a, ..., Cn a)`` を考え，
次の条件が満たされたとき，この型変数のデフォルトの型を設定します．

1. 型変数 ``a`` が他のどの制約にも現れない．

2. クラス ``Ci`` はすべて標準のクラスである．

3. クラス ``Ci`` の少くとも1つは数値である．

..
   At the GHCi prompt, or with GHC if the :ghc-flag:`-XExtendedDefaultRules` flag
   is given, the following additional differences apply:

   -  Rule 2 above is relaxed thus: *All* of the classes ``Ci`` are
      single-parameter type classes.

   -  Rule 3 above is relaxed this: At least one of the classes ``Ci`` is
      numeric, or is ``Show``, ``Eq``, ``Ord``, ``Foldable`` or ``Traversable``.

   -  The unit type ``()`` and the list type ``[]`` are added to the start of
      the standard list of types which are tried when doing type defaulting.

GHCiプロンプトあるいはGHCでは :ghc-flag:`-XExtendedDefaultRules` フラグが設定されていると，
以下のような規則変更がおこなわれます．

-  規則2の緩和: クラス ``Ci`` は *すべて* 単一パラメータの型クラスである．

-  規則3の緩和: クラス ``Ci`` のうち少くとも1つは数値であるか ``Show`` ， ``Eq`` ， ``Ord`` ， ``Foldable`` ， ``Traversable``
   のどれかである．

-  ユニット型 ``()`` およびリスト型 ``[]`` がデフォルトの型として試されるリストの先頭に追加される．

..
   The last point means that, for example, this program: ::

       main :: IO ()
       main = print def

       instance Num ()

       def :: (Num a, Enum a) => a
       def = toEnum 0

   prints ``()`` rather than ``0`` as the type is defaulted to ``()``
   rather than ``Integer``.

最後の点は，たとえば，以下のプログラムに影響します． ::

    main :: IO ()
    main = print def

    instance Num ()

    def :: (Num a, Enum a) => a
    def = toEnum 0

このプログラムは ``0`` ではなく ``()`` を表示します．
それは ``a`` のデフォルトの型が ``Integer`` ではなく ``()`` に設定されるからです．

..
   The motivation for the change is that it means ``IO a`` actions default
   to ``IO ()``, which in turn means that ghci won't try to print a result
   when running them. This is particularly important for ``printf``, which
   has an instance that returns ``IO a``. However, it is only able to
   return ``undefined`` (the reason for the instance having this type is so
   that printf doesn't require extensions to the class system), so if the
   type defaults to ``Integer`` then ghci gives an error when running a
   printf.

このような変更を行う動機は ``IO a`` アクションのデフォルトの型は ``IO ()`` になるので，
これを実行したときghciは結果を表示する面倒がないというものです．
とくに ``printf`` にとってはこれが重要で ``printf`` のインスタンスで ``IO a`` を返すものがありますが，
それができることといえば ``undefined`` を返すこと以外ありません
(printf が型クラスシステムの拡張を必要としないようにというのがその理由)．
したがって，もしここでデフォルトの型が ``Integer`` だと，printfを走らせると，ghciがエラーになってしまいます．

..
   See also :ref:`actions-at-prompt` for how the monad of a computational
   expression defaults to ``IO`` if possible.

計算を扱うモナドは，可能であるなら ``IO`` がデフォルトであることについては :ref:`actions-at-prompt` を参照してください．

..
   .. _ghci-interactive-print:

   Using a custom interactive printing function
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   .. index::
      single: Custom printing function; in GHCi

.. _ghci-interactive-print:

独自の対話表示関数を使う
~~~~~~~~~~~~~~~~~~~~~~~~

.. index::
   single: 独自の表示関数; GHCiの〜

..
   Since GHC 7.6.1, GHCi prints the result of expressions typed at the prompt
   using the function ``System.IO.print``. Its type signature is ``Show a => a ->
   IO ()``, and it works by converting the value to ``String`` using ``show``.

GHC 7.6.1 以降，GHCiはプロンプトに入力された式の結果を ``System.IO.print`` を使って表示します．
この関数の型シグネチャは ``Show a => a -> IO ()`` で，値を ``show`` を使って ``String`` に変換しています．

..
   This is not ideal in certain cases, like when the output is long, or
   contains strings with non-ascii characters.

このやり方が理想的ではない場合があります．
出力が長い場合や非アスキー文字が含まれるというような場合です．

..
   The :ghc-flag:`-interactive-print` flag allows to specify any function of type
   ``C a => a -> IO ()``, for some constraint ``C``, as the function for
   printing evaluated expressions. The function can reside in any loaded
   module or any registered package, but only when it resides in a registered
   package will it survive a :ghci-cmd:`:cd`, :ghci-cmd:`:add`, :ghci-cmd:`:load`,
   :ghci-cmd:`:reload` or, :ghci-cmd:`:set`.

:ghc-flag:`-interactive-print` フラグを使えば，何らかの制約を ``C`` として，
``C a => a -> IO ()`` という型の関数を評価済みの式の値を表示する関数として指定できるようになります．
この関数はロード済みのモジュールまたは登録済みのパッケージに置いてあればよいのですが，
登録済みのパッケージに置いてある場合のみ :ghci-cmd:`:cd` ， :ghci-cmd:`:add` ， :ghci-cmd:`:load` ， :ghci-cmd:`:reload` あるいは :ghci-cmd:`:set` というコマンドをくぐり抜けられます．

..
   .. ghc-flag:: -interactive-print <expr>

       Set the function used by GHCi to print evaluation results. Expression
       must be of type ``C a => a -> IO ()``.

.. ghc-flag:: -interactive-print <expr>

    GHCiが評価結果を表示するのに使う関数を設定します．
    このとき〈expr〉の型は ``C a => a -> IO ()`` でなければなりません．

..
   As an example, suppose we have following special printing module: ::

       module SpecPrinter where
       import System.IO

       sprint a = putStrLn $ show a ++ "!"

例として，以下の特別な表示モジュールがあるとしましょう． ::

    module SpecPrinter where
    import System.IO

    sprint a = putStrLn $ show a ++ "!"

..
   The ``sprint`` function adds an exclamation mark at the end of any
   printed value. Running GHCi with the command:

   .. code-block:: none

       ghci -interactive-print=SpecPrinter.sprinter SpecPrinter

   will start an interactive session where values with be printed using
   ``sprint``:

   .. code-block:: none

       *SpecPrinter> [1,2,3]
       [1,2,3]!
       *SpecPrinter> 42
       42!

``sprint`` 関数は表示された値の最後に感嘆符を追加します．
以下のコマンド

.. code-block:: none

    ghci -interactive-print=SpecPrinter.sprinter SpecPrinter

でGHCiを起動すると，対話セッションが始まり，そこでは値は ``sprint`` で表示されます．

.. code-block:: none

    *SpecPrinter> [1,2,3]
    [1,2,3]!
    *SpecPrinter> 42
    42!

..
   A custom pretty printing function can be used, for example, to format
   tree-like and nested structures in a more readable way.

これには独自の整形表示関数が使えます．
たとえばツリー構造や入れ子構造をよりよみやすい形式で表示できます．

..
   The :ghc-flag:`-interactive-print` flag can also be used when running GHC in
   ``-e mode``:

   .. code-block:: none

       % ghc -e "[1,2,3]" -interactive-print=SpecPrinter.sprint SpecPrinter
       [1,2,3]!

:ghc-flag:`-interactive-print` フラグはGHCを ``-e mode`` で起動したときにも使えます．

.. code-block:: none

    % ghc -e "[1,2,3]" -interactive-print=SpecPrinter.sprint SpecPrinter
    [1,2,3]!

..
   .. _ghci-stack-traces:

   Stack Traces in GHCi
   ~~~~~~~~~~~~~~~~~~~~

   .. index::
     simple: stack trace; in GHCi

.. _ghci-stack-traces:

GHCiのスタックトレース
~~~~~~~~~~~~~~~~~~~~~~

.. index::
  simple: スタックトレース; GHCiの〜


..
   [ This is an experimental feature enabled by the new
   ``-fexternal-interpreter`` flag that was introduced in GHC 8.0.1.  It
   is currently not supported on Windows.]

[ この機能は GHC 8.0.1 で導入された実験的機能で，
``-fexternal-interpreter`` フラグで有効になります．
現時点ではWindowsでは利用できません．]

..
   GHCi can use the profiling system to collect stack trace information
   when running interpreted code.  To gain access to stack traces, start
   GHCi like this:

   .. code-block:: none

       ghci -fexternal-interpreter -prof

GHCi では解釈実行コードを走らせるときに，プロファイリングシステムを使って，
スタックトレース情報を収集できます．
スタックトレースにアクセスするには，GHCiを次のように起動します．

.. code-block:: none

    ghci -fexternal-interpreter -prof

..
   This runs the interpreted code in a separate process (see
   :ref:`external-interpreter`) and runs it in profiling mode to collect
   call stack information.  Note that because we're running the
   interpreted code in profiling mode, all packages that you use must be
   compiled for profiling.  The ``-prof`` flag to GHCi only works in
   conjunction with ``-fexternal-interpreter``.

こうすると，解釈実行コードは別プロセスで(:ref:`external-interpreter` 参照)，
プロファイリングモードで走らせてコールスタック情報を収集します．
解釈実行コードをプロファイリングモードで走らせることになりますので，
使用するすべてのパッケージはプロファイリング用にコンパイルされている必要があります．
GHCi に対する ``-prof`` フラグは ``-fexternal-interpreter`` と同時に使うときだけ有効です．

..
   There are three ways to get access to the current call stack.

   - ``error`` and ``undefined`` automatically attach the current stack
     to the error message.  This often complements the ``HasCallStack``
     stack (see :ref:`hascallstack`), so both call stacks are
     shown.

   - ``Debug.Trace.traceStack`` is a version of ``Debug.Trace.trace``
     that also prints the current call stack.

   - Functions in the module ``GHC.Stack`` can be used to get the current
     stack and render it.

現在のコールスタックにアクセスする方法は3つあります．

- ``error`` と ``undefined`` は自動的にエラーメッセージにカレントスタックをアタッチします．
  これは通常 ``HasCallStack`` スタック(:ref:`hascallstack` 参照)を補足するもので，
  その時には両方のスタックが表示されます．

- ``Debug.Trace.traceStack`` は ``Debug.Trace.trace`` の変形版で現在のコールスタックも表示します．

- ``GHC.Stack`` にある関数を使って現在のスタックを取得し，表示できます．

..
   You don't need to use ``-fprof-auto`` for interpreted modules,
   annotations are automatically added at a granularity fine enough to
   distinguish individual call sites.  However, you won't see any call
   stack information for compiled code unless it was compiled with
   ``-fprof-auto`` or has explicit ``SCC`` annotations (see
   :ref:`scc-pragma`).

解釈実行するモジュールについては ``-fprof-auto`` を使う必要はありません．
注釈は自動的に細かく追加されますので，個別のコールサイトを区別できます．
しかしながら，コンパイル済みコードのコールスタック情報は，そのコードを
``-fprof-auto`` 付きでコンパイルしているか，明示的に ``SCC`` 注釈
(:ref:`scc-pragma` 参照)を付けていないかぎり見ることはできません．

..
   .. _ghci-debugger:

   The GHCi Debugger
   -----------------

   .. index::
      single: debugger; in GHCi

.. _ghci-debugger:

GHCiのデバッガ
--------------

.. index::
   single: デバッガ; GHCiの〜

..
   GHCi contains a simple imperative-style debugger in which you can stop a
   running computation in order to examine the values of variables. The
   debugger is integrated into GHCi, and is turned on by default: no flags
   are required to enable the debugging facilities. There is one major
   restriction: breakpoints and single-stepping are only available in
   interpreted modules; compiled code is invisible to the debugger [5]_.

GHCi は単純な命令スタイルのデバッガを備えています．
これを使うと，変数の値を確認するために進行中の計算を止められます．
このデバッガはGHCiに統合されていて，デフォルトで有効になっています．
デバッグ機能を有効にするのにフラグは必要ありません．
1つ重要な制限があります．
それは，ブレイクポイントとステップ実行は解釈実行されているモジュールでしか使えないということです．
コンパイル済みのコードはデバッガからは見えません [5]_ ．

..
   The debugger provides the following:

   -  The ability to set a breakpoint on a function definition or
      expression in the program. When the function is called, or the
      expression evaluated, GHCi suspends execution and returns to the
      prompt, where you can inspect the values of local variables before
      continuing with the execution.

   -  Execution can be single-stepped: the evaluator will suspend execution
      approximately after every reduction, allowing local variables to be
      inspected. This is equivalent to setting a breakpoint at every point
      in the program.

   -  Execution can take place in tracing mode, in which the evaluator
      remembers each evaluation step as it happens, but doesn't suspend
      execution until an actual breakpoint is reached. When this happens,
      the history of evaluation steps can be inspected.

   -  Exceptions (e.g. pattern matching failure and ``error``) can be
      treated as breakpoints, to help locate the source of an exception in
      the program.

このデバッガが提供する機能は以下のとおりです．

-  プログラム中の関数定義や式にブレイクポイントを設定する機能．
   関数が呼ばれたとき，式が評価されたとき，GHCiは実行を中断しプロンプトに戻ります．
   このプロンプトで局所変数の値を調べたあと，実行を再開継続できます．

-  ステップ実行機能．
   評価器はほぼ簡約ごとに実行を中断し，局所変数の値を調べられるようにします．
   これはプログラムのあらゆるポイントにブレイクポイントを設定するのと同じことです．

-  トレースモードでの実行機能． 
   トレースモードで実行すると，評価器は発生した評価ステップをすべて記憶します．
   ただし，実際のブレイクポイントに到達するまでは，実行を中断することはありません．
   実行が中断されたら，評価ステップの履歴を調べることができるようになります．

-  例外(たとえば，パターン照合の失敗あるいは ``error`` など)をブレイクポイントとして扱えます．
   これにより，プログラム中の例外発生源を特定しやすくなります．

..
   There is currently no support for obtaining a “stack trace”, but the
   tracing and history features provide a useful second-best, which will
   often be enough to establish the context of an error. For instance, it
   is possible to break automatically when an exception is thrown, even if
   it is thrown from within compiled code (see
   :ref:`ghci-debugger-exceptions`).

現時点では「スタックトレース」を得る手段は提供されていませんが，
トレース機能と履歴機能が次善の策として提供されており，
エラー発生時の状況を知るには十分であることも多いのです．
たとえコンパイル済みのコードから例外が投げられたときでも，自動的にブレイクするようにできます
(:ref:`ghci-debugger-exceptions` 参照)．

..
   .. _breakpoints:

   Breakpoints and inspecting variables
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _breakpoints:

ブレイクポイントと変数内容の表示
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   Let's use quicksort as a running example. Here's the code: ::

       qsort [] = []
       qsort (a:as) = qsort left ++ [a] ++ qsort right
	 where (left,right) = (filter (<=a) as, filter (>a) as)

       main = print (qsort [8, 4, 0, 3, 1, 23, 11, 18])

実際に動く例としてクイックソートを使いましょう．以下がそのコードです． ::

    qsort [] = []
    qsort (a:as) = qsort left ++ [a] ++ qsort right
      where (left,right) = (filter (<=a) as, filter (>a) as)

    main = print (qsort [8, 4, 0, 3, 1, 23, 11, 18])

..
   First, load the module into GHCi:

   .. code-block:: none

       Prelude> :l qsort.hs
       [1 of 1] Compiling Main             ( qsort.hs, interpreted )
       Ok, modules loaded: Main.
       *Main>

ます，このモジュールをGHCiにロードしましょう．

.. code-block:: none

    Prelude> :l qsort.hs
    [1 of 1] Compiling Main             ( qsort.hs, interpreted )
    Ok, modules loaded: Main.
    *Main>

..
   Now, let's set a breakpoint on the right-hand-side of the second
   equation of qsort:

   .. code-block:: none

       *Main> :break 2
       Breakpoint 0 activated at qsort.hs:2:16-47
       *Main>

次に，qsort の定義2つめの等式の右辺にブレイクポイントを設定します．

.. code-block:: none

    *Main> :break 2
    Breakpoint 0 activated at qsort.hs:2:16-47
    *Main>

..
   The command ``:break 2`` sets a breakpoint on line 2 of the most
   recently-loaded module, in this case ``qsort.hs``. Specifically, it
   picks the leftmost complete subexpression on that line on which to set
   the breakpoint, which in this case is the expression
   ``(qsort left ++ [a] ++ qsort right)``.

``:break 2`` というコマンドは直近にロードしたモジュールの2行目にブレイクポイントを設定するものです．
この場合は ``qsort.hs`` の2行目です．
詳しくいえば，ブレイクポイントを設定した行にある完全な部分式のうちもっとも左側にあるものが選ばれます．
この場合は ``(qsort left ++ [a] ++ qsort right)`` です．

..
   Now, we run the program:

   .. code-block:: none

       *Main> main
       Stopped at qsort.hs:2:16-47
       _result :: [a]
       a :: a
       left :: [a]
       right :: [a]
       [qsort.hs:2:16-47] *Main>

[--ここから-- GHC Users Manual 原文の記述とghciの実際の挙動が異なるので，実際の挙動に沿って非公式に説明します．]

さて，このプログラムを走らせてみましょう．

.. code-block:: none

    *Main> main
    Stopped in Main.qsort, qsort.hs:2:16-47
    _result :: [Integer] = _
    a :: Integer = 8
    left :: [Integer] = _
    right :: [Integer] = _
    [qsort.hs:2:16-47] *Main> 

[--ここまで-- 実際の挙動に沿った非公式な記述]

..
   Execution has stopped at the breakpoint. The prompt has changed to
   indicate that we are currently stopped at a breakpoint, and the
   location: ``[qsort.hs:2:16-47]``. To further clarify the location, we
   can use the :ghci-cmd:`:list` command:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> :list
       1  qsort [] = []
       2  qsort (a:as) = qsort left ++ [a] ++ qsort right
       3    where (left,right) = (filter (<=a) as, filter (>a) as)

ブレイクポイントのところで実行が中断されました．
プロンプトが変化して，ブレイクポイントで止っていること，
その場所が ``[qsort.hs:2:16-47]`` であることが判ります．
その場所をさらに明確にするには :ghci-cmd:`:list` コマンドを使います．

.. code-block:: none

    [qsort.hs:2:16-47] *Main> :list
    1  qsort [] = []
    2  qsort (a:as) = qsort left ++ [a] ++ qsort right
    3    where (left,right) = (filter (<=a) as, filter (>a) as)

..
   The :ghci-cmd:`:list` command lists the source code around the current
   breakpoint. If your output device supports it, then GHCi will highlight
   the active subexpression in bold.

:ghci-cmd:`:list` コマンドは，現在のブレイクポイントの周囲のコードを表示します．
出力デバイスがサポートしている場合は，注目している部分式がボールド体で表示されます．

..
   GHCi has provided bindings for the free variables [6]_ of the expression
   on which the breakpoint was placed (``a``, ``left``, ``right``), and
   additionally a binding for the result of the expression (``_result``).
   These variables are just like other variables that you might define in
   GHCi; you can use them in expressions that you type at the prompt, you
   can ask for their types with :ghci-cmd:`:type`, and so on. There is one
   important difference though: these variables may only have partial
   types. For example, if we try to display the value of ``left``:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> left

       <interactive>:1:0:
	   Ambiguous type variable `a' in the constraint:
	     `Show a' arising from a use of `print' at <interactive>:1:0-3
	   Cannot resolve unknown runtime types: a
	   Use :print or :force to determine these types

GHCiは，ブレイクポイントを置いた式の自由変数 [6]_ (``a`` ， ``left`` ， ``right``)
に対する束縛および当該式の結果(``_result``)に対する束縛も提供しています．
これらの変数は，GHCi上で普通に定義する他の変数と同じです．
プロンプトで入力する式の中で使ったり， :ghci-cmd:`:type` コマンドで型を確認するなどが可能です．

[--ここから-- GHC Users Manual 原文の記述とghciの実際の挙動が異なるので，実際の挙動に沿って非公式に説明します．]

例を見ましょう．

.. code-block:: none

    [qsort.hs:2:16-47] *Main> :type left
    left :: [Integer]		

..
   This is because ``qsort`` is a polymorphic function, and because GHCi
   does not carry type information at runtime, it cannot determine the
   runtime types of free variables that involve type variables. Hence, when
   you ask to display ``left`` at the prompt, GHCi can't figure out which
   instance of ``Show`` to use, so it emits the type error above.


..
   Fortunately, the debugger includes a generic printing command,
   :ghci-cmd:`:print`, which can inspect the actual runtime value of a variable and
   attempt to reconstruct its type. If we try it on ``left``:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> :set -fprint-evld-with-show
       [qsort.hs:2:16-47] *Main> :print left
       left = (_t1::[a])

[--ここまで-- 実際の挙動に沿って非公式説明]

デバッガにはジェネリックな表示コマンド
:ghci-cmd:`:print` があり，これを使えば，変数の実行時の値と型を調べられます．
``left`` に対して使ってみましょう．

.. code-block:: none

    [qsort.hs:2:16-47] *Main> :print left
    left = (_t1::[Integer])

..
   This isn't particularly enlightening. What happened is that ``left`` is
   bound to an unevaluated computation (a suspension, or thunk), and
   :ghci-cmd:`:print` does not force any evaluation. The idea is that
   :ghci-cmd:`:print` can be used to inspect values at a breakpoint without any
   unfortunate side effects. It won't force any evaluation, which could cause the
   program to give a different answer than it would normally, and hence it won't
   cause any exceptions to be raised, infinite loops, or further breakpoints to be
   triggered (see :ref:`nested-breakpoints`). Rather than forcing thunks,
   :ghci-cmd:`:print` binds each thunk to a fresh variable beginning with an
   underscore, in this case ``_t1``.

あまり細かいことは判りません．
``left`` は未評価の計算(サスペンションあるいはサンク)に束縛されています．
これは ``left`` は未評価ですが :ghci-cmd:`:print` が評価を強制しないからです．

:ghci-cmd:`:print` はブレイクポイントで値を検査する際に副作用を起こさないようにしてあるのです．
評価を強制しないので，通常の評価と違う結果になったり，例外が投げられたり，無限ループや別のブレイクポイントに遭遇することもありません
(:ref:`nested-breakpoints` 参照)．
:ghci-cmd:`:print` は各サンクにアンダースコアで始まるフレッシュ(まだ使われていない)変数，ここでは ``_t1`` を束縛します．

..
   The flag :ghc-flag:`-fprint-evld-with-show` instructs :ghci-cmd:`:print` to reuse
   available ``Show`` instances when possible. This happens only when the
   contents of the variable being inspected are completely evaluated.

[--ここでは-- GHC Users Manual 原文の記述とghciの実際の挙動が異なる部分に関連する説明を省いています．]

..
   If we aren't concerned about preserving the evaluatedness of a variable, we can
   use :ghci-cmd:`:force` instead of :ghci-cmd:`:print`. The :ghci-cmd:`:force`
   command behaves exactly like :ghci-cmd:`:print`, except that it forces the
   evaluation of any thunks it encounters:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> :force left
       left = [4,0,3,1]

変数の評価状態を変えてしまってかまわないのなら :ghci-cmd:`:print` ではなく :ghci-cmd:`:force` を使うこともできます．
:ghci-cmd:`:force` コマンドはサンクのときは評価を強制する以外は :ghci-cmd:`:print` と同じ振る舞いになります．

.. code-block:: none

    [qsort.hs:2:16-47] *Main> :force left
    left = [4,0,3,1]

..
   Now, since :ghci-cmd:`:force` has inspected the runtime value of ``left``, it
   has reconstructed its type. We can see the results of this type
   reconstruction:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> :show bindings
       _result :: [Integer]
       a :: Integer
       left :: [Integer]
       right :: [Integer]
       _t1 :: [Integer]

[--ここから-- GHC Users Manual 原文の記述とghciの実際の挙動が異なるので，実際の挙動に沿って非公式に説明します．]

ここで :ghci-cmd:`:show bindings` を使うと，関連する束縛を表示できます．

.. code-block:: none

    [qsort.hs:2:16-47] *Main> :show bindings
    right :: [Integer] = _
    left :: [Integer] = [4,0,3,1]
    a :: Integer = 8
    _result :: [Integer] = _
    _t1 :: [Integer] = [4,0,3,1]

..
   Not only do we now know the type of ``left``, but all the other partial
   types have also been resolved. So we can ask for the value of ``a``, for
   example:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> a
       8

..
   You might find it useful to use Haskell's ``seq`` function to evaluate
   individual thunks rather than evaluating the whole expression with
   :ghci-cmd:`:force`. For example:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> :print right
       right = (_t1::[Integer])
       [qsort.hs:2:16-47] *Main> seq _t1 ()
       ()
       [qsort.hs:2:16-47] *Main> :print right
       right = 23 : (_t2::[Integer])

式全体を:forceで評価してしまうのではなく，個々のサンクを評価したい場合には，Haskellの
``seq`` 関数が便利でしょう．以下のように使います．

.. code-block:: none

    [qsort.hs:2:16-47] *Main> :print right
    right = (_t2::[Integer])
    [qsort.hs:2:16-47] *Main> seq _t2 ()
    ()
    [qsort.hs:2:16-47] *Main> :print right
    right = 23 : (_t3::[Integer])

..
   We evaluated only the ``_t1`` thunk, revealing the head of the list, and
   the tail is another thunk now bound to ``_t2``. The ``seq`` function is
   a little inconvenient to use here, so you might want to use :ghci-cmd:`:def` to
   make a nicer interface (left as an exercise for the reader!).

We evaluated only the ``_t1`` thunk, revealing the head of the list, and
ここでは，サンク ``_t2`` だけを評価して，リストの先頭が判明しました．
``seq`` 関数はすこし使いにくいので :ghci-cmd:`:def` を使ってもっとよいインターフェイスを作るといいでしょう
(どうするかは練習問題にしておきます！)．

..
   Finally, we can continue the current execution:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> :continue
       Stopped at qsort.hs:2:16-47
       _result :: [a]
       a :: a
       left :: [a]
       right :: [a]
       [qsort.hs:2:16-47] *Main>

   The execution continued at the point it previously stopped, and has now
   stopped at the breakpoint for a second time.

そして，実行を再開することもできます．

.. code-block:: none

    [qsort.hs:2:16-47] *Main> :continue
    Stopped in Main.qsort, qsort.hs:2:16-47
    _result :: [Integer] = _
    a :: Integer = 4
    left :: [Integer] = _
    right :: [Integer] = _
    [qsort.hs:2:16-47] *Main> 

実行が前に停止した点から再開し，同じブレイクで再び停止しました．

[--ここまで-- 実際の挙動に沿った非公式説明．]

..
   .. _setting-breakpoints:

   Setting breakpoints
   ^^^^^^^^^^^^^^^^^^^

.. _setting-breakpoints:

ブレイクポイントの設定
^^^^^^^^^^^^^^^^^^^^^^

..
   Breakpoints can be set in various ways. Perhaps the easiest way to set a
   breakpoint is to name a top-level function:

   .. code-block:: none

	  :break identifier

   Where ⟨identifier⟩ names any top-level function in an interpreted module
   currently loaded into GHCi (qualified names may be used). The breakpoint
   will be set on the body of the function, when it is fully applied but
   before any pattern matching has taken place.

ブレークポイントを設定する方法はいくつかあります．
おそらくもっとも簡単な方法は最上位の関数の名前を使うことです．

.. code-block:: none

       :break identifier

ここで ⟨identifier⟩ はGHCiにロードされて解釈実行されるモジュールのトップレベルにある関数の名前です
(これには修飾名も使えます)．
ブレイクポイントは関数の本体部分に設定されます．
関数が完全に適用されパターン照合が行われる直前に設定されます．

..
   Breakpoints can also be set by line (and optionally column) number:

   .. code-block:: none

	  :break line
	  :break line column
	  :break module line
	  :break module line column

   When a breakpoint is set on a particular line, GHCi sets the breakpoint
   on the leftmost subexpression that begins and ends on that line. If two
   complete subexpressions start at the same column, the longest one is
   picked. If there is no complete subexpression on the line, then the
   leftmost expression starting on the line is picked, and failing that the
   rightmost expression that partially or completely covers the line.

行番号(および列番号)でブレイクポイントを設定することもできます．
   
.. code-block:: none

       :break line
       :break line column
       :break module line
       :break module line column

ブレークポイントを特定の行に設定する場合，GHCiはその行で始まりその行で終わる部分式の中で
もっとも左側にあるものに設定します．
2つの完全な部分式が同じカラムから始まっているなら長い方が選ばれます．
その行に完全な部分式が無い場合，その行で始まっている部分式の中でもっとも左側にあるものが選ばれます．
それも失敗したら，その行を一部あるいは全部覆う式の中でもっとも右側にあるものが選ばれます．

..
   When a breakpoint is set on a particular line and column, GHCi picks the
   smallest subexpression that encloses that location on which to set the
   breakpoint. Note: GHC considers the TAB character to have a width of 1,
   wherever it occurs; in other words it counts characters, rather than
   columns. This matches what some editors do, and doesn't match others.
   The best advice is to avoid tab characters in your source code
   altogether (see :ghc-flag:`-Wtabs` in :ref:`options-sanity`).

ブレークポイントを特定の行の特定のカラムに設定する場合，GHCiはその位置を含む式の中で最小のものを選びます．
注意: GHCはTAB文字を現れた位置に関わらず幅1とみなします．
言い換えれば，カラム数を数えるのではなく文字を数えます．
振る舞いと合うエディタもあり，合わないエディタもあります．
最善はそもそもソースコード中でタブ文字を使わないことです
(:ref:`options-sanity` にある :ghc-flag:`-Wtabs` を参照してください)．

..
   If the module is omitted, then the most recently-loaded module is used.

モジュールが省略された場合，直近にロードされたモジュールが使われます．

..
   Not all subexpressions are potential breakpoint locations. Single
   variables are typically not considered to be breakpoint locations
   (unless the variable is the right-hand-side of a function definition,
   lambda, or case alternative). The rule of thumb is that all redexes are
   breakpoint locations, together with the bodies of functions, lambdas,
   case alternatives and binding statements. There is normally no
   breakpoint on a let expression, but there will always be a breakpoint on
   its body, because we are usually interested in inspecting the values of
   the variables bound by the let.

ブレークポイントを設定できない部分式もあります．
単一の変数は通常ブレークポイント位置とはみなされません(ただし，その変数が関数定義かλかcaseの選択肢の右辺である場合は除きます)．
大まかにいうと，ブレークポイントになるのは，全ての簡約基，関数やλ抽象の本体，caseの選択肢，束縛文です．
通常let式はブレークポイントになりませんが，その本体は常にブレークポイントになります．
そのletで束縛された変数の値を調べたいと思うのが普通だからです．

..
   Listing and deleting breakpoints
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ブレイクポイントの一覧と削除
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..
   The list of breakpoints currently enabled can be displayed using
   :ghci-cmd:`:show breaks`:

   .. code-block:: none

       *Main> :show breaks
       [0] Main qsort.hs:1:11-12
       [1] Main qsort.hs:2:16-47

現在有効になっているブレイクポイントを一覧するには
:ghci-cmd:`:show breaks` を使います．

.. code-block:: none

    *Main> :show breaks
    [0] Main qsort.hs:1:12-13
    [1] Main qsort.hs:2:16-47

..
   To delete a breakpoint, use the :ghci-cmd:`:delete` command with the number
   given in the output from :ghci-cmd:`:show breaks`:

   .. code-block:: none

       *Main> :delete 0
       *Main> :show breaks
       [1] Main qsort.hs:2:16-47

   To delete all breakpoints at once, use ``:delete *``.

To delete a breakpoint, use the command with the number
ブレイクポイントを削除するには :ghci-cmd:`:delete` コマンドを使い :ghci-cmd:`:show breaks` で出力されるブレイクポイント番号を指定します．

.. code-block:: none

    *Main> :delete 0
    *Main> :show breaks
    [1] Main qsort.hs:2:16-47

全てのブレイクポイントを一度に削除するには ``:delete *`` とします．

..
   .. _single-stepping:

   Single-stepping
   ~~~~~~~~~~~~~~~

.. _single-stepping:

ステップ実行
~~~~~~~~~~~~

..
   Single-stepping is a great way to visualise the execution of your
   program, and it is also a useful tool for identifying the source of a
   bug. GHCi offers two variants of stepping. Use :ghci-cmd:`:step` to enable all
   the breakpoints in the program, and execute until the next breakpoint is
   reached. Use :ghci-cmd:`:steplocal` to limit the set of enabled breakpoints to
   those in the current top level function. Similarly, use :ghci-cmd:`:stepmodule`
   to single step only on breakpoints contained in the current module. For
   example:

   .. code-block:: none

       *Main> :step main
       Stopped at qsort.hs:5:7-47
       _result :: IO ()

ステップ実行は，プログラムの実行を可視化する素晴しい方法であり，バグの原因を同定する手段としても有用である．
:ghci-cmd:`:step` コマンドを使うと，プログラム中の全てのブレークポイントが有効にされ、次のブレークポイントに達するまで実行される．
:ghci-cmd:`:steplocal` とすれば，現在のトップレベル関数の中にあるブレークポイントのみ有効になります．
同様に :ghci-cmd:`:stepmodule` とすると現在のモジュール中にあるブレークポイントのみ有効にします．
たとえば以下のようになる．

.. code-block:: none

    *Main> :step main
    Stopped in Main.main, qsort.hs:5:8-48
    _result :: IO () = _

..
   The command :ghci-cmd:`:step expr <:step>` begins the evaluation of ⟨expr⟩ in
   single-stepping mode. If ⟨expr⟩ is omitted, then it single-steps from
   the current breakpoint. :ghci-cmd:`:steplocal` and :ghci-cmd:`:stepmodule`
   commands work similarly.

:ghci-cmd:`:step expr <:step>` コマンドは⟨expr⟩のステップ実行を開始します．
⟨expr⟩ が省略されたときは，現在のブレイクポイントからステップ実行します．
:ghci-cmd:`:steplocal` および :ghci-cmd:`:stepmodule` も同様に動作します．

..
   The :ghci-cmd:`:list` command is particularly useful when single-stepping, to
   see where you currently are:

   .. code-block:: none

       [qsort.hs:5:7-47] *Main> :list
       4
       5  main = print (qsort [8, 4, 0, 3, 1, 23, 11, 18])
       6
       [qsort.hs:5:7-47] *Main>

ステップ実行中は :ghci-cmd:`:list` コマンドが特に便利で，いまどこを実行しているかが判ります．

.. code-block:: none

    [qsort.hs:5:8-48] *Main> :list
    4  
    5  main = print (qsort [8, 4, 0, 3, 1, 23, 11, 18])
    6  
    [qsort.hs:5:8-48] *Main> 

..
   In fact, GHCi provides a way to run a command when a breakpoint is hit,
   so we can make it automatically do :ghci-cmd:`:list`:

   .. code-block:: none

       [qsort.hs:5:7-47] *Main> :set stop :list
       [qsort.hs:5:7-47] *Main> :step
       Stopped at qsort.hs:5:14-46
       _result :: [Integer]
       4
       5  main = print (qsort [8, 4, 0, 3, 1, 23, 11, 18])
       6
       [qsort.hs:5:14-46] *Main>

実は，GHCiにはブレイクポイントにきたときにコマンドを実行するという機能があり，
自動的に :ghci-cmd:`:list` するようにできます．

.. code-block:: none

    [qsort.hs:5:8-48] *Main> :set stop :list
    [qsort.hs:5:8-48] *Main> :step
    Stopped in Main.main, qsort.hs:5:15-47
    _result :: [Integer] = _
    4  
    5  main = print (qsort [8, 4, 0, 3, 1, 23, 11, 18])
    6  
    [qsort.hs:5:15-47] *Main> 

..
   .. _nested-breakpoints:

   Nested breakpoints
   ~~~~~~~~~~~~~~~~~~

.. _nested-breakpoints:

ブレイクポイントのネスト
~~~~~~~~~~~~~~~~~~~~~~~~

..
   When GHCi is stopped at a breakpoint, and an expression entered at the
   prompt triggers a second breakpoint, the new breakpoint becomes the
   "current" one, and the old one is saved on a stack. An arbitrary number
   of breakpoint contexts can be built up in this way. For example:

   .. code-block:: none

       [qsort.hs:2:16-47] *Main> :st qsort [1,3]
       Stopped at qsort.hs:(1,0)-(3,55)
       _result :: [a]
       ... [qsort.hs:(1,0)-(3,55)] *Main>

GHCi がブレイクポイントで停止したとき，プロンプトに式を入力すると，次のブレイクポイントまで進みます．
この新しいブレイクポイントが現在のブレイクポイントとなり，古いブレイクポイントはスタックに保存されます．
任意の数のブレイクポイント文脈はこうして作られます．
以下はその例です．

.. code-block:: none

    [qsort.hs:2:16-47] *Main> :step qsort [1,3]
    Stopped in Main.qsort, qsort.hs:2:16-47
    _result :: [t] = _
    a :: t = _
    left :: [t] = _
    right :: [t] = _
    ... [qsort.hs:2:16-47] *Main> 

..
   While stopped at the breakpoint on line 2 that we set earlier, we
   started a new evaluation with ``:step qsort [1,3]``. This new evaluation
   stopped after one step (at the definition of ``qsort``). The prompt has
   changed, now prefixed with ``...``, to indicate that there are saved
   breakpoints beyond the current one. To see the stack of contexts, use
   :ghci-cmd:`:show context`:

   .. code-block:: none

       ... [qsort.hs:(1,0)-(3,55)] *Main> :show context
       --> main
	 Stopped at qsort.hs:2:16-47
       --> qsort [1,3]
	 Stopped at qsort.hs:(1,0)-(3,55)
       ... [qsort.hs:(1,0)-(3,55)] *Main>

前に設定した2行目のブレークポイントで停止したところで ``:step qsort [1,3]`` として新しい評価を開始したしました．
この新しい評価は1ステップの後に(``qsort`` の定義で)停止しました．
ここで，プロンプトが変わって先頭に ``...`` が付きます．
これが現在のブレークポイントの他に保存されたブレークポイントがあることを示しています．
この文脈スタックを見るには :ghci-cmd:`:show context` を使えばいいでしょう．

.. code-block:: none

    ... [qsort.hs:2:16-47] *Main> :show context
    --> main
    Stopped in Main.qsort, qsort.hs:2:16-47
    --> qsort [1,3]
    Stopped in Main.qsort, qsort.hs:2:16-47
    ... [qsort.hs:2:16-47] *Main> 

..
   To abandon the current evaluation, use :ghci-cmd:`:abandon`:

   .. code-block:: none

       ... [qsort.hs:(1,0)-(3,55)] *Main> :abandon
       [qsort.hs:2:16-47] *Main> :abandon
       *Main>

   .. _ghci-debugger-result:

現在の評価の結果を捨てるには :ghci-cmd:`:abandon`: を使います．

.. code-block:: none

    ... [qsort.hs:2:16-47] *Main> :abandon
    [qsort.hs:2:16-47] *Main> :abandon
    *Main> 

..
   .. _ghci-debugger-result:

   The ``_result`` variable
   ~~~~~~~~~~~~~~~~~~~~~~~~

.. _ghci-debugger-result:

``_result`` 変数
~~~~~~~~~~~~~~~~

..
   When stopped at a breakpoint or single-step, GHCi binds the variable
   ``_result`` to the value of the currently active expression. The value
   of ``_result`` is presumably not available yet, because we stopped its
   evaluation, but it can be forced: if the type is known and showable,
   then just entering ``_result`` at the prompt will show it. However,
   there's one caveat to doing this: evaluating ``_result`` will be likely
   to trigger further breakpoints, starting with the breakpoint we are
   currently stopped at (if we stopped at a real breakpoint, rather than
   due to :ghci-cmd:`:step`). So it will probably be necessary to issue a
   :ghci-cmd:`:continue` immediately when evaluating ``_result``. Alternatively,
   you can use :ghci-cmd:`:force` which ignores breakpoints.

ブレークポイントで停止したときやステップ実行するとき，GHCiは ``_result`` という変数を用意して，
現在注目されている式の結果に束縛します．
``_result`` の値はおそらくまだ存在しない(その評価を止めたので)が，
その評価を強制することはできます．
その型が既知で表示できるなら ``_result`` とプロンプトに入力するだけで表示できます．
ただし，警告が一つあります．
``_result`` を評価すると，別のブレークポイントにあたる可能性が高いということです．
特に :ghci-cmd:`:step` ではなく真のブレークポイントで停止していたら，このブレークポイントに最初にあたります．
このため ``_result`` を評価する時には，即座に :ghci-cmd:`:continue` を発行しなければならなく可能性が高くなります．
別の方法としては :ghci-cmd:`:force` はブレークポイントを無視するので，これを使うこともできます．

..
   .. _tracing:

   Tracing and history
   ~~~~~~~~~~~~~~~~~~~

.. _tracing:

トレースとヒストリ
~~~~~~~~~~~~~~~~~~

..
   A question that we often want to ask when debugging a program is “how
   did I get here?”. Traditional imperative debuggers usually provide some
   kind of stack-tracing feature that lets you see the stack of active
   function calls (sometimes called the “lexical call stack”), describing a
   path through the code to the current location. Unfortunately this is
   hard to provide in Haskell, because execution proceeds on a
   demand-driven basis, rather than a depth-first basis as in strict
   languages. The “stack“ in GHC's execution engine bears little
   resemblance to the lexical call stack. Ideally GHCi would maintain a
   separate lexical call stack in addition to the dynamic call stack, and
   in fact this is exactly what our profiling system does
   (:ref:`profiling`), and what some other Haskell debuggers do. For the
   time being, however, GHCi doesn't maintain a lexical call stack (there
   are some technical challenges to be overcome). Instead, we provide a way
   to backtrack from a breakpoint to previous evaluation steps: essentially
   this is like single-stepping backwards, and should in many cases provide
   enough information to answer the "how did I get here?" question.

プログラムをデバッグしている時によく「どうやってここに来たの？」と思うことがあります．
伝統的な命令的デバッガは通常なにがしかのスタックトレース機能を持っていて，
それを使ってアクティブな関数呼び出しのスタック(「レキシカルコールスタック」と呼ばれることも)を
確認できます．
このスタックによって，現在の位置に至るまでのコード上の道のりが判ります．
残念ながら，これをHaskellで用意するのは難しいのです．
正格な言語と違って，実行は深さ優先ではなく必要に応じて進むからです．
GHCの実行エンジンにある「スタック」は字句的呼び出しスタックとは大きく異なります．
理想的には，GHCがこの動的な呼び出しスタックに加えて，字句的呼び出しスタックを管理すれば良く，
実はプロファイルシステムはまさにこれを行っています(:ref:`profiling`)．
他のHaskellデバッガにもこれをしているものがある．
しかし，現在のところGHCiは字句的呼び出しスタックを管理していません
(克服せねばならない技術的困難がいくつかあります)．
代わりにブレークポイントから直前の評価ステップに戻る方法を用意しています．
これは要するにステップ実行を逆向きにするのと同じです．
多くの場合「どうやってここに来たの？」という疑問を解決するのに十分な情報がえられます．

..
   To use tracing, evaluate an expression with the :ghci-cmd:`:trace` command. For
   example, if we set a breakpoint on the base case of ``qsort``:

   .. code-block:: none

       *Main> :list qsort
       1  qsort [] = []
       2  qsort (a:as) = qsort left ++ [a] ++ qsort right
       3    where (left,right) = (filter (<=a) as, filter (>a) as)
       4
       *Main> :b 1
       Breakpoint 1 activated at qsort.hs:1:11-12
       *Main>

   and then run a small ``qsort`` with tracing:

   .. code-block:: none

       *Main> :trace qsort [3,2,1]
       Stopped at qsort.hs:1:11-12
       _result :: [a]
       [qsort.hs:1:11-12] *Main>

トレース機能を使うには，式を :ghci-cmd:`:trace` コマンドで評価します．
たとえば ``qsort`` のベースケースにブレイクポイントを設定します．

.. code-block:: none

    *Main> :list qsort
    1  qsort [] = []
    2  qsort (a:as) = qsort left ++ [a] ++ qsort right
    *Main> :break 1
    Breakpoint 0 activated at qsort.hs:1:12-13
    *Main> 

こうしておいて，小さいデータに ``qsort`` をトレース付きで実行します．

.. code-block:: none

    *Main> :trace qsort [3,2,1]
    Stopped in Main.qsort, qsort.hs:1:12-13
    _result :: [a] = _
    [qsort.hs:1:12-13] *Main> 

..
   We can now inspect the history of evaluation steps:

   .. code-block:: none

       [qsort.hs:1:11-12] *Main> :hist
       -1  : qsort.hs:3:24-38
       -2  : qsort.hs:3:23-55
       -3  : qsort.hs:(1,0)-(3,55)
       -4  : qsort.hs:2:15-24
       -5  : qsort.hs:2:16-47
       -6  : qsort.hs:3:24-38
       -7  : qsort.hs:3:23-55
       -8  : qsort.hs:(1,0)-(3,55)
       -9  : qsort.hs:2:15-24
       -10 : qsort.hs:2:16-47
       -11 : qsort.hs:3:24-38
       -12 : qsort.hs:3:23-55
       -13 : qsort.hs:(1,0)-(3,55)
       -14 : qsort.hs:2:15-24
       -15 : qsort.hs:2:16-47
       -16 : qsort.hs:(1,0)-(3,55)
       <end of history>

これで評価ステップのヒストリを確認できます．

.. code-block:: none

    [qsort.hs:1:12-13] *Main> :history
    -1  : qsort:(...) (qsort.hs:3:25-39)
    -2  : qsort:(...) (qsort.hs:3:24-56)
    -3  : qsort (qsort.hs:2:16-25)
    -4  : qsort (qsort.hs:2:16-47)
    -5  : qsort:(...) (qsort.hs:3:25-39)
    -6  : qsort:(...) (qsort.hs:3:24-56)
    -7  : qsort (qsort.hs:2:16-25)
    -8  : qsort (qsort.hs:2:16-47)
    -9  : qsort:(...) (qsort.hs:3:25-39)
    -10 : qsort:(...) (qsort.hs:3:24-56)
    -11 : qsort (qsort.hs:2:16-25)
    -12 : qsort (qsort.hs:2:16-47)
    <end of history>

..
   To examine one of the steps in the history, use :ghci-cmd:`:back`:

   .. code-block:: none

       [qsort.hs:1:11-12] *Main> :back
       Logged breakpoint at qsort.hs:3:24-38
       _result :: [a]
       as :: [a]
       a :: a
       [-1: qsort.hs:3:24-38] *Main>

ヒストリ中の特定のステップを調べるには :ghci-cmd:`:back` を使います．

.. code-block:: none

    [qsort.hs:1:12-13] *Main> :back
    Logged breakpoint at qsort.hs:3:25-39
    _result :: [Integer]
    a :: Integer
    as :: [Integer]
    [-1: qsort.hs:3:25-39] *Main> 

..
   Note that the local variables at each step in the history have been
   preserved, and can be examined as usual. Also note that the prompt has
   changed to indicate that we're currently examining the first step in the
   history: ``-1``. The command :ghci-cmd:`:forward` can be used to traverse
   forward in the history.

ヒストリ中の各ステップにおけるローカル変数は保存されており，
通常と同じように値を調べられるということに注目してください．
さらに，プロンプトが変わって ``-1`` のように，ヒストリの最初のステップを調べていることを示しています．
:ghci-cmd:`:forward` コマンドを使えば，ヒストリを前方にたどれます．

..
   The :ghci-cmd:`:trace` command can be used with or without an expression. When
   used without an expression, tracing begins from the current breakpoint,
   just like :ghci-cmd:`:step`.

:ghci-cmd:`:trace` コマンドには式を与えても与えなくてもかまいません．
式を与えなかった場合は :ghci-cmd:`:step` と同様，現在のブレイクポイントからトレースが始まります．

..
   The history is only available when using :ghci-cmd:`:trace`; the reason for this
   is we found that logging each breakpoint in the history cuts performance
   by a factor of 2 or more.

ヒストリは :ghci-cmd:`:trace` を使ったときにしか記録されません．
そのようになっているのは，全てのブレイクポイントをヒストリに記録することで性能が2倍以上に悪化することが判っているからである．

..
   .. ghc-flag:: -fghci-hist-size

       :default: 50

       Modify the depth of the evaluation history tracked by GHCi.

.. ghc-flag:: -fghci-hist-size

    :default: 50

    GHCi で追跡する評価ヒストリの深さを変更する

..
   .. _ghci-debugger-exceptions:

   Debugging exceptions
   ~~~~~~~~~~~~~~~~~~~~

.. _ghci-debugger-exceptions:

例外のデバッグ
~~~~~~~~~~~~~~

..
   Another common question that comes up when debugging is "where did this
   exception come from?". Exceptions such as those raised by ``error`` or
   ``head []`` have no context information attached to them. Finding which
   particular call to ``head`` in your program resulted in the error can be
   a painstaking process, usually involving ``Debug.Trace.trace``, or
   compiling with profiling and using ``Debug.Trace.traceStack`` or
   ``+RTS -xc`` (see :rts-flag:`-xc`).

デバッグの際にもうひとつ思うことは「この例外はどこから来たの？」ということです．
``error`` や ``head []`` などが引き起こすような例外には文脈情報がついていません．
プログラム中のどの ``head`` 呼び出しがエラーになったかを探すのは骨の折れる仕事です．
たいていの場合 ``Debug.Trace.trace`` を仕込むか，プロファイル指定でコンパイルして
``Debug.Trace.traceStack`` を使うか ``+RTS -xc`` (:rts-flag:`-xc` 参照)を使うかです．

..
   The GHCi debugger offers a way to hopefully shed some light on these
   errors quickly and without modifying or recompiling the source code. One
   way would be to set a breakpoint on the location in the source code that
   throws the exception, and then use :ghci-cmd:`:trace` and :ghci-cmd:`:history` to
   establish the context. However, ``head`` is in a library and we can't
   set a breakpoint on it directly. For this reason, GHCi provides the
   flags :ghc-flag:`-fbreak-on-exception` which causes the evaluator to stop when
   an exception is thrown, and :ghc-flag:`-fbreak-on-error`, which works similarly
   but stops only on uncaught exceptions. When stopping at an exception,
   GHCi will act just as it does when a breakpoint is hit, with the
   deviation that it will not show you any source code location. Due to
   this, these commands are only really useful in conjunction with
   :ghci-cmd:`:trace`, in order to log the steps leading up to the exception. For
   example:

   .. code-block:: none

       *Main> :set -fbreak-on-exception
       *Main> :trace qsort ("abc" ++ undefined)
       “Stopped at <exception thrown>
       _exception :: e
       [<exception thrown>] *Main> :hist
       -1  : qsort.hs:3:24-38
       -2  : qsort.hs:3:23-55
       -3  : qsort.hs:(1,0)-(3,55)
       -4  : qsort.hs:2:15-24
       -5  : qsort.hs:2:16-47
       -6  : qsort.hs:(1,0)-(3,55)
       <end of history>
       [<exception thrown>] *Main> :back
       Logged breakpoint at qsort.hs:3:24-38
       _result :: [a]
       as :: [a]
       a :: a
       [-1: qsort.hs:3:24-38] *Main> :force as
       *** Exception: Prelude.undefined
       [-1: qsort.hs:3:24-38] *Main> :print as
       as = 'b' : 'c' : (_t1::[Char])

   The exception itself is bound to a new variable, ``_exception``.

GHCiデバッガはソースコードを書き換えたり，再コンパイルしたりすることなく，
てばやく，この手のエラーに光を当てる方法を提供しています．
ひとつの方法は，ソースコード中で例外を投げる場所にブレークポイントを設定し :ghci-cmd:`:trace` と :ghci-cmd:`:history` を使って
文脈を把握することです．
しかし ``head`` はライブラリ中にあり，そこに直接ブレークポイントを設定できません．
そういうわけで，GHCiには :ghc-flag:`-fbreak-on-exception` フラグが用意されています．
これを使うと例外が投げられた時に評価器を停止できます．
:ghc-flag:`-fbreak-on-error` も同様ですが，こちらは例外が捕捉されなかった場合のみ停止します．
例外で停止すると，GHCiはちょうどブレークポイントに当ったのと同じように振る舞います．
違うのは，ソースコード中の位置が表示されないということです．
したがって :ghci-cmd:`:trace` と組み合わせて，例外が発生する直前までのステップを記録するようにしないと
あまり役には立ちません．
たとえば，以下のようにします．

.. code-block:: none

    *Main> :set -fbreak-on-exception 
    *Main> :trace qsort ("abc" ++ undefined)
    "Stopped in <exception thrown>, <unknown>
    _exception :: e = _
    [<unknown>] *Main> :hist
    -1  : qsort:(...) (qsort.hs:3:25-39)
    -2  : qsort:(...) (qsort.hs:3:24-56)
    -3  : qsort (qsort.hs:2:16-25)
    -4  : qsort (qsort.hs:2:16-47)
    <end of history>
    [<unknown>] *Main> :back
    Logged breakpoint at qsort.hs:3:25-39
    _result :: [Char]
    a :: Char
    as :: [Char]
    [-1: qsort.hs:3:25-39] *Main> :force as
    *** Exception: Prelude.undefined
    CallStack (from HasCallStack):
    error, called at libraries/base/GHC/Err.hs:79:14 in base:GHC.Err
    undefined, called at <interactive>:2:17 in interactive:Ghci1
    [-1: qsort.hs:3:25-39] *Main> :print as
    as = 'b' : 'c' : (_t1::[Char])

新しい変数 ``_exception`` が例外に束縛されます．

..
   Breaking on exceptions is particularly useful for finding out what your
   program was doing when it was in an infinite loop. Just hit Control-C,
   and examine the history to find out what was going on.

   .. ghc-flag:: -fbreak-on-exception
		 -fbreak-on-error

       Causes GHCi to halt evaluation and return to the interactive prompt
       in the event of an exception. While :ghc-flag:`-fbreak-on-exception` breaks
       on all exceptions, :ghc-flag:`-fbreak-on-error` breaks on only those which
       would otherwise be uncaught.

例外発生時にブレークする機能は，プログラムが無限ループしているとき，それが何をしているかを調べるのに特に便利です．
Ctrl-C を叩いて，履歴を見て，何が起こっていたかを調べればいいのです．

.. ghc-flag:: -fbreak-on-exception
              -fbreak-on-error

    GHCiが，例外のイベントで，評価を停止して対話プロンプトに戻るようにします．
    :ghc-flag:`-fbreak-on-exception` はすべての例外でブレイクするのに対して，
    :ghc-flag:`-fbreak-on-error` は捕捉されない例外でのみブレイクします．

..
   Example: inspecting functions
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

例：関数の調査
~~~~~~~~~~~~~~

..
   It is possible to use the debugger to examine function values. When we
   are at a breakpoint and a function is in scope, the debugger cannot show
   you the source code for it; however, it is possible to get some
   information by applying it to some arguments and observing the result.

このデバッガを使って関数値を調べられます．
ブレークポイントで停止し，スコープに関数があるとき，デバッガでその関数のソースコードを表示させることはできません．
しかし，その関数をいくつかの引数に適用して結果を観察することで，いくらかの情報をえることはできます．

..
   The process is slightly complicated when the binding is polymorphic. We
   show the process by means of an example. To keep things simple, we will
   use the well known ``map`` function:

   ::

       import Prelude hiding (map)

       map :: (a->b) -> [a] -> [b]
       map f [] = []
       map f (x:xs) = f x : map f xs

束縛が多相的な場合には，このプロセスはすこし複雑になります．
例で見ましょう．
簡単に考えるために，よく知られた ``map`` 関数を例にとります．

::

    import Prelude hiding (map)

    map :: (a->b) -> [a] -> [b]
    map f [] = []
    map f (x:xs) = f x : map f xs

..
   We set a breakpoint on ``map``, and call it.

   .. code-block:: none

       *Main> :break 5
       Breakpoint 0 activated at  map.hs:5:15-28
       *Main> map Just [1..5]
       Stopped at map.hs:(4,0)-(5,12)
       _result :: [b]
       x :: a
       f :: a -> b
       xs :: [a]

   GHCi tells us that, among other bindings, ``f`` is in scope. However,
   its type is not fully known yet, and thus it is not possible to apply it
   to any arguments. Nevertheless, observe that the type of its first
   argument is the same as the type of ``x``, and its result type is shared
   with ``_result``.

``map`` にブレイクポイントを設定して，呼び出してみましょう．

.. code-block:: none

    *Main> :break 5
    Breakpoint 0 activated at map.hs:5:16-29
    *Main> map Just [1..5]
    Stopped in Main.map, map.hs:5:16-29
    _result :: [b] = _
    f :: Integer -> b = _
    x :: Integer = 1
    xs :: [Integer] = _
    [map.hs:5:16-29] *Main> 

GHCi の表示を見れば ``f`` がスコープにあることがわかります．
しかし，その型は完全に判明しているわけではありません．
とはいうものの，最初の引数の型を見れば，これが ``x`` の型と同じ ``Integer`` であることも，
``_result`` の型が同じ ``Integer`` を要素とするリストであることも判ります．

..
   As we demonstrated earlier (:ref:`breakpoints`), the debugger has some
   intelligence built-in to update the type of ``f`` whenever the types of
   ``x`` or ``_result`` are discovered. So what we do in this scenario is
   force ``x`` a bit, in order to recover both its type and the argument
   part of ``f``.

   .. code-block:: none

       *Main> seq x ()
       *Main> :print x
       x = 1

[--ここでは-- GHC Users Guide 原文の記述とghciの実際の挙動が異なる部分に関連する説明を省いています．]

..
   We can check now that as expected, the type of ``x`` has been
   reconstructed, and with it the type of ``f`` has been too:

   .. code-block:: none

       *Main> :t x
       x :: Integer
       *Main> :t f
       f :: Integer -> b

..
   From here, we can apply f to any argument of type Integer and observe
   the results.

   .. code-block:: none

       *Main> let b = f 10
       *Main> :t b
       b :: b
       *Main> b
       <interactive>:1:0:
	   Ambiguous type variable `b' in the constraint:
	     `Show b' arising from a use of `print' at <interactive>:1:0
       *Main> :p b
       b = (_t2::a)
       *Main> seq b ()
       ()
       *Main> :t b
       b :: a
       *Main> :p b
       b = Just 10
       *Main> :t b
       b :: Maybe Integer
       *Main> :t f
       f :: Integer -> Maybe Integer
       *Main> f 20
       Just 20
       *Main> map f [1..5]
       [Just 1, Just 2, Just 3, Just 4, Just 5]

   In the first application of ``f``, we had to do some more type
   reconstruction in order to recover the result type of ``f``. But after
   that, we are free to use ``f`` normally.

以降 ``f`` を ``Integer`` 型の任意の引数に適用してその結果を観察できます．
[--ここから-- GHC Users Manual 原文の記述とghciの実際の挙動が異なるので，実際の挙動に沿って非公式に説明します．]

.. code-block:: none

    [map.hs:5:16-29] *Main> :abandon
    *Main> let b = f 10
    *Main> :t b
    b :: b
    *Main> :p b
    b = (_t1::b)
    *Main> seq b ()
    ()
    *Main> :t b
    b :: Maybe Integer
    *Main> :t f
    f :: Integer -> Maybe Integer
    *Main> f 20
    Just 20
    *Main> :delete *
    *Main> map f [1..5]
    [Just 1,Just 2,Just 3,Just 4,Just 5]

..
   In the first application of ``f``, we had to do some more type
   reconstruction in order to recover the result type of ``f``. But after
   that, we are free to use ``f`` normally.

[--ここまで-- 実際の挙動に沿った非公式説明．]

最初の ``f`` の適用では ``f`` の結果の型を復元するために，型の再構築をもう少し行う必要がありました．
しかし，それ以降は ``f`` を通常の方法で自由に使うことができます．

..
   Limitations
   ~~~~~~~~~~~

制限
~~~~

..
   -  When stopped at a breakpoint, if you try to evaluate a variable that
      is already under evaluation, the second evaluation will hang. The
      reason is that GHC knows the variable is under evaluation, so the new
      evaluation just waits for the result before continuing, but of course
      this isn't going to happen because the first evaluation is stopped at
      a breakpoint. Control-C can interrupt the hung evaluation and return
      to the prompt.

      The most common way this can happen is when you're evaluating a CAF
      (e.g. main), stop at a breakpoint, and ask for the value of the CAF
      at the prompt again.

   -  Implicit parameters (see :ref:`implicit-parameters`) are only
      available at the scope of a breakpoint if there is an explicit type
      signature.

-  ブレークポイントで停止したとき，既に評価中の変数を評価しようとすると，2回目の評価はハングする．
   その変数が評価中であることをGHCが知っていて，後の評価は先の結果を待ってからでないと続けられないからです．
   先の評価はブレークポイントで停止しているので，もちろん結果は得られません．
   評価がハングしたときは Ctrl-C で中断すれば，プロンプトに戻ることができます．

   ありがちなのは，CAF(たとえば ``main``)を評価していて，ブレークポイントで停止し，そのCAFの値を再びプロンプトで要求するという場合です．

-  暗黙パラメータ(:ref:`implicit-parameters` 参照)がブレイクポイントで利用できるのは，型が明示されている場合だけです．

..
   .. _ghci-invocation:

   Invoking GHCi
   -------------

   .. index::
      single: invoking; GHCi
      single: --interactive

.. _ghci-invocation:

GHCi の起動
-----------

.. index::
   single: 起動; GHCiの〜
   single: --interactive

..
   GHCi is invoked with the command ``ghci`` or ``ghc --interactive``. One
   or more modules or filenames can also be specified on the command line;
   this instructs GHCi to load the specified modules or filenames (and all
   the modules they depend on), just as if you had said ``:load modules``
   at the GHCi prompt (see :ref:`ghci-commands`). For example, to start
   GHCi and load the program whose topmost module is in the file
   ``Main.hs``, we could say:

   .. code-block:: none

       $ ghci Main.hs

   Most of the command-line options accepted by GHC (see :ref:`using-ghc`)
   also make sense in interactive mode. The ones that don't make sense are
   mostly obvious.

GHCiは ``ghci`` または ``ghc --interactive`` というコマンドで起動します．
1つまたは複数のモジュールやファイル名をコマンド行で指定することもできます．
そうすると，GHCiはプロンプトで ``:load モジュール名`` と入力したとき同じように(:ref:`ghci-commands` 参照)，指定されたモジュールやファイル(と，それらが依存するモジュール)をロードします．
たとえば、GHCiを起動して(Main.hsに最上位モジュールがある)プログラムをロードするには，
次のようにすればよい．

.. code-block:: none

    $ ghci Main.hs

GHCが受け付けるコマンドラインオプション(:ref:`using-ghc` 参照)の大部分は対話モードでも有効です．
GHCiで有効でないものは見れば判ります．

..
   Packages
   ~~~~~~~~

   .. index::
      single: packages; with GHCi

パッケージ
~~~~~~~~~~

.. index::
   single: パッケージ; GHCiで〜を使う

..
   Most packages (see :ref:`using-packages`) are available without needing
   to specify any extra flags at all: they will be automatically loaded the
   first time they are needed.

ほとんどのパッケージ(:ref:`using-packages` 参照)は追加でフラグを指定しなくても利用できます．
最初に必要になったときに自動的ロードされます．

..
   For hidden packages, however, you need to request the package be loaded
   by using the :ghc-flag:`-package` flag:

   .. code-block:: none

       $ ghci -package readline
       GHCi, version 6.8.1: http://www.haskell.org/ghc/  :? for help
       Loading package base ... linking ... done.
       Loading package readline-1.0 ... linking ... done.
       Prelude>

一方で，隠されたパッケージについては :ghc-flag:`-package` フラグを使ってロードを要求する必要があります．

.. code-block:: none

    $ ghci -package ghc-8.0.2
    GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
    Prelude> :show packages
    active package flags:
      -package ghc-8.0.2

..
   The following command works to load new packages into a running GHCi:

   .. code-block:: none

       Prelude> :set -package name

   But note that doing this will cause all currently loaded modules to be
   unloaded, and you'll be dumped back into the ``Prelude``.

以下のコマンドを使えば起動中のGHCiに新しいパッケージをロードできます．

.. code-block:: none

    *Main> :set -package ghc-8.0.2
    package flags have changed, resetting and loading new packages...
    Prelude> 

ただし，すでにロードされているモジュールが全て未ロードになり ``Prelude`` に戻されることになるので注意が必要です．

..
   Extra libraries
   ~~~~~~~~~~~~~~~

   .. index::
      single: libraries; with GHCi

追加のライブラリ
~~~~~~~~~~~~~~~~

.. index::
   single: ライブラリ; GHCiで〜を使う

..
   Extra libraries may be specified on the command line using the normal
   ``-llib`` option. (The term *library* here refers to libraries of
   foreign object code; for using libraries of Haskell source code, see
   :ref:`ghci-modules-filenames`.) For example, to load the “m” library:

   .. code-block:: none

       $ ghci -lm

追加のライブラリは，コマンドラインから通常の ``-llib`` オプションを使って指定できます．
(ここでいうライブラリとは，他言語のオブジェクトコードのライブラリのことです．
Haskellソースのライブラリを使うことについては :ref:`ghci-modules-filenames` を参照してください．)
たとえば，「m」ライブラリをロードするには，次のようにします．

.. code-block:: none

    $ ghci -lm

..
   On systems with ``.so``-style shared libraries, the actual library
   loaded will the ``liblib.so``. GHCi searches the following places for
   libraries, in this order:

   -  Paths specified using the :ghc-flag:`-L` command-line option,

   -  the standard library search path for your system, which on some
      systems may be overridden by setting the :envvar:`LD_LIBRARY_PATH`
      environment variable.

``.so``-形式の共有ライブラリを使うシステムでは，実際にロードされるライブラリは ``liblib.so`` です．
GHCiは以下の順にライブラリを探します．

-  :ghc-flag:`-L` コマンドラインオプションで指定したパス．

-  システムの標準ライブラリ検索パス．これはシステムによっては環境変数 :envvar:`LD_LIBRARY_PATH` を設定することで変更可能です．

..
   On systems with ``.dll``-style shared libraries, the actual library
   loaded will be ``lib.dll``. Again, GHCi will signal an error if it can't
   find the library.

``.dll``-形式の共有ライブラリを使うシステムでは，実際にロードされるライブラリは ``lib.dll`` です．
GHCi指定のライブラリが見つからなければ，ここでもエラーになります．

..
   GHCi can also load plain object files (``.o`` or ``.obj`` depending on
   your platform) from the command-line. Just add the name the object file
   to the command line.

GHCi は単なるオブジェクトファイル(プラットフォームによって ``.o`` か ``.obj`` のどちらか)をコマンドラインで指定してロードできます．オブジェクトファイル名をコマンドラインに追加するだけです．

..
   Ordering of ``-l`` options matters: a library should be mentioned
   *before* the libraries it depends on (see :ref:`options-linker`).

``-l`` オプションの順序は重要です．ライブラリ指定は，そのライブラリが依存しているライブラリよりも *前に* 書いておく必要があります(:ref:`options-linker` 参照)．

..
   .. _ghci-commands:

   GHCi commands
   -------------

.. _ghci-commands:

GHCi のコマンド群
-----------------

..
   GHCi commands all begin with "``:``" and consist of a single command
   name followed by zero or more parameters. The command name may be
   abbreviated, with ambiguities being resolved in favour of the more
   commonly used commands.

GHCi のコマンドはすべて「 ``:`` 」ではじまり，1つのコマンド名と0個以上のパラメータからなります．
コマンド名は短縮可能です．
短縮の結果曖昧になった場合は，よりよく使われるコマンドを優先します．

.. comment

    This section makes use of the GHC-specific :directive:`ghci-cmd` directive
    defined in :file:`conf.py`. This is used to describe and cross-reference GHCi
    commands.


..
   .. ghci-cmd:: :abandon

       Abandons the current evaluation (only available when stopped at a
       breakpoint).

.. ghci-cmd:: :abandon

    現在の評価を破棄します(これはブレイクポイントで停止しているときのみ有効)．

..
   .. ghci-cmd:: :add;[*] ⟨module⟩

       Add ⟨module⟩(s) to the current target set, and perform a reload.
       Normally pre-compiled code for the module will be loaded if
       available, or otherwise the module will be compiled to byte-code.
       Using the ``*`` prefix forces the module to be loaded as byte-code.

.. ghci-cmd:: :add;[*] ⟨module⟩

    ⟨module⟩ を現在のターゲット集合に追加しリロードを実行します．
    通常，可能ならそのモジュールのコンパイル済みコードをロードし，そうでなければ，そのモジュールはバイトコードにコンパイルします．
    ``*`` 接頭辞を使えば，強制的にバイトコードとしてロードできます．

..
   .. ghci-cmd:: :all-types

       List all types collected for expressions and (local) bindings
       currently loaded (while :ghci-cmd:`:set +c` was active) with their respective
       source-code span, e.g. ::

	  GhciTypes> :all-types
	  GhciTypes.hs:(38,13)-(38,24): Maybe Id
	  GhciTypes.hs:(45,10)-(45,29): Outputable SpanInfo
	  GhciTypes.hs:(45,10)-(45,29): (Rational -> SpanInfo -> SDoc) -> Outputable SpanInfo

.. ghci-cmd:: :all-types

    (:ghci-cmd:`:set +c` をアクティブにしておいてからロードされた)現在ロードしている式や（局所）束縛の型を収集したものを一覧にします．
    このとき，それぞれの式の始点と終点を含むソースコード上の位置情報が同時に表示します．
    以下はその表示例です． ::

       GhciTypes> :all-types
       GhciTypes.hs:(38,13)-(38,24): Maybe Id
       GhciTypes.hs:(45,10)-(45,29): Outputable SpanInfo
       GhciTypes.hs:(45,10)-(45,29): (Rational -> SpanInfo -> SDoc) -> Outputable SpanInfo

..
   .. ghci-cmd:: :back; ⟨n⟩

       Travel back ⟨n⟩ steps in the history. ⟨n⟩ is one if omitted. See
       :ref:`tracing` for more about GHCi's debugging facilities. See also:
       :ghci-cmd:`:trace`, :ghci-cmd:`:history`, :ghci-cmd:`:forward`.

.. ghci-cmd:: :back; ⟨n⟩

    履歴を ⟨n⟩ ステップ戻ります．⟨n⟩ の指定が省略されれば，1ステップ戻ります．
    GHCi のデバッグ機能に関してより詳しくは :ref:`tracing` ， :ghci-cmd:`:trace` ， :ghci-cmd:`:history` ， :ghci-cmd:`:forward` などを参照してください．

..
   .. ghci-cmd:: :break; [⟨identifier⟩ | [⟨module⟩] ⟨line⟩ [⟨column⟩]]

       Set a breakpoint on the specified function or line and column. See
       :ref:`setting-breakpoints`.

.. ghci-cmd:: :break; [⟨identifier⟩ | [⟨module⟩] ⟨line⟩ [⟨column⟩]]

    関数あるいは行を指定してそこにブレイクポイントを設定します．
    :ref:`setting-breakpoints` を参照してください．

..
   .. ghci-cmd:: :browse;[!] [[*] ⟨module⟩]

       Displays the identifiers exported by the module ⟨module⟩, which must
       be either loaded into GHCi or be a member of a package. If ⟨module⟩
       is omitted, the most recently-loaded module is used.

       Like all other GHCi commands, the output is always displayed in the
       current GHCi scope (:ref:`ghci-scope`).

       There are two variants of the browse command:

       -  If the ``*`` symbol is placed before the module name, then *all*
	  the identifiers in scope in ⟨module⟩ (rather that just its
	  exports) are shown.

	  The ``*``-form is only available for modules which are
	  interpreted; for compiled modules (including modules from
	  packages) only the non-\ ``*`` form of :ghci-cmd:`:browse` is available.

       -  Data constructors and class methods are usually displayed in the
	  context of their data type or class declaration. However, if the
	  ``!`` symbol is appended to the command, thus ``:browse!``, they
	  are listed individually. The ``!``-form also annotates the
	  listing with comments giving possible imports for each group of
	  entries. Here is an example: ::

	      Prelude> :browse! Data.Maybe
	      -- not currently imported
	      Data.Maybe.catMaybes :: [Maybe a] -> [a]
	      Data.Maybe.fromJust :: Maybe a -> a
	      Data.Maybe.fromMaybe :: a -> Maybe a -> a
	      Data.Maybe.isJust :: Maybe a -> Bool
	      Data.Maybe.isNothing :: Maybe a -> Bool
	      Data.Maybe.listToMaybe :: [a] -> Maybe a
	      Data.Maybe.mapMaybe :: (a -> Maybe b) -> [a] -> [b]
	      Data.Maybe.maybeToList :: Maybe a -> [a]
	      -- imported via Prelude
	      Just :: a -> Maybe a
	      data Maybe a = Nothing | Just a
	      Nothing :: Maybe a
	      maybe :: b -> (a -> b) -> Maybe a -> b

	  This output shows that, in the context of the current session (ie
	  in the scope of ``Prelude``), the first group of items from
	  ``Data.Maybe`` are not in scope (althought they are available in
	  fully qualified form in the GHCi session - see
	  :ref:`ghci-scope`), whereas the second group of items are in
	  scope (via ``Prelude``) and are therefore available either
	  unqualified, or with a ``Prelude.`` qualifier.

.. ghci-cmd:: :browse;[!] [[*] ⟨module⟩]

    ⟨module⟩ からエクスポートされている識別子を表示します．
    ⟨module⟩ はGHCiにロードされているか，パッケージの要素でなければなりません．
    ⟨module⟩ が省略されれば，直近にロードされたモジュールを使います．

    他のGHCiのコマンドと同様，出力は現在のGHCiのスコープ(:ref:`ghci-scope`)で表示されます．

    browseコマンドには2つの変種があります．

    -  ``*`` 記号がモジュール名の前に置くと，その⟨module⟩のスコープにある *すべての* 識別子が（エクスポートされたものだけではなく）表示されます．

       ``*``-形式の指定は解釈実行するモジュールにのみ有効です．
       コンパイル済みモジュール(パッケージ由来のものを含めて)については :ghci-cmd:`:browse` は ``*``-形式ではない指定のみ有効です．

    -  データ構成子とクラスメソッドは通常そのデータ型あるいはクラス宣言の文脈で表示されます．
       しかし ``!`` 記号をコマンドの後に付けると，すなわち ``:browse!`` のようにすると個別の一覧表示になります．
       ``!``-形式にするとコメントで各エントリーグループごとにコメント付きで表示します．
       以下はその例です． ::

           Prelude> :browse! Data.Maybe
           -- not currently imported
           Data.Maybe.catMaybes :: [Maybe a] -> [a]
           Data.Maybe.fromJust :: Maybe a -> a
           Data.Maybe.fromMaybe :: a -> Maybe a -> a
           Data.Maybe.isJust :: Maybe a -> Bool
           Data.Maybe.isNothing :: Maybe a -> Bool
           Data.Maybe.listToMaybe :: [a] -> Maybe a
           Data.Maybe.mapMaybe :: (a -> Maybe b) -> [a] -> [b]
           Data.Maybe.maybeToList :: Maybe a -> [a]
           -- imported via Prelude
           maybe :: b -> (a -> b) -> Maybe a -> b
           Just :: a -> Maybe a
           data Maybe a = Nothing | Just a
           Nothing :: Maybe a

       この出力は現在のセッションの文脈(すなわち ``Prelude`` の有効範囲)で，
       最初の ``Data.Maybe`` 由来の項目グループは有効範囲にないことを示しています
       (ただし，GHCiのセッションでは完全修飾すれば，これらの項目は利用可能です．
       :ref:`ghci-scope` を参照)．
       しかし，2つめの項目グループは(``Prelude`` 経由で)有効範囲内にあり，
       修飾しなくても，あるいは ``Prelude.`` という修飾をつけて使えるということを示しています．

..
   .. ghci-cmd:: :cd; ⟨dir⟩

       Changes the current working directory to ⟨dir⟩. A "``~``" symbol
       at the beginning of ⟨dir⟩ will be replaced by the contents of the
       environment variable :envvar:`HOME`. See also the :ghci-cmd:`:show paths`
       command for showing the current working directory.

       Note: changing directories causes all currently loaded modules to be
       unloaded. This is because the search path is usually expressed using
       relative directories, and changing the search path in the middle of
       a session is not supported.

.. ghci-cmd:: :cd; ⟨dir⟩

    現在の作業ディレクトリを ⟨dir⟩ に変更します．"``~``"記号を ⟨dir⟩ の先頭に付ければ
    この記号は環境変数 :envvar:`HOME` の内容に置き換ります．
    現在の作業ディレクトリを表示する :ghci-cmd:`:show paths` コマンドを参照してください．

    注意: 現在の作業ディレクトリを変更すると，現在ロードされているモジュールはすべてアンロードされます．
    このようになっている理由は，検索パスは相対ディレクトリで表現されるのが普通で，
    セッション途中での検索パス変更はサポートされていないからです．

..
   .. ghci-cmd:: :cmd; ⟨expr⟩

       Executes ⟨expr⟩ as a computation of type ``IO String``, and then
       executes the resulting string as a list of GHCi commands. Multiple
       commands are separated by newlines. The :ghci-cmd:`:cmd` command is useful
       with :ghci-cmd:`:def` and :ghci-cmd:`:set stop`.

.. ghci-cmd:: :cmd; ⟨expr⟩

    ⟨expr⟩ を ``IO String`` 型のコンピュテーションを実行し，
    実行結果の文字列をGHCiのコマンドのリストとして実行します．
    複数のコマンドは改行で区切られます．
    :ghci-cmd:`:cmd` コマンドは :ghci-cmd:`:def` や :ghci-cmd:`:set stop` とともに使うのが便利です．

..
   .. ghci-cmd:: :complete; ⟨type⟩ [⟨n⟩-][⟨m⟩] ⟨string-literal⟩

       This command allows to request command completions from GHCi even
       when interacting over a pipe instead of a proper terminal and is
       designed for integrating GHCi's completion with text editors and
       IDEs.

       When called, :ghci-cmd:`:complete` prints the ⟨n⟩\ :sup:`th` to
       ⟨m⟩\ :sup:`th` completion candidates for the partial input
       ⟨string-literal⟩ for the completion domain denoted by ⟨type⟩.
       Currently, only the ``repl`` domain is supported which denotes the
       kind of completion that would be provided interactively by GHCi at
       the input prompt.

       If omitted, ⟨n⟩ and ⟨m⟩ default to the first or last available
       completion candidate respectively. If there are less candidates than
       requested via the range argument, ⟨n⟩ and ⟨m⟩ are implicitly capped
       to the number of available completition candidates.

       The output of :ghci-cmd:`:complete` begins with a header line containing
       three space-delimited fields:

       -  An integer denoting the number ``l`` of printed completions,
       -  an integer denoting the total number of completions available,
	  and finally
       -  a string literal denoting a common prefix to be added to the
	  returned completion candidates.

       The header line is followed by ⟨l⟩ lines each containing one
       completion candidate encoded as (quoted) string literal. Here are
       some example invocations showing the various cases:

       .. code-block:: none

	   Prelude> :complete repl 0 ""
	   0 470 ""
	   Prelude> :complete repl 5 "import For"
	   5 21 "import "
	   "Foreign"
	   "Foreign.C"
	   "Foreign.C.Error"
	   "Foreign.C.String"
	   "Foreign.C.Types"
	   Prelude> :complete repl 5-10 "import For"
	   6 21 "import "
	   "Foreign.C.Types"
	   "Foreign.Concurrent"
	   "Foreign.ForeignPtr"
	   "Foreign.ForeignPtr.Safe"
	   "Foreign.ForeignPtr.Unsafe"
	   "Foreign.Marshal"
	   Prelude> :complete repl 20- "import For"
	   2 21 "import "
	   "Foreign.StablePtr"
	   "Foreign.Storable"
	   Prelude> :complete repl "map"
	   3 3 ""
	   "map"
	   "mapM"
	   "mapM_"
	   Prelude> :complete repl 5-10 "map"
	   0 3 ""

.. ghci-cmd:: :complete; ⟨type⟩ [⟨n⟩-][⟨m⟩] ⟨string-literal⟩

    このコマンドを使えば，端末からではなくパイプでGHCiと繋いているときでも，コマンド補完を要求できます．
    この機能はGHCiの補完をテキストエディタやIDEに統合するために設計してあります．

    :ghci-cmd:`:complete` は ⟨n⟩ 番目から ⟨m⟩ 番目までの補完候補を表示します．
    補完の対象となるのは ⟨type⟩ で指定された補完ドメインの部分入力 ⟨string-literal⟩ です．
    現時点では ``repl`` ドメインのみサポートしています．
    このドメインはGHCiの入力プロンプトでのみ対話的に提供するものです．

    ⟨n⟩ および ⟨m⟩ は省略するとデフォルトでそれぞれ最初の補完候補および最後の補完候補を指します．
    引数で指定した範囲よりも実際にその範囲にある候補数が小さい場合は，⟨n⟩ および ⟨m⟩ は暗黙に実際の候補数に丸められます．

    :ghci-cmd:`:complete` の出力は，空白で区切られた以下の3つのフィールドを含むヘッダ行で始まります．

    -  表示される候補の数  ``l`` を表す整数
    -  利用可能な全ての補完の数を表す整数
    -  返される補完後方に付加される共通接頭辞を表す文字リテラル

    ヘッダ行のあとに ⟨l⟩ 行が続き，各行は1つの補完候補が引用符付きの文字列リテラルとしてエンコードされています．
    いろいろな場合の起動例を以下に示しましょう．

    .. code-block:: none

        Prelude>
	:complete repl 0 ""
	0 506 ""
	Prelude> :complete repl 5 "import For"
	5 21 "import "
	"Foreign"
	"Foreign.C"
	"Foreign.C.Error"
	"Foreign.C.String"
	"Foreign.C.Types"
	Prelude> :complete repl 5-10 "import For"
	6 21 "import "
	"Foreign.C.Types"
	"Foreign.Concurrent"
	"Foreign.ForeignPtr"
	"Foreign.ForeignPtr.Safe"
	"Foreign.ForeignPtr.Unsafe"
	"Foreign.Marshal"
	Prelude> :complete repl 20- "import For"
	2 21 "import "
	"Foreign.StablePtr"
	"Foreign.Storable"
	Prelude> :complete repl "map"
	4 4 ""
	"map"
	"mapM"
	"mapM_"
	"mappend"

..
   .. ghci-cmd:: :continue

       Continue the current evaluation, when stopped at a breakpoint.

.. ghci-cmd:: :continue

    ブレイクポイントで停止しているとき，現在の評価を再開します．

..
   .. ghci-cmd:: :ctags; [⟨filename⟩]

       Generates a "tags" file for Vi-style editors (:ghci-cmd:`:ctags`) or
       Emacs-style editors (:ghci-cmd:`:etags`). If no filename is specified, the
       default ``tags`` or ``TAGS`` is used, respectively. Tags for all the
       functions, constructors and types in the currently loaded modules
       are created. All modules must be interpreted for these commands to
       work.

.. ghci-cmd:: :ctags; [⟨filename⟩]

    :ghci-cmd:`:ctags` はVi系エディタ用タグファイルを生成します．
    :ghci-cmd:`:etags` はEmacs系エディタ用です．
    ⟨filename⟩ を指定しなかった場合は，デフォルトでそれぞれ ``tags`` あるいは ``TAGS`` をファイル名として使います．
    現在ロードしているモジュール内のすべての関数，構成子，型のタグを生成します．
    これらのコマンドが有効に働くためにはすべてのモジュールが解釈実行されているものでなければなりません．

..
   .. ghci-cmd:: :def;[!] ⟨name⟩ ⟨expr⟩

       :ghci-cmd:`:def` is used to define new commands, or macros, in GHCi. The
       command ``:def ⟨name⟩ ⟨expr⟩`` defines a new GHCi command ``:name``,
       implemented by the Haskell expression ⟨expr⟩, which must have type
       ``String -> IO String``. When ``:name args`` is typed at the prompt,
       GHCi will run the expression ``(name args)``, take the resulting
       ``String``, and feed it back into GHCi as a new sequence of
       commands. Separate commands in the result must be separated by
       "``\n``".

       That's all a little confusing, so here's a few examples. To start
       with, here's a new GHCi command which doesn't take any arguments or
       produce any results, it just outputs the current date and time:

       .. code-block:: none

	   Prelude> let date _ = Time.getClockTime >>= print >> return ""
	   Prelude> :def date date
	   Prelude> :date
	   Fri Mar 23 15:16:40 GMT 2001

       Here's an example of a command that takes an argument. It's a
       re-implementation of :ghci-cmd:`:cd`:

       .. code-block:: none

	   Prelude> let mycd d = Directory.setCurrentDirectory d >> return ""
	   Prelude> :def mycd mycd
	   Prelude> :mycd ..

       Or I could define a simple way to invoke "``ghc --make Main``"
       in the current directory:

       .. code-block:: none

	   Prelude> :def make (\_ -> return ":! ghc --make Main")

       We can define a command that reads GHCi input from a file. This
       might be useful for creating a set of bindings that we want to
       repeatedly load into the GHCi session:

       .. code-block:: none

	   Prelude> :def . readFile
	   Prelude> :. cmds.ghci

       Notice that we named the command ``:.``, by analogy with the
       "``.``" Unix shell command that does the same thing.

       Typing ``:def`` on its own lists the currently-defined macros.
       Attempting to redefine an existing command name results in an error
       unless the ``:def!`` form is used, in which case the old command
       with that name is silently overwritten.

.. ghci-cmd:: :def;[!] ⟨name⟩ ⟨expr⟩

    :ghci-cmd:`:def` はGHCi内で新しいコマンド(あるいはマクロ)を定義するのに使います．
    ``:def ⟨name⟩ ⟨expr⟩`` というコマンドはHaskellの式 ⟨expr⟩ で実装した新しいGHCiコマンド ``:name`` を定義します．
    この式 ⟨expr⟩ の型は ``String -> IO String`` でなくてはなりません．
    GHCiのプロンプトで ``:name args`` を入力すると，式 ``(name args)`` が実行されます．
    その結果の ``String`` をとり，それを再度GHCiにコマンド列として戻します．
    結果のコマンド文字列は "``\n``" で区切られていなければなりません．

    これは少々ややこしいので，例をいくつか挙げましょう．
    まず，次に示す新しいコマンドは引数をとらず，結果も生成せず，単に現在の日時を出力するだけのものです．

    .. code-block:: none

        Prelude> import Data.Time
	Prelude Data.Time> let date _ = getCurrentTime >>= putStrLn . formatTime defaultTimeLocale rfc822DateFormat >> return ""
	Prelude Data.Time> :def date date
	Prelude Data.Time> :date
	Thu, 23 Mar 2017 06:21:10 UTC

    次は，引数を1つとるコマンドの例です．
    これは :ghci-cmd:`:cd`: コマンドの再実装です．

    .. code-block:: none

        Prelude> import System.Directory
        Prelude System.Directory> let mycd d = setCurrentDirectory d >> return ""
        Prelude System.Directory> :def mycd mycd
        Prelude System.Directory> :mycd ..

    あるいは，現在のディレクトリで「 ``ghc -o foo Main`` 」を起動する単純な方法を定義できます．

    .. code-block:: none

        Prelude> :def make (\_ -> return ":! ghc -o foo Main")

    GHCiへの入力をファイルから読み込むコマンドを定義することもできます．
    これは，あらかじえ決った束縛を繰り返しGHCiセッションにロードしたいとうとき便利でしょう．

    .. code-block:: none

        Prelude> :def . readFile
        Prelude> :. cmds.ghci

    このコマンドを ``:.`` としたのは同じことを Unix シェルの「 ``.`` 」とのアナロジーです．

    ``:def`` を単独で入力すると，現在定義されているマクロの一覧が表示されます．
    既に存在するコマンド名を再定義しようとするとエラーになりますが，
    ``:def!`` のように感嘆符をつけると古い方は黙って上書きされます．

..
   .. ghci-cmd:: :delete; * | ⟨num⟩ ...

       Delete one or more breakpoints by number (use :ghci-cmd:`:show breaks` to
       see the number of each breakpoint). The ``*`` form deletes all the
       breakpoints.

.. ghci-cmd:: :delete; * | ⟨num⟩ ...

    1つ以上のブレイクポイントを番号で指定して削除します．
    (それぞれのブレイクポイントの番号を知るには :ghci-cmd:`:show breaks` を使います．)
    ``*`` を使えば，すべてのブレイクポイントが削除されます．

..
   .. ghci-cmd:: :edit; ⟨file⟩

       Opens an editor to edit the file ⟨file⟩, or the most recently loaded
       module if ⟨file⟩ is omitted. If there were errors during the last
       loading, the cursor will be positioned at the line of the first
       error. The editor to invoke is taken from the :envvar:`EDITOR` environment
       variable, or a default editor on your system if :envvar:`EDITOR` is not
       set. You can change the editor using :ghci-cmd:`:set editor`.

.. ghci-cmd:: :edit; ⟨file⟩

    エディタを開いてファイル ⟨file⟩ を編集します． ⟨file⟩ を省略した場合は直近にロードされたモジュールを編集します．
    直近のロードでエラーが起きたときは，カーソルが最初のエラーが起きた箇所に置かれます．
    エディタは，環境変数 :envvar:`EDITOR` で指定されるものか，環境変数の設定がない場合はシステムのデフォルトエディタが起動します
    使用するエディタは :ghci-cmd:`:set editor` を使って変更できます．

..
   .. ghci-cmd:: :etags

       See :ghci-cmd:`:ctags`.

.. ghci-cmd:: :etags

    :ghci-cmd:`:ctags` を参照してください．

..
   .. ghci-cmd:: :force; ⟨identifier⟩ ...

       Prints the value of ⟨identifier⟩ in the same way as :ghci-cmd:`:print`.
       Unlike :ghci-cmd:`:print`, :ghci-cmd:`:force` evaluates each thunk that it
       encounters while traversing the value. This may cause exceptions or
       infinite loops, or further breakpoints (which are ignored, but
       displayed).

.. ghci-cmd:: :force; ⟨identifier⟩ ...

    :ghci-cmd:`:print` と同じように ⟨identifier⟩ の値を表示します．
    :ghci-cmd:`:print` とは違い :ghci-cmd:`:force` は値をたどっていく過程で出会ったサンクを評価しますので，
    例外あるいは無限ループが発生したり，次のブレイクポイントに当たる(これは無視しますが，その旨を表示する)ことがあります．

..
   .. ghci-cmd:: :forward; ⟨n⟩

       Move forward ⟨n⟩ steps in the history. ⟨n⟩ is one if omitted. See
       :ref:`tracing` for more about GHCi's debugging facilities. See also:
       :ghci-cmd:`:trace`, :ghci-cmd:`:history`, :ghci-cmd:`:back`.

.. ghci-cmd:: :forward; ⟨n⟩

    履歴を ⟨n⟩ ステップ前進します． ⟨n⟩ の指定が省略されれば，1ステップ前進します．
    GHCi のデバッグ機能に関してより詳しくは :ref:`tracing` ， :ghci-cmd:`:trace` ， :ghci-cmd:`:history` ， :ghci-cmd:`:back` を参照してください．

..
   .. ghci-cmd:: :help
		 :?

       Displays a list of the available commands.

.. ghci-cmd:: :help
              :?

    利用可能なコマンドの一覧を表示します．

..
   .. ghci-cmd:: :

       .. index::
	  pair: Repeating last command; in GHCi

       Repeat the previous command.

.. ghci-cmd:: :

    .. index::
       pair: 直近のコマンドを反復; GHCiで〜

    直近のコマンドを反復します．

..
   .. ghci-cmd:: :history; [num]

       Display the history of evaluation steps. With a number, displays
       that many steps (default: 20). For use with :ghci-cmd:`:trace`; see
       :ref:`tracing`. To set the number of history entries stored by GHCi,
       use the :ghc-flag:`-fghci-hist-size` flag.

.. ghci-cmd:: :history; [num]

    評価ステップの履歴を表示します．数を指定すると，その数ぶんのステップを表示します(デフォルトは20)．
    :ghci-cmd:`:trace` (:ref:`tracing` 参照)と組み合わせて使います．
    GHCi が保存する履歴のエントリー数を設定するには :ghc-flag:`-fghci-hist-size` フラグを使います．

..
   .. ghci-cmd:: :info;[!] ⟨name⟩

       Displays information about the given name(s). For example, if ⟨name⟩
       is a class, then the class methods and their types will be printed;
       if ⟨name⟩ is a type constructor, then its definition will be
       printed; if ⟨name⟩ is a function, then its type will be printed. If
       ⟨name⟩ has been loaded from a source file, then GHCi will also
       display the location of its definition in the source.

       For types and classes, GHCi also summarises instances that mention
       them. To avoid showing irrelevant information, an instance is shown
       only if (a) its head mentions ⟨name⟩, and (b) all the other things
       mentioned in the instance are in scope (either qualified or
       otherwise) as a result of a :ghci-cmd:`:load` or :ghci-cmd:`:module`
       commands.

       The command ``:info!`` works in a similar fashion but it removes
       restriction (b), showing all instances that are in scope and mention
       ⟨name⟩ in their head.

.. ghci-cmd:: :info;[!] ⟨name⟩

    与えられた名前についての情報を表示します．
    たとえば， ⟨name⟩ がクラスなら，そのクラスのメソッドとその型が表示される．
    ⟨name⟩ が型構成子の場合はその定義が表示され，関数なら型が表示されます．
    また ⟨name⟩ がソースファイルからロードさればものなら，GHCiはその定義のソースコードの位置も表示します．

    型およびクラスについては、それに言及するインスタンスもまとめて表示します．
    無関係な情報が表示されることがないよう，インスタンスは，(a)その頭部が ⟨name⟩ に言及しており，
    (b)そのインスタンスで言及されているものが全て :ghci-cmd:`:load` あるいは :ghci-cmd:`:module`
    コマンドの結果として(修飾されているかいないかにかかわらず)スコープにある場合にのみ表示されます．

    ``:info!`` コマンドも同様に動作しますが，(b)の制限はなく ⟨name⟩ に言及するインスタンスでスコープにあるものを全て表示します．

..
   .. ghci-cmd:: :issafe; [⟨module⟩]

       Displays Safe Haskell information about the given module (or the
       current module if omitted). This includes the trust type of the
       module and its containing package.

.. ghci-cmd:: :issafe; [⟨module⟩]

    与えられたモジュール(省略された場合は現在のモジュール)に間する Safe Haskell 情報を表示します．
    モジュールとそれを含むパッケージの信頼のタイプの情報が表示されます．

..
   .. ghci-cmd:: :kind;[!] ⟨type⟩

       Infers and prints the kind of ⟨type⟩. The latter can be an arbitrary
       type expression, including a partial application of a type
       constructor, such as ``Either Int``. In fact, :ghci-cmd:`:kind` even allows
       you to write a partial application of a type synonym (usually
       disallowed), so that this works:

       .. code-block:: none

	   ghci> type T a b = (a,b,a)
	   ghci> :k T Int Bool
	   T Int Bool :: *
	   ghci> :k T
	   T :: * -> * -> *
	   ghci> :k T Int
	   T Int :: * -> *

       If you specify the optional "``!``", GHC will in addition normalise
       the type by expanding out type synonyms and evaluating type-function
       applications, and display the normalised result.

.. ghci-cmd:: :kind;[!] ⟨type⟩

    ⟨type⟩ のカインドを推論し表示します． ⟨type⟩ は任意の型式で ``Either Int`` のような型構成子の部分適用であってもかまいません．
    実は :ghci-cmd:`:kind` では通常はできない型シノニムの部分適用が書けるので以下のようなことができます．

    .. code-block:: none

        ghci> type T a b = (a,b,a)
        ghci> :k T Int Bool
        T Int Bool :: *
        ghci> :k T
        T :: * -> * -> *
        ghci> :k T Int
        T Int :: * -> *

    追加で「 ``!`` 」を指定すると GHCi は型関数適用を評価しその結果を表示します．

..
   .. ghci-cmd:: :list; ⟨identifier⟩

       Lists the source code around the definition of ⟨identifier⟩ or the
       current breakpoint if not given. This requires that the identifier
       be defined in an interpreted module. If your output device supports
       it, then GHCi will highlight the active subexpression in bold.

.. ghci-cmd:: :list; ⟨identifier⟩

    ⟨identifier⟩ が与えられればその定義周辺を表示し，与えられなければ現在のブレイクポイント周辺を表示します．
    この識別子は解釈実行するモジュールで定義されている必要があります．
    出力デバイスが対応していれば，GHCiは注目している部分式を太字で強調表示します．

..
   .. ghci-cmd:: :list [⟨module⟩]; ⟨line⟩

       Lists the source code around the given line number of ⟨module⟩. This
       requires that the module be interpreted. If your output device
       supports it, then GHCi will highlight the active subexpression in
       bold.

.. ghci-cmd:: :list [⟨module⟩]; ⟨line⟩

    ⟨module⟩ の与えられた行番号周辺のソースコードを表示します．
    このモジュールは解釈実行するものでなければなりません．
    出力デバイスが対応していれば，GHCiは注目している部分式を太字で強調表示します．
	      

..
   .. ghci-cmd:: :load;[!] [*]⟨module⟩

       Recursively loads the specified ⟨module⟩s, and all the modules they
       depend on. Here, each ⟨module⟩ must be a module name or filename,
       but may not be the name of a module in a package.

       All previously loaded modules, except package modules, are
       forgotten. The new set of modules is known as the target set. Note
       that :ghci-cmd:`:load` can be used without any arguments to unload all the
       currently loaded modules and bindings.

       Normally pre-compiled code for a module will be loaded if available,
       or otherwise the module will be compiled to byte-code. Using the
       ``*`` prefix forces a module to be loaded as byte-code.

       Adding the optional "``!``" turns type errors into warnings while
       loading. This allows to use the portions of the module that are
       correct, even if there are type errors in some definitions.
       Effectively, the "-fdefer-type-errors" flag is set before loading
       and unset after loading if the flag has not already been set before.
       See :ref:`defer-type-errors` for further motivation and details.

       After a :ghci-cmd:`:load` command, the current context is set to:

       -  ⟨module⟩, if it was loaded successfully, or

       -  the most recently successfully loaded module, if any other
	  modules were loaded as a result of the current :ghci-cmd:`:load`, or

       -  ``Prelude`` otherwise.

.. ghci-cmd:: :load;[!] [*]⟨module⟩

    指定した ⟨module⟩ および，それが依存するすべてのモジュールを再帰的にロードします．
    個々の ⟨module⟩ はモジュール名またはファイル名でなければならない．
    また，パッケージ内のモジュールの名前を指定することはできません．

    以前にロードだれていたモジュールは，パッケージ中のものを除いて，忘れられてしまいます．
    この新しいモジュールの集合をターゲット集合といいます．
    :ghci-cmd:`:load` を引数なしで使うと，現在ロードされているモジュールおよび束縛を全て未ロード状態にできることに注意してください．

    通常可能ならばコンパイル済みのコードをロードしますが，そうでなければ，そのモジュールはバイトコードにコンパイルします．
    接頭辞 ``*`` を使えば，強制的にモジュールをバイトコードとしてロードします．

    「 ``!`` 」を追加するとロード中の型エラーが警告になります．
    こうすることで，型エラーになる定義を含むモジュールであっても，正しい部分だけを使うことができます．
    実際には，ロード前に「-fdefer-type-errors」フラグを設定して，
    ロード以前にそのフラグが設定されていなければ，ロード後このフラグを未設定にもどしています．
    動機と詳細については :ref:`defer-type-errors` を参照してください．

    :ghci-cmd:`:load` コマンドを発行後，現在の文脈は以下のようになります．

    -  ⟨module⟩ のロードが成功したらその ⟨module⟩．

    -  そうでなければ，今回の :ghci-cmd:`:load` コマンドの結果ロードが成功した他のモジュールがあればそのモジュール．

    -  そうでなければ ``Prelude``

..
   .. ghci-cmd:: :loc-at; ⟨module⟩ ⟨line⟩ ⟨col⟩ ⟨end-line⟩ ⟨end-col⟩ [⟨name⟩]

       Tries to find the definition site of the name at the given
       source-code span, e.g.:

       .. code-block:: none

	   X> :loc-at X.hs 6 14 6 16 mu
	   X.hs:(8,7)-(8,9)

       This command is useful when integrating GHCi with text editors and
       IDEs for providing a goto-definition facility.

       The ``:loc-at`` command requires :ghci-cmd:`:set +c` to be set.

.. ghci-cmd:: :loc-at; ⟨module⟩ ⟨line⟩ ⟨col⟩ ⟨end-line⟩ ⟨end-col⟩ [⟨name⟩]

    与えられたソースコードの範囲にある ⟨name⟩ の定義場所を探します．
    以下はその例です．

    .. code-block:: none

        X> :loc-at X.hs 6 14 6 16 mu
        X.hs:(8,7)-(8,9)

    このコマンドはGHCiとテキストエディタやIDEを統合したときに，定義位置へ移動する機能を提供するのに使えます．

    ``:loc-at`` コマンドを使うためには :ghci-cmd:`:set +c` を設定しておく必要があります．

..
   .. ghci-cmd:: :main; ⟨arg1⟩ ... ⟨argn⟩

       When a program is compiled and executed, it can use the ``getArgs``
       function to access the command-line arguments. However, we cannot
       simply pass the arguments to the ``main`` function while we are
       testing in ghci, as the ``main`` function doesn't take its arguments
       directly.

       Instead, we can use the :ghci-cmd:`:main` command. This runs whatever
       ``main`` is in scope, with any arguments being treated the same as
       command-line arguments, e.g.:

       .. code-block:: none

	   Prelude> main = System.Environment.getArgs >>= print
	   Prelude> :main foo bar
	   ["foo","bar"]

       We can also quote arguments which contains characters like spaces,
       and they are treated like Haskell strings, or we can just use
       Haskell list syntax:

       .. code-block:: none

	   Prelude> :main foo "bar baz"
	   ["foo","bar baz"]
	   Prelude> :main ["foo", "bar baz"]
	   ["foo","bar baz"]

       Finally, other functions can be called, either with the ``-main-is``
       flag or the :ghci-cmd:`:run` command:

       .. code-block:: none

	   Prelude> foo = putStrLn "foo" >> System.Environment.getArgs >>= print
	   Prelude> bar = putStrLn "bar" >> System.Environment.getArgs >>= print
	   Prelude> :set -main-is foo
	   Prelude> :main foo "bar baz"
	   foo
	   ["foo","bar baz"]
	   Prelude> :run bar ["foo", "bar baz"]
	   bar
	   ["foo","bar baz"]

.. ghci-cmd:: :main; ⟨arg1⟩ ... ⟨argn⟩

    プログラムをコンパイルし実行するときに ``getArgs`` を使ってコマンドライン引数にアクセスできます．
    しかし，GHCiでテストしているときには ``main`` にコマンドライン引数を簡単には渡せません．
    それは ``main`` は直接引数を取らないからです．

    そこで :ghci-cmd:`:main` コマンドを使います．
    このコマンドは有効範囲にある ``main`` をとにかく実行し，任意の引数をコマンドライン引数とします．
    以下がその実行例です．
    
    .. code-block:: none

        Prelude> main = System.Environment.getArgs >>= print
        Prelude> :main foo bar
        ["foo","bar"]

    2重引用符を使うことで，スペースを含む引数を扱えます．
    引数はHaskellの文字列のリストになり，Haskell内でそのように処理できます．

    .. code-block:: none

        Prelude> :main foo "bar baz"
        ["foo","bar baz"]
        Prelude> :main ["foo", "bar baz"]
        ["foo","bar baz"]

    ``-main-is`` フラグを設定するか :ghci-cmd:`:run` コマンドを使えば ``main`` 以外も実行できます．

    .. code-block:: none

        Prelude> foo = putStrLn "foo" >> System.Environment.getArgs >>= print
        Prelude> bar = putStrLn "bar" >> System.Environment.getArgs >>= print
        Prelude> :set -main-is foo
        Prelude> :main foo "bar baz"
        foo
        ["foo","bar baz"]
        Prelude> :run bar ["foo", "bar baz"]
        bar
        ["foo","bar baz"]

..
   .. ghci-cmd:: :module; +|- [*]⟨mod1⟩ ...
   .. ghci-cmd:: import; ⟨mod⟩

       Sets or modifies the current context for statements typed at the
       prompt. The form ``import mod`` is equivalent to ``:module +mod``.
       See :ref:`ghci-scope` for more details.

.. ghci-cmd:: :module; +|- [*]⟨mod1⟩ ...
.. ghci-cmd:: import; ⟨mod⟩

    プロンプトに入力する文(statement)用の文脈を設定または変更します．
    ``import mod`` の形式は ``:module +mod`` と同等です．
    詳しいことについては :ref:`ghci-scope` を参照してください．

..
   .. ghci-cmd:: :print; ⟨names⟩

       Prints a value without forcing its evaluation. :ghci-cmd:`:print` may be
       used on values whose types are unknown or partially known, which
       might be the case for local variables with polymorphic types at a
       breakpoint. While inspecting the runtime value, :ghci-cmd:`:print` attempts
       to reconstruct the type of the value, and will elaborate the type in
       GHCi's environment if possible. If any unevaluated components
       (thunks) are encountered, then :ghci-cmd:`:print` binds a fresh variable
       with a name beginning with ``_t`` to each thunk. See
       :ref:`breakpoints` for more information. See also the :ghci-cmd:`:sprint`
       command, which works like :ghci-cmd:`:print` but does not bind new
       variables.

.. ghci-cmd:: :print; ⟨names⟩

    評価を強制することなく値を表示します．
    :ghci-cmd:`:print` は型が不明もしくは部分的にしか判明していない値についても使用できます．
    ブレイクポイントにおける，多相型の局所変数がこれにあたります．
    :ghci-cmd:`:print` は実行時の値を調査しつつ，その値を型を再構成しようとします．
    そして可能であれば型を精密にしようとします．
    未評価の部分(すなわちサンク)に出会うと :ghci-cmd:`:print` は ``_t`` で始まる名前の新しい変数をそれぞれのサンクに束縛します．
    詳しくは :ref:`breakpoints` を参照してください．
    :ghci-cmd:`:sprint` という新しい変数は束縛しませんが，それ以外は同じコマンドも参照してください．
    
..
   .. ghci-cmd:: :quit

       Quits GHCi. You can also quit by typing :kbd:`Control-D` at the prompt.

.. ghci-cmd:: :quit

    GHCiを終了します．プロンプトで :kbd:`Control-D` をタイプしても終了できます．

..
   .. ghci-cmd:: :reload;[!]

       Attempts to reload the current target set (see :ghci-cmd:`:load`) if any of
       the modules in the set, or any dependent module, has changed. Note
       that this may entail loading new modules, or dropping modules which
       are no longer indirectly required by the target.

       Adding the optional "``!``" turns type errors into warnings while
       loading. This allows to use the portions of the module that are
       correct, even if there are type errors in some definitions.
       Effectively, the "-fdefer-type-errors" flag is set before loading
       and unset after loading if the flag has not already been set before.
       See :ref:`defer-type-errors` for further motivation and details.

.. ghci-cmd:: :reload;[!]

    現在のターゲット集合(:ghci-cmd:`:load` 参照)とそれらが依存するモジュールのうち，
    変更のあったものがあれば，ターゲット集合を再ロードしようと試みます．
    結果として，新しいモジュールがロードされたり，ターゲットから間接的に必要とされなくなったモジュールが外れたりする可能性がある
    ことに注意してください．

    「 ``!`` 」を追加するとロード中の型エラーが警告になります．
    こうすることで，型エラーになる定義を含むモジュールであっても，正しい部分だけを使うことができます．
    実際には，ロード前に「-fdefer-type-errors」フラグを設定して，
    ロード以前にそのフラグが設定されていなければ，ロード後このフラグを未設定にもどしています．
    動機と詳細については :ref:`defer-type-errors` を参照してください．

..
   .. ghci-cmd:: :run

       See :ghci-cmd:`:main`.

.. ghci-cmd:: :run

    :ghci-cmd:`:main` を参照してください．

..
   .. ghci-cmd:: :script; [⟨n⟩] ⟨filename⟩

       Executes the lines of a file as a series of GHCi commands. This
       command is compatible with multiline statements as set by
       :ghci-cmd:`:set +m`

.. ghci-cmd:: :script; [⟨n⟩] ⟨filename⟩

    指定したファイルの行を一連のGHCiコマンドとて実行します．
    :ghci-cmd:`:set +m` で設定される複数行コマンドと同時に使えます．

..
   .. ghci-cmd:: :set; [⟨option⟩ ...]

       Sets various options. See :ref:`ghci-set` for a list of available
       options and :ref:`interactive-mode-options` for a list of
       GHCi-specific flags. The :ghci-cmd:`:set` command by itself shows which
       options are currently set. It also lists the current dynamic flag
       settings, with GHCi-specific flags listed separately.

.. ghci-cmd:: :set; [⟨option⟩ ...]

    さまざまなオプションを設定します．
    利用可能なオプション一覧については :ref:`ghci-set` を参照して下さい．
    また，GHCi固有のフラグ一覧については :ref:`interactive-mode-options` を参照してください．
    :ghci-cmd:`:set` コマンドを単独で使うと，現在設定されているオプションが表示されます．
    また，それとは分けて，動的フラグの設定状況も一覧表示します．

..
   .. ghci-cmd:: :set args; ⟨arg⟩

       .. index::
	  single: getArgs, behavior in GHCi

       Sets the list of arguments which are returned when the program calls
       ``System.getArgs``.

.. ghci-cmd:: :set args; ⟨arg⟩

    .. index::
       single: getArgs, GHCiにおける〜の振る舞い

    プログラムが ``System.getArgs`` を呼んだときに返される引数のリストを設定します．

..
   .. ghci-cmd:: :set editor; ⟨cmd⟩

       Sets the command used by :ghci-cmd:`:edit` to ⟨cmd⟩.

.. ghci-cmd:: :set editor; ⟨cmd⟩

    :ghci-cmd:`:edit` コマンドで使うエディタ起動を ⟨cmd⟩ に設定する．

..
   .. ghci-cmd:: :set prog; ⟨prog⟩

       .. index::
	  single: getProgName, behavior in GHCi

       Sets the string to be returned when the program calls
       ``System.getProgName``.

.. ghci-cmd:: :set prog; ⟨prog⟩

    .. index::
       single: getProgName, GHCiにおける〜の振る舞い

    プログラムが ``System.getProgName`` を呼んだときに返される文字列を設定します．

..
   .. ghci-cmd:: :set prompt; ⟨prompt⟩

       .. index::
	  single: GHCi prompt; setting

       Sets the string to be used as the prompt in GHCi. Inside ⟨prompt⟩,
       the sequence ``%s`` is replaced by the names of the modules
       currently in scope, ``%l`` is replaced by the line number (as
       referenced in compiler messages) of the current prompt, and ``%%``
       is replaced by ``%``. If ⟨prompt⟩ starts with ``"`` then it is parsed as
       a Haskell String; otherwise it is treated as a literal string.

.. ghci-cmd:: :set prompt; ⟨prompt⟩

    .. index::
       single: GHCiのプロンプト; 〜の設定

    GHCiのプロンプトとして使う文字列を設定します．
    ⟨prompt⟩ の中では ``%s`` という並びは現在のスコープにあるモジュール名に置き換え，
    ``%l`` は現在のプロンプトの行番号(コンパイラメッセージで参照されるもの)に置き換え，
    ``%%`` は ``%`` に置き換えます．
    ⟨prompt⟩ が ``"`` で始まる場合，Haskellの ``String`` としてパースします．
    そうでない場合はそのまま文字列として扱います．

..
   .. ghci-cmd:: :set prompt2; ⟨prompt⟩

       Sets the string to be used as the continuation prompt (used when
       using the :ghci-cmd:`:{` command) in GHCi.

.. ghci-cmd:: :set prompt2; ⟨prompt⟩

    (:ghci-cmd:`:{` コマンドを使うときに使う)GHCiの継続プロンプトとして使う文字列を設定します．

..
   .. ghci-cmd:: :set stop; ⟨num⟩ ⟨cmd⟩

       Set a command to be executed when a breakpoint is hit, or a new item
       in the history is selected. The most common use of :ghci-cmd:`:set stop` is
       to display the source code at the current location, e.g.
       ``:set stop :list``.

       If a number is given before the command, then the commands are run
       when the specified breakpoint (only) is hit. This can be quite
       useful: for example, ``:set stop 1 :continue`` effectively disables
       breakpoint 1, by running :ghci-cmd:`:continue` whenever it is hit (although
       GHCi will still emit a message to say the breakpoint was hit). What's more,
       with cunning use of :ghci-cmd:`:def` and :ghci-cmd:`:cmd` you can use
       :ghci-cmd:`:set stop` to implement conditional breakpoints:

       .. code-block:: none

	   *Main> :def cond \expr -> return (":cmd if (" ++ expr ++ ") then return \"\" else return \":continue\"")
	   *Main> :set stop 0 :cond (x < 3)

       Ignoring breakpoints for a specified number of iterations is also
       possible using similar techniques.

.. ghci-cmd:: :set stop; ⟨num⟩ ⟨cmd⟩

    ブレイクポイントに当たったとき，または履歴中で新しい項目が選択したときに実行するコマンドを設定します．
    :ghci-cmd:`:set stop` の最もよくある使い方は，現在の位置のソースコードを表示するこです．
    たとえば ``:set stop :list`` のようにします．

    コマンドの前に数値を指定すると，その番号のブレイクポイントにあたったときにだけそのコマンドを実行します．
    これは便利な機能です．たとえば ``:set stop 1 :continue`` は1番のブレイクポイントを無効にするのと同じことです．
    1番のブレイクポイントに当ったときはいつも :ghci-cmd:`:continue` が実行されるからです
    (ただし，ブレイクポイントに当ったとのメッセージは出力されます)．
    さらに :ghci-cmd:`:def` と :ghci-cmd:`:cmd` をうまく使って :ghci-cmd:`:set stop` で条件付ブレイクポイントを実装することもできます．

    .. code-block:: none

        *Main> :def cond \expr -> return (":cmd if (" ++ expr ++ ") then return \"\" else return \":continue\"")
        *Main> :set stop 0 :cond (x < 3)

    同様の技法を使えば，指定した回数だけブレイクポイントを無視することもできます．

..
   .. ghci-cmd:: :seti; [⟨option⟩ ...]

       Like :ghci-cmd:`:set`, but options set with :ghci-cmd:`:seti` affect only
       expressions and commands typed at the prompt, and not modules loaded
       with :ghci-cmd:`:load` (in contrast, options set with :ghci-cmd:`:set` apply
       everywhere). See :ref:`ghci-interactive-options`.

       Without any arguments, displays the current set of options that are
       applied to expressions and commands typed at the prompt.

.. ghci-cmd:: :seti; [⟨option⟩ ...]

    :ghci-cmd:`:set` と似ていますが :ghci-cmd:`:seti` で設定されたオプションはプロンプトに入力された式とコマンドのみに影響し，
    :ghci-cmd:`:load` でロードされたモジュールには影響しません
    (対照的に :ghci-cmd:`:set` で設定されたオプションはあらゆるところで適用されます)．
    :ref:`ghci-interactive-options` を参照してください．

    引数がなければ，プロンプトに入力される式とコマンドに適用されるオプションの集合を表示します．

..
   .. ghci-cmd:: :show bindings

       Show the bindings made at the prompt and their types.

.. ghci-cmd:: :show bindings

    プロンプトで導入した束縛とその型を表示します．

..
   .. ghci-cmd:: :show breaks

       List the active breakpoints.

.. ghci-cmd:: :show breaks

    現在有効なブレイクポイントを一覧表示します．

..
   .. ghci-cmd:: :show context

       List the active evaluations that are stopped at breakpoints.

.. ghci-cmd:: :show context

    ブレイクポイントで停止している，有効な評価の一覧を表示します．

..
   .. ghci-cmd:: :show imports

       Show the imports that are currently in force, as created by ``import`` and :ghci-cmd:`:module` commands.

.. ghci-cmd:: :show imports

    ``import`` 文や :ghci-cmd:`:module` コマンドによって作った現在な現在有効なインポートを表示します．

..
   .. ghci-cmd:: :show modules

       Show the list of modules currently loaded.

.. ghci-cmd:: :show modules

    現在ロードされているモジュールの一覧を表示する．

..
   .. ghci-cmd:: :show packages

       Show the currently active package flags, as well as the list of
       packages currently loaded.

.. ghci-cmd:: :show packages

    現在ロードされているパッケージの一覧と現在有効なパッケージフラグを表示します．

..
   .. ghci-cmd:: :show paths

       Show the current working directory (as set via :ghci-cmd:`:cd` command), as
       well as the list of directories searched for source files (as set by the
       ``-i`` option).

.. ghci-cmd:: :show paths

    ソースファイルの検索パス一覧(``-i`` オプションで指定)と現在の作業ディレクトリ(:ghci-cmd:`:cd` コマンドで設定)を表示する．

..
   .. ghci-cmd:: :show language

       Show the currently active language flags for source files.

.. ghci-cmd:: :show language

    ソースファイルに対して現在有効になっている言語フラグを表示する．

..
   .. ghci-cmd:: :showi language

       Show the currently active language flags for expressions typed at
       the prompt (see also :ghci-cmd:`:seti`).

.. ghci-cmd:: :showi language

    プロンプトで入力される式に対して現在有効になっている言語フラグを表示します
    (:ghci-cmd:`:seti` も参照してください)．

..
   .. ghci-cmd:: :show; [args|prog|prompt|editor|stop]

       Displays the specified setting (see :ghci-cmd:`:set`).

.. ghci-cmd:: :show; [args|prog|prompt|editor|stop]

    指定した設定を表示します(:ghci-cmd:`:set` 参照)．

..
   .. ghci-cmd:: :sprint; ⟨expr⟩

       Prints a value without forcing its evaluation. :ghci-cmd:`:sprint` is
       similar to :ghci-cmd:`:print`, with the difference that unevaluated subterms
       are not bound to new variables, they are simply denoted by ``_``.

.. ghci-cmd:: :sprint; ⟨expr⟩

    評価を強制せずに値を表示します．
    :ghci-cmd:`:sprint` は未評価の部分項が新しい変数に束縛せず，単に ``_`` と表す以外は，
    :ghci-cmd:`:print` と同じです．

..
   .. ghci-cmd:: :step; [⟨expr⟩]

       Enable all breakpoints and begin evaluating an expression in
       single-stepping mode. In this mode evaluation will be stopped after
       every reduction, allowing local variables to be inspected. If ⟨expr⟩
       is not given, evaluation will resume at the last breakpoint. See
       :ref:`single-stepping`.

.. ghci-cmd:: :step; [⟨expr⟩]

    すべてのブレイクポイントを有効にして，式を単一ステップモードでの評価を開始します．
    このモードでは，簡約1ステップごとに評価が停止し局所変数を確認できます．
    ⟨expr⟩ が与えなかった場合は，最後のブレイクポイントから評価を開始します．
    :ref:`single-stepping` を参照してください．

..
   .. ghci-cmd:: :steplocal

       Enable only breakpoints in the current top-level binding and resume
       evaluation at the last breakpoint.

.. ghci-cmd:: :steplocal

    現在の最上位束縛の中にあるブレイクポイントのみを有効にした状態で最後のブレイクポイントから評価を再開します．

..
   .. ghci-cmd:: :stepmodule

       Enable only breakpoints in the current module and resume evaluation
       at the last breakpoint.

.. ghci-cmd:: :stepmodule

    現在のモジュール内にあるブレイクポイントのみを有効にした状態で，最後のブレイクポイントから評価を再開します．

..
   .. ghci-cmd:: :trace; ⟨expr⟩

       Evaluates the given expression (or from the last breakpoint if no
       expression is given), and additionally logs the evaluation steps for
       later inspection using :ghci-cmd:`:history`. See :ref:`tracing`.

.. ghci-cmd:: :trace; ⟨expr⟩

    与えられた式を評価(式を与えられなかった場合は直近のブレークポイントから再開)しますが，
    後で :ghci-cmd:`:history` で観察できるように評価ステップのログを残します．
    :ref:`tracing` を参照してください．

..
   .. ghci-cmd:: :type; ⟨expression⟩

       Infers and prints the type of ⟨expression⟩, including explicit
       forall quantifiers for polymorphic types. The monomorphism
       restriction is *not* applied to the expression during type
       inference.

.. ghci-cmd:: :type; ⟨expression⟩

    ⟨expression⟩ の型を推論し表示します．
    多相型には明示的な全称量化が加えられます．	      
    推論に際して，単相制限は *適用されません* ．

..
   .. ghci-cmd:: :type-at; ⟨module⟩ ⟨line⟩ ⟨col⟩ ⟨end-line⟩ ⟨end-col⟩ [⟨name⟩]

       Reports the inferred type at the given span/position in the module, e.g.:

       .. code-block:: none

	  *X> :type-at X.hs 6 6 6 7 f
	  Int -> Int

       This command is useful when integrating GHCi with text editors and
       IDEs for providing a show-type-under-point facility.

       The last string parameter is useful for when the span is out of
       date, i.e. the file changed and the code has moved. In which case
       :ghci-cmd:`:type-at` falls back to a general :ghci-cmd:`:type` like lookup.

       The :ghci-cmd:`:type-at` command requires :ghci-cmd:`:set +c` to be set.

.. ghci-cmd:: :type-at; ⟨module⟩ ⟨line⟩ ⟨col⟩ ⟨end-line⟩ ⟨end-col⟩ [⟨name⟩]

    当該モジュール内で与えられた範囲の型の推論結果を報告表示します．

    .. code-block:: none

       *X> :type-at X.hs 6 6 6 7 f
       Int -> Int

    このコマンドはGHCiとテキストエディタあるいはIDEを統合するさいに指定場所の型を示す機能として使えます．

    最後の文字列パラメータはその範囲がすでに変更済みの場合，たとえば，ファイルが変更されコードが移動した場合に役に立ちます．
    検索と同じように :ghci-cmd:`:type-at` はより一般的な :ghci-cmd:`:type` にフォールバックします．

    :ghci-cmd:`:type-at` コマンドを使うためには :ghci-cmd:`:set +c` を設定しておく必要があります．

..
   .. ghci-cmd:: :undef; ⟨name⟩

       Undefines the user-defined command ⟨name⟩ (see :ghci-cmd:`:def` above).

.. ghci-cmd:: :undef; ⟨name⟩

    ユーザ定義のコマンド ⟨name⟩ (上述 :ghci-cmd:`:def` を参照)を未定義にします．

..
   .. ghci-cmd:: :unset; ⟨option⟩

       Unsets certain options. See :ref:`ghci-set` for a list of available
       options.

.. ghci-cmd:: :unset; ⟨option⟩

    ある種のオプションを未設定にします．利用可能なオプション一覧については :ref:`ghci-set` を参照してください．

..
   .. ghci-cmd:: :uses; ⟨module⟩ ⟨line⟩ ⟨col⟩ ⟨end-line⟩ ⟨end-col⟩ [⟨name⟩]

       Reports all module-local uses of the thing at the given position
       in the module, e.g.:

       .. code-block:: none

	  :uses GhciFind.hs 53 66 53 70 name
	  GhciFind.hs:(46,25)-(46,29)
	  GhciFind.hs:(47,37)-(47,41)
	  GhciFind.hs:(53,66)-(53,70)
	  GhciFind.hs:(57,62)-(57,66)

       This command is useful for highlighting and navigating all uses of
       an identifier in editors and IDEs.

       The :ghci-cmd:`:uses` command requires :ghci-cmd:`:set +c` to be set.

.. ghci-cmd:: :uses; ⟨module⟩ ⟨line⟩ ⟨col⟩ ⟨end-line⟩ ⟨end-col⟩ [⟨name⟩]

    指定したモジュール中の与えられた位置にあるものの当該モジュール内での使われている位置を報告します．

    .. code-block:: none

       :uses GhciFind.hs 53 66 53 70 name
       GhciFind.hs:(46,25)-(46,29)
       GhciFind.hs:(47,37)-(47,41)
       GhciFind.hs:(53,66)-(53,70)
       GhciFind.hs:(57,62)-(57,66)

    このコマンドは，エディタやIDEで指定した識別子をハイライト表示して使用場所を示すのに便利です．

    :ghci-cmd:`:uses` コマンドを使うには :ghci-cmd:`:set +c` を設定しておく必要があります．

.. ghci-cmd:: :! ⟨command⟩

    .. index::
       single: シェルコマンド; GHCiでの〜

    シェルコマンド ⟨command⟩ を実行します．


.. _ghci-set:

The ``:set`` and ``:seti`` commands
-----------------------------------

.. index::
   single: :set; command in GHCi
   single: :seti

The :ghci-cmd:`:set` command sets two types of options: GHCi options, which
begin with "``+``", and "command-line" options, which begin with "``-``".

.. note::
    At the moment, the :ghci-cmd:`:set` command doesn't support any kind of
    quoting in its arguments: quotes will not be removed and cannot be used
    to group words together. For example, ``:set -DFOO='BAR BAZ'`` will not
    do what you expect.

GHCi options
~~~~~~~~~~~~

.. index::
   single: options; GHCi

GHCi options may be set using :ghci-cmd:`:set` and unset using :ghci-cmd:`:unset`.

The available GHCi options are:

.. ghci-cmd:: :set +c

    Collect type and location information after loading modules.
    The commands :ghci-cmd:`:all-types`, :ghci-cmd:`:loc-at`,
    :ghci-cmd:`:type-at`, and :ghci-cmd:`:uses` require ``+c`` to be active.

.. ghci-cmd:: :set +m

    .. index::
       single: multiline input; in GHCi

    Enable parsing of multiline commands. A multiline command is
    prompted for when the current input line contains open layout
    contexts (see :ref:`ghci-multiline`).

.. ghci-cmd:: :set +r

    .. index::
       single: CAFs; in GHCi
       single: Constant Applicative Form

    Normally, any evaluation of top-level expressions (otherwise known
    as CAFs or Constant Applicative Forms) in loaded modules is retained
    between evaluations. Turning on ``+r`` causes all evaluation of
    top-level expressions to be discarded after each evaluation (they
    are still retained *during* a single evaluation).

    This option may help if the evaluated top-level expressions are
    consuming large amounts of space, or if you need repeatable
    performance measurements.

.. ghci-cmd:: :set +s

    Display some stats after evaluating each expression, including the
    elapsed time and number of bytes allocated. NOTE: the allocation
    figure is only accurate to the size of the storage manager's
    allocation area, because it is calculated at every GC. Hence, you
    might see values of zero if no GC has occurred.

.. ghci-cmd:: :set +t

    .. index::
       single: displaying type; in GHCi

    Display the type of each variable bound after a statement is entered
    at the prompt. If the statement is a single expression, then the
    only variable binding will be for the variable ``it``.

.. _ghci-cmd-line-options:

Setting GHC command-line options in GHCi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Normal GHC command-line options may also be set using :ghci-cmd:`:set`. For
example, to turn on :ghc-flag:`-Wmissing-signatures`, you would say:

.. code-block:: none

    Prelude> :set -Wmissing-signatures

Any GHC command-line option that is designated as dynamic (see the table
in :ref:`flag-reference`), may be set using :ghci-cmd:`:set`. To unset an
option, you can set the reverse option:

.. index::
   single: dynamic; options

.. code-block:: none

    Prelude> :set -Wno-incomplete-patterns -XNoMultiParamTypeClasses

:ref:`flag-reference` lists the reverse for each option where
applicable.

Certain static options (:ghc-flag:`-package`, :ghc-flag:`-I`, :ghc-flag:`-i`,
and :ghc-flag:`-l` in particular) will also work, but some may not take effect
until the next reload.

.. index::
   single: static; options

.. _ghci-interactive-options:

Setting options for interactive evaluation only
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHCi actually maintains *two* sets of options:

-  The *loading options* apply when loading modules

-  The *interactive options* apply when evaluating expressions and
   commands typed at the GHCi prompt.

The :ghci-cmd:`:set` command modifies both, but there is also a
:ghci-cmd:`:seti` command (for "set interactive") that affects only the
interactive options set.

It is often useful to change the interactive options, without having
that option apply to loaded modules too. For example

.. code-block:: none

    :seti -XMonoLocalBinds

It would be undesirable if :ghc-flag:`-XMonoLocalBinds` were to apply to loaded
modules too: that might cause a compilation error, but more commonly it
will cause extra recompilation, because GHC will think that it needs to
recompile the module because the flags have changed.

If you are setting language options in your ``.ghci`` file, it is good
practice to use :ghci-cmd:`:seti` rather than :ghci-cmd:`:set`, unless you
really do want them to apply to all modules you load in GHCi.

The two sets of options can be inspected using the :ghci-cmd:`:set` and
:ghci-cmd:`:seti` commands respectively, with no arguments. For example, in a
clean GHCi session we might see something like this:

.. code-block:: none

    Prelude> :seti
    base language is: Haskell2010
    with the following modifiers:
      -XNoMonomorphismRestriction
      -XNoDatatypeContexts
      -XNondecreasingIndentation
      -XExtendedDefaultRules
    GHCi-specific dynamic flag settings:
    other dynamic, non-language, flag settings:
      -fimplicit-import-qualified
    warning settings:

The two sets of options are initialised as follows. First, both sets of
options are initialised as described in :ref:`ghci-dot-files`. Then the
interactive options are modified as follows:

-  The option ``-XExtendedDefaultRules`` is enabled, in order to apply
   special defaulting rules to expressions typed at the prompt (see
   :ref:`extended-default-rules`).

-  The Monomorphism Restriction is disabled (see :ref:`monomorphism`).

.. _ghci-dot-files:

The ``.ghci`` and ``.haskeline`` files
--------------------------------------

.. _dot-ghci-files:

The ``.ghci`` files
~~~~~~~~~~~~~~~~~~~

.. index::
   single: .ghci; file
   single: startup; files, GHCi

When it starts, unless the :ghc-flag:`-ignore-dot-ghci` flag is given, GHCi
reads and executes commands from the following files, in this order, if
they exist:

1. :file:`./.ghci`

2. :file:`{appdata}/ghc/ghci.conf`, where ⟨appdata⟩ depends on your system,
   but is usually something like
   :file:`C:/Documents and Settings/user/Application Data`

3. On Unix: :file:`$HOME/.ghc/ghci.conf`

4. :file:`$HOME/.ghci`

The :file:`ghci.conf` file is most useful for turning on favourite options
(e.g. ``:set +s``), and defining useful macros.

.. note::
    When setting language options in this file it is usually desirable to use
    :ghci-cmd:`:seti` rather than :ghci-cmd:`:set` (see :ref:`ghci-interactive-options`).

Placing a :file:`.ghci` file in a directory with a Haskell project is a
useful way to set certain project-wide options so you don't have to type
them every time you start GHCi: eg. if your project uses multi-parameter
type classes, scoped type variables, and CPP, and has source files in
three subdirectories A, B and C, you might put the following lines in
:file:`.ghci`:

.. code-block:: none

    :set -XMultiParamTypeClasses -XScopedTypeVariables -cpp
    :set -iA:B:C

(Note that strictly speaking the :ghc-flag:`-i` flag is a static one, but in
fact it works to set it using :ghci-cmd:`:set` like this. The changes won't take
effect until the next :ghci-cmd:`:load`, though.)

Once you have a library of GHCi macros, you may want to source them from
separate files, or you may want to source your ``.ghci`` file into your
running GHCi session while debugging it

.. code-block:: none

    :def source readFile

With this macro defined in your ``.ghci`` file, you can use
``:source file`` to read GHCi commands from ``file``. You can find (and
contribute!-) other suggestions for ``.ghci`` files on this Haskell wiki
page: `GHC/GHCi <http://haskell.org/haskellwiki/GHC/GHCi>`__

Additionally, any files specified with :ghc-flag:`-ghci-script` flags will be
read after the standard files, allowing the use of custom .ghci files.

Two command-line options control whether the startup files files are
read:

.. ghc-flag:: -ignore-dot-ghci

    Don't read either :file:`./.ghci` or the other startup files when
    starting up.

.. ghc-flag:: -ghci-script

    Read a specific file after the usual startup files. Maybe be
    specified repeatedly for multiple inputs.

When defining GHCi macros, there is some important behavior you should
be aware of when names may conflict with built-in commands, especially
regarding tab completion.

For example, consider if you had a macro named ``:time`` and in the
shell, typed ``:t 3`` — what should happen? The current algorithm we use
for completing commands is:

1. First, look up an exact match on the name from the defined macros.

2. Look for the exact match on the name in the built-in command list.

3. Do a prefix lookup on the list of built-in commands - if a built-in
   command matches, but a macro is defined with the same name as the
   built-in defined, pick the macro.

4. Do a prefix lookup on the list of built-in commands.

5. Do a prefix lookup on the list of defined macros.

Here are some examples:

1. You have a macro ``:time`` and enter ``:t 3``

   You get ``:type 3``

2. You have a macro ``:type`` and enter ``:t 3``

   You get ``:type 3`` with your defined macro, not the builtin.

3. You have a macro ``:time`` and a macro ``:type``, and enter ``:t 3``

   You get ``:type 3`` with your defined macro.

.. _dot-haskeline-file:

The ``.haskeline`` file
~~~~~~~~~~~~~~~~~~~~~~~

.. index::
   single: .haskeline; file
   single: startup; files, GHCi

GHCi uses `Haskeline <https://hackage.haskell.org/package/haskeline>`__ under
the hood. You can configure it to, among other
things, prune duplicates from GHCi history. See:
`Haskeline user preferences <http://trac.haskell.org/haskeline/wiki/UserPrefs>`__.

.. _ghci-obj:

Compiling to object code inside GHCi
------------------------------------

By default, GHCi compiles Haskell source code into byte-code that is
interpreted by the runtime system. GHCi can also compile Haskell code to
object code: to turn on this feature, use the :ghc-flag:`-fobject-code` flag
either on the command line or with :ghci-cmd:`:set` (the option :ghc-flag:`-fbyte-code`
restores byte-code compilation again). Compiling to object code takes
longer, but typically the code will execute 10-20 times faster than
byte-code.

Compiling to object code inside GHCi is particularly useful if you are
developing a compiled application, because the :ghci-cmd:`:reload` command
typically runs much faster than restarting GHC with :ghc-flag:`--make` from the
command-line, because all the interface files are already cached in
memory.

There are disadvantages to compiling to object-code: you can't set
breakpoints in object-code modules, for example. Only the exports of an
object-code module will be visible in GHCi, rather than all top-level
bindings as in interpreted modules.

.. _external-interpreter:

Running the interpreter in a separate process
---------------------------------------------

Normally GHCi runs the interpreted code in the same process as GHC
itself, on top of the same RTS and sharing the same heap.  However, if
the flag :ghc-flag:`-fexternal-interpreter` is given, then GHC will spawn a
separate process for running interpreted code, and communicate with it
using messages over a pipe.

.. ghc-flag:: -fexternal-interpreter

    :since: 8.0.1

    Run interpreted code (for GHCi, Template Haskell, Quasi-quoting,
    or Annotations) in a separate process.  The interpreter will run
    in profiling mode if :ghc-flag:`-prof` is in effect, and in
    dynamically-linked mode if :ghc-flag:`-dynamic` is in effect.

    There are a couple of caveats that will hopefully be removed in
    the future: this option is currently not implemented on Windows
    (it is a no-op), and the external interpreter does not support the
    GHCi debugger, so breakpoints and single-stepping don't work with
    :ghc-flag:`-fexternal-interpreter`.

    See also the :ghc-flag:`-pgmi` (:ref:`replacing-phases`) and :ghc-flag:`-opti`
    (:ref:`forcing-options-through`) flags.

Why might we want to do this?  The main reason is that the RTS running
the interpreted code can be a different flavour (profiling or
dynamically-linked) from GHC itself.  So for example:

- We can use the profiler to collect stack traces when using GHCi (see
  :ref:`ghci-stack-traces`).

- When compiling Template Haskell code with :ghc-flag:`-prof` we don't need to
  compile the modules without :ghc-flag:`-prof` first (see :ref:`th-profiling`)
  because we can run the profiled object code in the interpreter.

This feature is experimental in GHC 8.0.x, but it may become the
default in future releases.

.. _ghci-faq:

FAQ and Things To Watch Out For
-------------------------------

The interpreter can't load modules with foreign export declarations!
    Unfortunately not. We haven't implemented it yet. Please compile any
    offending modules by hand before loading them into GHCi.

:ghc-flag:`-O` doesn't work with GHCi!

    .. index::
       single: optimization; and GHCi

    For technical reasons, the bytecode compiler doesn't interact well
    with one of the optimisation passes, so we have disabled
    optimisation when using the interpreter. This isn't a great loss:
    you'll get a much bigger win by compiling the bits of your code that
    need to go fast, rather than interpreting them with optimisation
    turned on.

Unboxed tuples don't work with GHCi
    That's right. You can always compile a module that uses unboxed
    tuples and load it into GHCi, however. (Incidentally the previous
    point, namely that :ghc-flag:`-O` is incompatible with GHCi, is because the
    bytecode compiler can't deal with unboxed tuples).

Concurrent threads don't carry on running when GHCi is waiting for input.
    This should work, as long as your GHCi was built with the
    :ghc-flag:`-threaded` switch, which is the default. Consult whoever supplied
    your GHCi installation.


After using ``getContents``, I can't use ``stdin``, until I do ``:load`` or ``:reload``
    This is the defined behaviour of ``getContents``: it puts the stdin
    Handle in a state known as semi-closed, wherein any further I/O
    operations on it are forbidden. Because I/O state is retained
    between computations, the semi-closed state persists until the next
    :ghci-cmd:`:load` or :ghci-cmd:`:reload` command.

    You can make ``stdin`` reset itself after every evaluation by giving
    GHCi the command ``:set +r``. This works because ``stdin`` is just a
    top-level expression that can be reverted to its unevaluated state
    in the same way as any other top-level expression (CAF).

I can't use :kbd:`Control-C` to interrupt computations in GHCi on Windows.
    See :ref:`ghci-windows`.

The default buffering mode is different in GHCi to GHC.
    In GHC, the stdout handle is line-buffered by default. However, in
    GHCi we turn off the buffering on stdout, because this is normally
    what you want in an interpreter: output appears as it is generated.

    If you want line-buffered behaviour, as in GHC, you can start your
    program thus: ::

        main = do { hSetBuffering stdout LineBuffering; ... }


.. [5]
   Note that packages only contain compiled code, so debugging a package
   requires finding its source and loading that directly.

.. [6]
   We originally provided bindings for all variables in scope, rather
   than just the free variables of the expression, but found that this
   affected performance considerably, hence the current restriction to
   just the free variables.
