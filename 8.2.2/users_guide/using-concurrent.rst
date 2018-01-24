..
   .. _using-concurrent:

   Using Concurrent Haskell
   ------------------------

   .. index::
      single: Concurrent Haskell; using

.. _using-concurrent:

Concurrent Haskell を使う
-------------------------

.. index::
   single: Concurrent Haskell; 〜を使う

..
   GHC supports Concurrent Haskell by default, without requiring a special
   option or libraries compiled in a certain way. To get access to the
   support libraries for Concurrent Haskell, just import
   :base-ref:`Control.Concurrent <Control-Concurrent.html>`.
   More information on Concurrent Haskell is provided in the documentation
   for that module.

GHC は特別なオプションや専用にコンパイルしたライブラリなしのデフォルトで Concurrent Haskell をサポートしています．
Concurrent Haskellのサポートライブラリにアクセスするには単に
:base-ref:`Control.Concurrent <Control-Concurrent.html>`
をインポートすればよいだけです．
Concurrent Haskell に関する情報については，このモジュールの文書が提供しています．

..
   Optionally, the program may be linked with the :ghc-flag:`-threaded` option (sea :ref:`options-linker`).
   This provides two benefits:

   - It enables the :rts-flag:`-N ⟨x⟩` to be used, which allows threads to run in
     parallelism on a multi-processor or multi-core machine. See :ref:`using-smp`.

   - If a thread makes a foreign call (and the call is not marked
     ``unsafe``), then other Haskell threads in the program will continue
     to run while the foreign call is in progress. Additionally,
     ``foreign export``\ ed Haskell functions may be called from multiple
     OS threads simultaneously. See :ref:`ffi-threads`.

任意選択で，プログラムを :ghc-flag:`-threaded` オプション(:ref:`options-linker` 参照)でリンクできます．
これには2つの利点があります．

- :rts-flag:`-N ⟨x⟩` を使って，スレッドをマルチプロセッサあるいマルチコアの計算機で動かせます．
  :ref:`using-smp` を参照してください．

- あるスレッドが外部呼び出しを行うと(その呼び出しに ``unsafe`` が付いていなければ)，
  その外部呼び出し中にプログラム中の他のHaskellスレッドが走り続けます．
  さらに ``foreign export`` された Haskell の関数が複数のOSスレッドから同時に呼ばれてもよい．
  :ref:`ffi-threads` を参照

..
   The following RTS option(s) affect the behaviour of Concurrent Haskell
   programs:

   .. index::
      single: RTS options; concurrent

   .. rts-flag:: -C ⟨s⟩

       :default: 20 milliseconds

       Sets the context switch interval to ⟨s⟩ seconds.
       A context switch will occur at the next heap block allocation after
       the timer expires (a heap block allocation occurs every 4k of
       allocation). With ``-C0`` or ``-C``, context switches will occur as
       often as possible (at every heap block allocation).

以下の RTS オプションが Concurrent Haskell プログラムの振舞いに影響します．

.. index::
   single: RTS オプション; 並行の〜

.. rts-flag:: -C ⟨s⟩

    :default: 20 ミリ秒

    コンテキストスイッチの間隔を ⟨s⟩ 秒に設定する．
    コンテキストスイッチは，時間切れの後の最初のヒープブロック確保の際に発生します．
    (ヒープブロックの確保は確保4k毎に発生します．)
    ``-C0`` または ``-C`` を使うと，コンテキストスイッチは可能なかぎり頻繁に起こります
    (ヒープブロック確保毎になります)．

..
   .. _using-smp:

   Using SMP parallelism
   ---------------------

   .. index::
      single: parallelism
      single: SMP

.. _using-smp:

SMP 並列を使う
--------------

.. index::
   single: 並列
   single: SMP〜

..
   GHC supports running Haskell programs in parallel on an SMP (symmetric
   multiprocessor).

GHC はSMP(対称マルチプロセッサ)上でHaskellプログラムが並列に走るのをサポートしています．

..
   There's a fine distinction between *concurrency* and *parallelism*:
   parallelism is all about making your program run *faster* by making use
   of multiple processors simultaneously. Concurrency, on the other hand,
   is a means of abstraction: it is a convenient way to structure a program
   that must respond to multiple asynchronous events.

