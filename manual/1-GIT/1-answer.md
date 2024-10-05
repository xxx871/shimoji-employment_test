## 設問

`ed25519` 形式の`sshキー` を作成するマニュアルを `manual` ディレクトリに `Markdown` 文章として格納してください。

## 回答

### 1. ターミナルを開く

  - WindowsではGit Bashを、macOS/Linuxではターミナルを起動します。

### 2. キーの生成

  - 以下のコマンドを入力して実行します。

    注：`your_email@example.com` の部分は `GitHub` で登録されているあなたのメールアドレスに置き換えてください。

    ```
    ssh-keygen -t ed25519 -C "your_email@example.com"
    ```

    - `-t` は生成する鍵のタイプを指定します。
    - `-C` は鍵に付けるコメントを指定します。コメントは通常、鍵の所有者を識別するために使用され、基本的にメールアドレスが使用されます。

### 3. 保存場所の指定

  - コマンドを実行するとキーを保存するファイルを指定します。必要に応じて変更できますが、デフォルトの場所（通常は` ~/.ssh/id_ed25519` ）でよければ、そのままEnterキーを押します。

  - 実行例：

    ```
    >> ssh-keygen -t ed25519 -C "example@example.com"
    Generating public/private ed25519 key pair.
    Enter file in which to save the key (/home/example/.ssh/id_ed25519): 
    ```

### 4. パスフレーズの設定

  - セキュリティを高めるために、パスフレーズの入力を求められます。必須ではありませんが、セキュリティ上パスフレーズは追加することを推奨します。

    ```
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    ```

### 5. キーの確認

  - 生成されたキーを確認します。

    ```
    ls ~/.ssh/id_ed25519*
    ```

    id_ed25519（秘密キー）と id_ed25519.pub（公開キー）の2つのファイルが表示されるはずです。

### 注意事項

- 秘密キー（id_ed25519）は絶対に他人と共有しないでください。
- 公開キー（id_ed25519.pub）のみを共有または登録してください。
- キーを使用するたびにパスフレーズを入力したくない場合は、`sshキー`を管理しパスフレーズを記憶できる`sshエージェント` にキーを追加する必要があります。

### 参考URL

[GitHub Docs (新しい SSH キーを生成して ssh-agent に追加する)](https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)