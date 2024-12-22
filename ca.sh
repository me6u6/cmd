#!/bin/sh
mkdir -p server_ca
cd server_ca/

#  1. CA証明書を作成する
## 1.1 「認証局(CA)の秘密鍵 hoge_ca.key」を作成
##
openssl genpkey -out hoge_ca.key -algorithm RSA -pkeyopt rsa_keygen_bits:4096

## 1.2 「認証局(CA)の秘密鍵 hoge_ca.key」を使い、「証明書署名要求 hoge_ca.csr」を発行
##      CSRには、識別情報 (Subject) と秘密鍵から生成された公開鍵が含まれる
openssl req -new -key hoge_ca.key -out hoge_ca.csr -subj "/O=Mitsui E&S Systems Research Inc."

## 1.3  CSRを「認証局(CA)の秘密鍵 hoge_ca.key」で自己署名して、CA証明書「hoge_ca.crt」を作成
##      このCA証明書は、クライアントにインポートする
openssl x509 -req -days 365 -signkey hoge_ca.key -in hoge_ca.csr -out hoge_ca.crt

#  2. サーバ証明書を作成する
## 2.1 「サーバーの秘密鍵 server.key」を作成
##
openssl genpkey -out server.key -algorithm RSA -pkeyopt rsa_keygen_bits:4096

## 2.2 「サーバーの秘密鍵 server.key」を使い、「証明書署名要求 server.csr」を発行
##
openssl req -new -key server.key -out server.csr -subj "/CN=www.hoge.com"

## 2.3 証明書に付加する SAN (Subject Alternative Name: サブジェクト代替名) を含めたテキストファイル「server.ext」を作る
##
cat <<'EOF' >> server.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = www.hoge.com
EOF

## 2.4 「証明書署名要求 server.csr」と CA秘密鍵「hoge_ca.key」と CA証明書「hoge_ca.crt」でサーバ証明書「server.crt」を作成
##
openssl x509 -in server.csr -out server.crt -req -CA hoge_ca.crt -CAkey hoge_ca.key -CAcreateserial -days 365 -extfile server.ext

## 証明書の内容を確認
##
## openssl x509 -noout -text -in server.crt

## IssuerとSubjectと有効期間を表示
##
## openssl x509 -noout -issuer -subject -dates -in server.crt

## まとめ
##
## サーバーの秘密鍵と証明書をサーバに、CA証明書をクライアントにインストールする

# 参考
# https://zenn.dev/jeffi7/articles/10f7b12d6044ad
# https://users.rust-lang.org/t/use-tokio-tungstenite-with-rustls-instead-of-native-tls-for-secure-websockets/90130
# https://dev.to/anshulgoyal15/a-beginners-guide-to-grpc-with-rust-3c7o
# https://stackoverflow.com/questions/76049656/unexpected-notvalidforname-with-rusts-tonic-with-tls