*並行性* と *並列性* の間には細かい違いがあります．
並列性とは，複数のプロセッサーを同時に使用することで，プログラムの実行速度を向上させることです．
一方，並行処理は抽象化の手段であり，複数の非同期イベントに応答する必要があるプログラムを構造化する便利な方法です．

しかし，この2つの用語は確かに関連しています．
複数のCPUを使用することにより，並行スレッドを並列で実行することが可能になります．
これは，まさにGHCのSMP並列処理のサポートと同じです．
しかし，並行性を使用しないプログラムでは，並列性を使用してパフォーマンスを向上させることも可能です．
このセクションでは，GHCを使用して並列プログラムをコンパイルおよび実行する方法について説明します．
:ref:`lang-parallel` では並列性に影響を与える言語機能について説明します．

..
   .. _parallel-compile-options:

   Compile-time options for SMP parallelism
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _parallel-compile-options:

SMP 並列のためのコンパイルオプション
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   In order to make use of multiple CPUs, your program must be linked with
   the :ghc-flag:`-threaded` option (see :ref:`options-linker`). Additionally, the
   following compiler options affect parallelism:

複数のCPUを使うためには，プログラムは :ghc-flag:`-threaded` オプション(:ref:`options-linker` 参照)で
リンクしなければなりません．
さらに，次のコンパイルオプションが並列性に影響します．

..
   .. ghc-flag:: -feager-blackholing

       Blackholing is the act of marking a thunk (lazy computation) as
       being under evaluation. It is useful for three reasons: firstly it
       lets us detect certain kinds of infinite loop (the
       ``NonTermination`` exception), secondly it avoids certain kinds of
       space leak, and thirdly it avoids repeating a computation in a
       parallel program, because we can tell when a computation is already
       in progress.

       The option :ghc-flag:`-feager-blackholing` causes each thunk to be
       blackholed as soon as evaluation begins. The default is "lazy
       blackholing", whereby thunks are only marked as being under
       evaluation when a thread is paused for some reason. Lazy blackholing
       is typically more efficient (by 1-2% or so), because most thunks
       don't need to be blackholed. However, eager blackholing can avoid
       more repeated computation in a parallel program, and this often
       turns out to be important for parallelism.

       We recommend compiling any code that is intended to be run in
       parallel with the :ghc-flag:`-feager-blackholing` flag.

.. ghc-flag:: -feager-blackholing

    ブラックホール化は，評価中のサンク（遅延計算）をマークする行為です．
    第1にある種の無限ループ(``NonTermination`` 例外)を検出させ，
    第2にある種の空間リークを回避し，
    第3に並列プログラムで計算の反復を避けられます．
    計算が進行中であるタイミングを教えられるからです．

    :ghc-flag:`-feager-blackholing` オプションは，評価が始まるとすぐに，各サンクをブラックホール化します．
    デフォルトでは，「遅延ブラックホール化」で，スレッドが何らかの理由で一時停止している場合に，
    評価中のサンクであることを示すマークだけを付けます．
    遅延ブラックホール化は通常より効率的(およぼ1-2%程度)です．
    ほとんどのサンクはブラックホール化の必要がないからです．
    しかし，先行ブラックホール化を使えば，並列プログラム中の何度も行われる計算を避けることができます．
    そして多くの場合並列性にとって重要であることが判ります．

    並列に走らせたいコードはどれも :ghc-flag:`-feager-blackholing` フラグを付けてコンパイルすることを推奨します．

..
   .. _parallel-options:

   RTS options for SMP parallelism
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   There are two ways to run a program on multiple processors: call
   :base-ref:`Control.Concurrent.setNumCapabilities
   <Control.Concurrent.html#v:setNumCapabilities>` from your program, or
   use the RTS :rts-flag:`-N ⟨x⟩` options.

.. _parallel-options:

SMP 並列のための RTS オプション
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

マルチプロセッサ上でプログラムを走らせる方法は2とおりあります．
プログラムから :base-ref:`Control.Concurrent.setNumCapabilities
<Control.Concurrent.html#v:setNumCapabilities>` を呼ぶ方法と，
RTSオプション :rts-flag:`-N ⟨x⟩` を使う方法です．

