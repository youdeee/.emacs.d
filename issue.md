# emacs周りでやりたいこと

## 欲しいコマンド
- avyっぽいbuffer切り替え
- 一気にsave-pointまでundo/redoする
- simple-initからmy-function参照するようにしたい
- 検索、git まわり強化したい
- 簡単なexpand/region的なの実装して、textObjectをいい感じに選択できるようにしたい
- C-w、C-1的なことを、例えば今は"を囲い文字としてカットします、的なことをしたい。expand-regionで囲い文字洗濯できる的な
- やっぱC-1とかの挙動微妙。前のコピーを引き継ぎたい
- カーソル上・下の段落前削除
- helm-all-swoopとかでtagファイルとか省きたい
- いい感じのcsv-mode(余力あればフルスクラッチ)列に色つけたり、対応separator増やしたり、もっと簡単に入れ替えしたり、このmode用のkill-ring作ったり、空白列足す

- androidstudioとかみたいなfuzzy completionをつけたい
- 特定の拡張子のファイルだけkill-bufferする
- sqlまわりなんとかしたい
- keychord周り見直す、普通に英語２つは辛い
- helm-M-xで[]とか記号系入力すると死ぬ


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


### 過去に欲しいと思ったコマンド
- yank-popをいい感じに。前後2,3個のkill-ringを素早く表示させたい。ポインタだけ移動させるイメージ。https://www.emacswiki.org/emacs/download/browse-kill-ring.el
