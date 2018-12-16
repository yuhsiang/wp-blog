# Blog

## 第一次創建 Wordpress Blog

### Step 1 執行 `script`

執行

如果有 docker-compose 可執行

```
./init_wordpress.sh
```

沒有 `docker-compose` 執行

```
docker_run.sh
```

### Step 2 創建帳號

連線到 `wordpress`

如果是開在本機可以用 `browser` 開啟

```
http://locolhost:9527
```

> 請把密碼記起來唷！


## Default Setup

Wordpress 預設會去連 `3306` 的 `MySQL` 所以要幫忙架設 MySQL

設定已經寫在 `docker-compose` 裡只要啟動它就好

以下是 `Wordpress` 和 `MySQL` 的設定

**Wordpress** 

* 部落格 port 會開在 `9527`
* Wordpress 的 `code` 會被 mount 在 `./www` 裡

**MySQL**

* MySQL 的 port 會開在 `9506`
* MySQL 的備份會被 mount 在 `./db` 裡
* 密碼寫在 `docker-compose.yml`

