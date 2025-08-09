# github
```
問題やプルリクエストを検索する方法
is:issue is:open label:beginner - この特定のクエリは、オープンでラベルが付けられた問題を持つすべてのプロジェクトを一覧表示しますbeginner。
is:issue is:open label:easy - ラベルが付けられたすべての未解決の問題が一覧表示されますeasy。
is:issue is:open label:first-timers-only - 初めての貢献を歓迎するすべてのオープンな問題をリストします。
is:issue is:open label:good-first-buggood-first-bug - これは、貢献者を引き付けて作業してもらうために、ラベルの付いた未解決の問題を持つプロジェクトをリストします
is:issue is:open label:"good first issue" - これは、ラベルが付いたすべての未解決の問題を一覧表示しますgood first issue。つまり、初心者が始めるのに適した場所であることを意味します。
is:issue is:open label:starter - GitHub 全体から r というラベルが付けられたすべての未解決の問題を一覧表示しますstarte。
is:issue is:open label:up-for-grabs - 必要なスキルがあればすぐに取り組むことができる未解決の問題をリストします。
no:project type:issue is:open - 特定のプロジェクトに割り当てられていないすべての未解決の問題が一覧表示されます。
no:milestone type:issue is:open - 多くの場合、プロジェクトはマイルストーンで追跡されます。ただし、追跡されていない問題を見つけたい場合は、この検索クエリでそれらのプロジェクトがリストされます。
no:label type:issue is:open - ラベルが付いていない未解決の問題がすべて一覧表示されます。
is:issue is:open no:assignee - まだ人に割り当てられていないすべての未解決の問題が表示されます。

リポジトリの検索方法
in:nameを使用します。データ サイエンスについてさらに学ぶためのリソースを探しているとします。この場合、リポジトリ名に「データ サイエンス」が含まれるリポジトリを一覧表示する Data Science in:name コマンドを使用できます。
in:descriptionを使用します。特定の説明を持つリポジトリを検索する場合、たとえば説明に「freeCodeCamp」という用語が含まれているリポジトリを検索する場合、検索は次のようになります。freecodecamp in:description
in:readmeを使用します。これを使用して、ファイルの README で特定のフレーズを検索します。README に freecodecamp という用語が含まれているリポジトリを検索する場合、検索は次のようになります。freecodecamp in:readme。
in:topicを使用します。これを使用して、トピックで特定のフレーズまたは単語がラベル付けされているかどうかを確認します。たとえば、トピックに freecodecamp がリストされているすべてのリポジトリを検索する場合、検索は次のようになります。freecodecamp in:topic

星やフォークで探す方法
stars:nを使用します。1000 個のスターが付いたリポジトリを検索する場合、検索クエリは stars:1000 になります。
forks:nを使用します。これは、リポジトリが持つべきフォークの数を指定します。100 未満のフォークを持つリポジトリを検索する場合、検索は次のようになります。forks:<100
<, >, <=, >= & .. などで更に絞り込めます。

言語で検索する方法
language:LANGUAGE

組織名で検索する方法
org:ou

日付で検索する方法
2022-10-01 以降に作成された、Rust という単語を含むすべてのリポジトリを検索する。
created、updated、merged、closed いずれかのキーワードを使用して検索できます。
Rust created:>2022-10-01
<, >, <=, >= & .. などで更に絞り込めます。

ライセンスによる検索方法
license:LICENSE_KEYWORD

可視性による検索方法
Amazon が所有するすべてのパブリック リポジトリを検索する。
is:public org:Amazon

プライベート リポジトリを一覧表示する
is:private
```

# chisel
```
chisel server --port 80 --reverse
chisel client --tls-skip-verify --proxy http://xxx.xxx.xxx.xxx:8080 {宛先IP}:80 127.0.0.1:2222:0.0.0.0:22
```

# コメントアウト削除
```
cat /etc/squid/squid.conf  | grep -v "^\s*#" | grep -v "^$"
```

# ポートフォワード
```
firewall-cmd --permanent --zone=trusted --add-forward-port=port=8888:proto=tcp:toport=8888:toaddr=192.168.1.200
firewall-cmd --reload
firewall-cmd --list-all-zones
```

# script
```
script -qf `date +%Y%m%d`_`date +%H%M`.log
```

# tcpdump
```
tcpdump -X -s 0 -i ens160 port 8888 -nn
```

# wmi
```
$Computer = "xxx.xxx.xxx.xxx"
$LAdmin = "host-name\user-name"
$LPassword = ConvertTo-SecureString "pass" -AsPlainText -Force
$Credentials = New-Object -Typename System.Management.Automation.PSCredential -ArgumentList $LAdmin, $LPassword
Get-WmiObject -Namespace "root\cimv2" -Class Win32_Process -Impersonation 3 -Credential $Credentials -ComputerName $Computer

Get-WmiObject -Namespace "root\cimv2" -Class Win32_OperatingSystem -Impersonation 3 -Credential $Credentials -ComputerName $Computer

Get-WmiObject -Namespace "root\cimv2" -Class Win32_OperatingSystem -Impersonation 3 -Credential $Credentials -ComputerName $Computer |
 Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion,Caption,Version,ProductType,CSDVersion,OSLanguage
```
