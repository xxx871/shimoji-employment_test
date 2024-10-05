## 設問

`ed25519` 形式の `GPGキー` を作成するマニュアルを `manual` ディレクトリに `Markdown` 文書として格納してください。

## 回答

### 1. 準備

1. `GPG (GnuPG)` がインストールされていることを確認してください。

    ```
    gpg --version
    ```

  - インストールされていない場合は [GNU Privacy Guard](https://www.gnupg.org/download/) よりインストールするなど、OSに合わせて対応してください。

    注：今回は `ed25519形式` のキーを作成するため、最新バージョン(2.1.17以降)をインストールしてください。

2. WindowsではGit Bashを、macOS/Linuxではターミナルを起動します。

### 2. プライマリーキーの生成

1. 以下のコマンドを入力してキー生成プロセスを開始します：

    ```
    gpg  --expert --full-gen-key   
    ```

2. 例のようにキーの種類を選択するプロンプトが表示されたら、`9` を入力し、`ECC and ECC` を選択します。

    ```
    Please select what kind of key you want:
    (1) RSA and RSA (default)
    (2) DSA and Elgamal
    (3) DSA (sign only)
    (4) RSA (sign only)
    (7) DSA (set your own capabilities)
    (8) RSA (set your own capabilities)
    (9) ECC and ECC
    (10) ECC (sign only)
    (11) ECC (set your own capabilities)
    (13) Existing key
    (14) Existing key from card
    Your selection?
    ```

    `ECC and ECC` オプションを選択することで`ed25519` 形式を指定でき、署名(Sign)機能と証明(Certify)機能が有効になります。

3. 例のように楕円曲線の種類を選択するプロンプトが表示されたら、`1` を入力し、`Curve 25519` を選択します。

    ```
    Please select which elliptic curve you want:
    (1) Curve 25519
    (3) NIST P-256
    (4) NIST P-384
    (5) NIST P-521
    (6) Brainpool P-256
    (7) Brainpool P-384
    (8) Brainpool P-512
    (9) secp256k1
    ```

     `Curve 25519` は実装が比較的容易かつ高速で安全な楕円曲線暗号(ECC)の楕円曲線の1つであり、今回はこれを選択します。

4. キーの有効期限を設定します。無期限にする場合は `0` を入力します。

    ```
    Please specify how long the key should be valid.
        0 = key does not expire
        <n>  = key expires in n days
        <n>w = key expires in n weeks
        <n>m = key expires in n months
        <n>y = key expires in n years
    Key is valid for? (0) 
    ```

5. 設定を確認するプロンプトが表示されたら、`y` を入力して確認します。

    ```
    Key does not expire at all
    Is this correct? (y/N) y
    ```

6. 名前、メールアドレス、コメント（オプション）を入力します。

    ```
    GnuPG needs to construct a user ID to identify your key.

    Real name: (本名が推奨されます)
    Email address: (GitHubに登録されているメールアドレスを入力してください)
    Comment:(任意)
    ```

7. 入力した情報を確認し、問題なければ `O`（大文字のオー）を入力して確定します。

    ```
    Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? o
    ```

8. `pinentry` が起動してパスフレーズを聞かれるので2回パスフレーズを入力してください。これは重要なセキュリティ要素なので、十分に強力なものを選んでください。

    これでプライマリーキーが生成されます。

### サブキーの生成

この段階だと署名用のサブキーが無いので、先程の鍵を指定してサブキーを追加していきます。

1. 下記のコマンドを実行してシークレットキーIDを確認します。

    ```
    gpg --list-secret-keys --keyid-format=long
    ```

2. 実行すると下記のように表示されるので、GPGキーIDをコピーします。(例では`3AA5C34371567BD2`になります。)

    ```
    $ gpg --list-secret-keys --keyid-format=long
    /Users/hubot/.gnupg/secring.gpg
    ------------------------------------
    sec   ed25519/3AA5C34371567BD2 2016-03-10 [SC]
    uid                          Hubot <hubot@example.com>
    ssb   cv25519/4BB6D45482678BE3 2016-03-10 [E]
    ```

    今後GPGキーのIDは`3AA5C34371567BD2`と仮定します。

3. このGPGキーに対して次のコマンドを実行します。

    ```
    gpg --expert --edit-key 3AA5C34371567BD2
    ```

4. `gpg >` と表示されるので、例のようにコマンドを入力。

   ```
   gpg> addkey
   ```

5. 例のようにキーの種類を選択するプロンプトが表示されるので、今回は署名機能のみ必要なので、`10` を入力し、`ECC (sign only)` を選択します。

    ```
    Please select what kind of key you want:
        (3) DSA (sign only)
        (4) RSA (sign only)
        (5) Elgamal (encrypt only)
        (6) RSA (encrypt only)
        (7) DSA (set your own capabilities)
        (8) RSA (set your own capabilities)
        (10) ECC (sign only)
        (11) ECC (set your own capabilities)
        (12) ECC (encrypt only)
        (13) Existing key
        (14) Existing key from card
    Your selection?
    ```

6. 以降はプライマリーキーの生成と同じ手順になります。パスフレーズを入力してサブキーの生成が確認できたら、次のコマンドを実行して保存してください。

    ```
    gpg> save
    ```

以上で署名機能をもったプライマリーキー、サブキーを作成することができました。

### 注意事項

- パスフレーズを安全に保管してください。
- 公開鍵は自由に共有できますが、秘密鍵は決して共有しないでください。

### 参考URL

[GitHub Docs (新しい GPG キーを生成する)](https://docs.github.com/ja/authentication/managing-commit-signature-verification/generating-a-new-gpg-key?platform=windows)

[Qiita (GitHub のGPG署名を EdDSA にしてみる)](https://qiita.com/nothink/items/4d969dc00eae7cad81ed)