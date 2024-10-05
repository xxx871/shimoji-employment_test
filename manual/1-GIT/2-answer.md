## 設問

`git-flow` のローカル設定を行うマニュアルを `manual` ディレクトリに `Markdown` 文書として格納してください。

## 回答

### 1. `git-flow` のインストール

  - `git-flow` をインストールします。

    - macOS (Homebrew使用)

      ```
      brew install git-flow
      ```

    - Linux (Ubuntu/Debian)

      ```
      sudo apt-get install git-flow
      ```

    - Windowsでは、 `Git for Windows` をインストールすると、 `git-flow` も一緒にインストールされます。

### 2. プロジェクトの初期化

  - ターミナルを開き、Gitリポジトリのルートディレクトリに移動します。

  - 以下のコマンドを実行してGit-flowを初期化します：

    ```
    $ git flow init
    ```

### 3. ブランチ名の設定

  - 各ブランチの名前を設定するよう求められます。デフォルト値を使用する場合は、各質問でEnterキーを押します。

  - 実行例：

    ```
    >> git flow init
    Initialized empty Git repository in (現在のディレクトリ)/.git/
    No branches exist yet. Base branches must be created now.
    Branch name for production releases: [master] 
    Branch name for "next release" development: [develop] 
    How to name your supporting branch prefixes?
    Feature branches? [feature/] 
    Bugfix branches? [bugfix/] 
    Release branches? [release/] 
    Hotfix branches? [hotfix/] 
    Support branches? [support/] 
    Version tag prefix? [] 
    Hooks and filters directory? [(現在のディレクトリ)/.git/hooks] 
    ```

  - 各項目の説明：

    |項目|設定値|説明|
    |-------------|------------|------------|
    |Branch name for production releases|main|本番環境用のメインブランチ名|
    |Branch name for "next release" development|develop|開発用のブランチ名|
    |Feature branches?|feature/|新機能開発用のブランチのプレフィックス|
    |Bugfix branches?|bugfix/|バグ修正用のブランチのプレフィックス|
    |Release branches?|release/|リリース準備用のブランチのプレフィックス|
    |Hotfix branches?|hotfix/|緊急のバグ修正用のブランチのプレフィックス|
    |Support branches?|support/|古いバージョンのサポート用のブランチのプレフィックス|
    |Version tag prefix?|(空白のまま)|バージョンタグのプレフィックス|
    |Hooks and filters directory?|[cd]/.git/hooks|Gitのフックスクリプトが格納されるディレクトリ|

    必要に応じて、これらの名前をカスタマイズできます。

### 4. `git-flow` の使用

  - これで `git-flow` を使用する準備が整いました。新しい機能の開発を始めるには `git flow feature start 新機能名`、開発が完了したら、 `git flow feature finish 新機能名` などのコマンドを使用し、`git-flow` を使用していきます。