..
   .. rts-flag:: -N ⟨x⟩
		 -maxN ⟨x⟩

       Use ⟨x⟩ simultaneous threads when running the program.

       The runtime manages a set of virtual processors, which we call
       *capabilities*, the number of which is determined by the ``-N``
       option. Each capability can run one Haskell thread at a time, so the
       number of capabilities is equal to the number of Haskell threads
       that can run physically in parallel. A capability is animated by one
       or more OS threads; the runtime manages a pool of OS threads for
       each capability, so that if a Haskell thread makes a foreign call
       (see :ref:`ffi-threads`) another OS thread can take over that
       capability.

       Normally ⟨x⟩ should be chosen to match the number of CPU cores on
       the machine [1]_. For example, on a dual-core machine we would
       probably use ``+RTS -N2 -RTS``.

       Omitting ⟨x⟩, i.e. ``+RTS -N -RTS``, lets the runtime choose the
       value of ⟨x⟩ itself based on how many processors are in your
       machine.

       With ``-maxN⟨x⟩``, i.e. ``+RTS -maxN3 -RTS``, the runtime will choose
       at most (x), also limited by the number of processors on the system.
       Omitting (x) is an error, if you need a default use option ``-N``.

       Be careful when using all the processors in your machine: if some of
       your processors are in use by other programs, this can actually harm
       performance rather than improve it. Asking GHC to create more capabilities
       than you have physical threads is almost always a bad idea.

       Setting ``-N`` also has the effect of enabling the parallel garbage
       collector (see :ref:`rts-options-gc`).

       The current value of the ``-N`` option is available to the Haskell
       program via ``Control.Concurrent.getNumCapabilities``, and it may be
       changed while the program is running by calling
       ``Control.Concurrent.setNumCapabilities``.

.. rts-flag:: -N ⟨x⟩
              -maxN ⟨x⟩

    プログラムを走らせる際， ⟨x⟩本のスレッドを同時に使います．

    実行時システムは仮想プロセッサ一式を管理します．
    *ケーパビリティ* と呼ぶ仮想プロセッサの数は ``-N`` オプションで指定します．
    各ケーパビリティは一度に1つのHaskellスレッドを走らせられます．
    したがって，ケーパビリティ数は物理的に並列に走れるHaskellスレッドの数と等しくなります．
    1つのケーパビリティは1つ以上のOSスレッドによって起動されます．
    実行時システムは各ケーパビリティに対応するOSスレッドプールを管理します．
    Haskellスレッドが外部呼び出し(:ref:`ffi-threads` 参照)をすると，
    別のOSスレッドがこのケーパビリティを引き継げるようになっています．

    通常⟨x⟩はマシン上のCPUコアの数と一致させるべきです [1]_ ．
    たとえば，デュアルコアマシンであれば ``+RTS -N2 -RTS`` を使うことになるでしょう．

    ⟨x⟩を省略して ``+RTS -N -RTS`` のように書くと，実行時システムがマシン上のプロセッサ数にもとづいて⟨x⟩の値を決めます．

    ``-maxN ⟨x⟩`` を使って ``+RTS -maxN3 -RTS`` のように書くと，実行時システムは
    高々⟨x⟩の値に決めることになります．この値の上限はシステム上のプロセッサ数です．
    ⟨x⟩を省略するとエラーになります．デフォルトでの値が必要なら ``-N`` オプションを使って下さい．

    マシン内のすべてのプロセッサを使用する場合は注意が必要です．
    一部のプロセッサが他のプログラムで使用されている場合，パフォーマンスは向上せず，パフォーマンスに悪影響を与えます．
    どのような場合でも，GHCに物理スレッドよりも多くのケーパビリティを作成させるのは良くない考えです．

    ``-N`` を設定すると，並列ガーベッジコレクタ(:ref:`rts-options-gc` 参照)も有効になります．

    現在の ``-N`` オプションの値は，Haskellのプログラム内から，
    ``Control.Concurrent.getNumCapabilities`` を通じて利用可能で ``Control.Concurrent.setNumCapabilities``
    を呼べば，プログラムを走らせながら変更することも可能です．

..
   The following options affect the way the runtime schedules threads on
   CPUs:

以下のオプションを指定すると実行時システムがCPUにスレッドを割り振る方法に影響を与えられます．

