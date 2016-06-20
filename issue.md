# emacs周りでやりたいこと

## 欲しいコマンド
- git add push add issueを自動化（コマンド一発でやりたい）or saveしたらpushするとか

- keychord周り見直す、普通に英語２つは辛い

- helm-M-xで[]とか記号系入力すると死ぬ

- sqlまわりなんとかしたい

- helm-all-swoopとかでtagファイルとか省きたい

- カーソル上・下の段落前削除

- 一気にsave-pointまでundo/redoする

- yank-popをいい感じに。前後2,3個のkill-ringを素早く表示させたい。ポインタだけ移動させるイメージ。https://www.emacswiki.org/emacs/download/browse-kill-ring.el

- やっぱC-1とかの挙動微妙。前のコピーを引き継ぎたい

- C-tしたときにsmartrepとかで二回目にjkhl押したらその方向に進みたい



## 気になったelisp
- aggressive-indent





## その他
- 選択範囲、カーソル行の数字を全部インクリメントする
(defun cua-incr-rectangle (increment)
  "Increment each line of CUA rectangle by prefix amount."
  (interactive "p")
  (cua--rectangle-operation 'keep nil t 1 nil
     (lambda (_s e _l _r)
        (cond
         ((re-search-forward "0x\\([0-9a-fA-F]+\\)" e t)
          (let* ((txt (cua--filter-buffer-noprops (match-beginning 1) (match-end 1)))
                 (n (string-to-number txt 16))
                 (fmt (format "0x%%0%dx" (length txt))))
            (replace-match (format fmt (+ n increment)))))
         ((re-search-forward "\\( *-?[0-9]+\\)" e t)
          (let* ((txt (cua--filter-buffer-noprops (match-beginning 1) (match-end 1)))
                 (prefix (if (= (aref txt 0) ?0) "0" ""))
                 (n (string-to-number txt 10))
                 (fmt (format "%%%s%dd" prefix (length txt))))
            (replace-match (format fmt (+ n increment)))))
 http://d.hatena.ne.jp/yuto_sasaki/20120310/1331362118


### Git
- (depends-on "magit")
現在のリポジトリの状態が表示されるので、とりあえず?を押して説明を出してみましょう。
http://qiita.com/takc923/items/c7a11ff30caedc4c5ba7

- (depends-on "git-gutter-fringe+")
git-gutter-fringe+は、ウィンドウの左端に、GitのHEADからの差分がある行を表示してくれます（参考）。
http://d.hatena.ne.jp/syohex/20121221/1356081771

- (depends-on "git-modes" :git "https://github.com/magit/git-modes.git")
git-modesは、Gitの.gitattribute, .gitignore, .gitconfig, コミット、リベースのそれぞれのメジャーモードを提供します（[参考]（https://github.com/magit/git-modes））。
URLからもわかるとおり、magitと同じ所が作っていますが、コミット、リベース以外のモードはmagitに入っていないようなので入れてみました。

### sequential-command
http://d.hatena.ne.jp/rubikitch/20090219/sequential_comtmand