..
   .. rts-flag:: -qa

       Use the OS's affinity facilities to try to pin OS threads to CPU
       cores.

       When this option is enabled, the OS threads for a capability :math:`i` are
       bound to the CPU core :math:`i` using the API provided by the OS for setting
       thread affinity. e.g. on Linux GHC uses ``sched_setaffinity()``.

       Depending on your workload and the other activity on the machine,
       this may or may not result in a performance improvement. We
       recommend trying it out and measuring the difference．

.. rts-flag:: -qa

    OS アフィニティ機能を使って OS スレッドを CPUコアにピン留めします．

    このオプションが有効なら，ケーパビリティ :math:`i` に対応する OS のスレッドは
    OS が適用する API でスレッドアフィニティ(Linunx 用の GHC なら ``sched_setaffinity()`` を使って)を設定すれば，
    CPUのコア :math:`i` に束縛できます．
    
    ワークロードやマシン上の他のアクティビティーによって，パフォーマンスが向上する場合もあれば，
    そうでない場合もあります．実際に試して、違いを測定することをお勧めします．

..
   .. rts-flag:: -qm

       Disable automatic migration for load balancing. Normally the runtime
       will automatically try to schedule threads across the available CPUs
       to make use of idle CPUs; this option disables that behaviour. Note
       that migration only applies to threads; sparks created by ``par``
       are load-balanced separately by work-stealing.

       This option is probably only of use for concurrent programs that
       explicitly schedule threads onto CPUs with
       :base-ref:`Control.Concurrent.forkOn <Control-Concurrent.html#v:forkOn>`.

.. rts-flag:: -qm

    負荷分散のための自動マイグレーションを無効にします．
    通常実行時システムは，ひまなCPUを活用するためにCPUをまたいでスレッドをスケジュールしようとします．
    このオプションはこの振る舞いを無効にします．
    マイグレーションはスレッドにしか適用されないことに注意してください．
    ``par`` によって作られたスパークは，別途 work-stealing で負荷分散されます．

    このオプションが役に立つのは，並行プログラムで
    :base-ref:`Control.Concurrent.forkOn <Control-Concurrent.html#v:forkOn>` を使ってスレッドを
    明示的にCPUにスケジュールする場合だけでしょう．

..
   Hints for using SMP parallelism
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SMP 並列を使うためのヒント
~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   Add the :rts-flag:`-s [⟨file⟩]` RTS option when running the program to see
   timing stats, which will help to tell you whether your program got faster by
   using more CPUs or not. If the user time is greater than the elapsed time, then
   the program used more than one CPU. You should also run the program without
   :rts-flag:`-N ⟨x⟩` for comparison.

プログラムの実行時に :rts-flag:`-s [⟨file⟩]` という RTS オプションを付けると，
時間統計情報を見られます．これを使えば，使用するCPU数を増やしたことでプログラムが速くなったかを確認できます．
ユーザ(user)時間が消費時間(elapsed)時間よりも大きいなら，プログラムは複数のCPUを使ったことになります．
比較のために :rts-flag:`-N ⟨x⟩` なしでプログラムを走らせてみるのもよいでしょう．

..
   The output of ``+RTS -s`` tells you how many "sparks" were created and
   executed during the run of the program (see :ref:`rts-options-gc`),
   which will give you an idea how well your ``par`` annotations are
   working.

``+RTS -s`` による出力を見れば，プログラム実行中にいくつの「スパーク」(sparks)が作られ，実行されたかが判ります
(:ref:`rts-options-gc` 参照)．
そうすれば ``par`` がどの程度うまく働らいているかの感触が得られることでしょう．

..
   GHC's parallelism support has improved in 6.12.1 as a result of much
   experimentation and tuning in the runtime system. We'd still be
   interested to hear how well it works for you, and we're also interested
   in collecting parallel programs to add to our benchmarking suite.

多くの実験と実行時システムのチューニングにより，GHC の並列性サポートは 6.12.1 で改善されました．
この機能がどの程度上手くいっているかについては引き続き，教えていただきたいと思います．
また，ベンチマーク用の並列プログラムも集めたいと考えています．

..
   .. [1] Whether hyperthreading cores should be counted or not is an open
	  question; please feel free to experiment and let us know what results you
	  find.

.. [1] Whether hyperthreading cores should be counted or not is an open
       question; please feel free to experiment and let us know what results you
       find.
