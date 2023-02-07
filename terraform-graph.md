Terraform graph
---

terraform graph命令可以用來生成代碼描述的基礎設施或是執行計劃的可視化圖形。它的輸出是DOT格式，可以使用[GraphViz](http://www.graphviz.org/)來生成圖片，也有許多網絡服務可以讀取這種格式。

terraform graph [options] [DIR]

該命令生成DIR路徑下的代碼鎖描述的Terraform資源的可視化依賴圖(如果DIR參數缺省則使用當前工作目錄)

- type參數被用來指定輸出的圖表的類型。Terraform為不同的操作創建不同的圖。對於代碼文件，默認類型為"plan"，對於變更計劃文件，默認類型為"apply"。

參數：

- draw-cycles：用彩色的邊高亮圖中的環，這可以幫助我們分析代碼中的環錯誤(Terraform禁止環狀依賴)
- type=plan：生成圖表的類型。可以是：plan、plan-destroy、apply、validate、input、refresh

## **用法**

terraform graph [options] [DIR]

該命令生成DIR路徑下的代碼鎖描述的Terraform資源的可視化依賴圖(如果DIR參數缺省則使用當前工作目錄)

- type參數被用來指定輸出的圖表的類型。Terraform為不同的操作創建不同的圖。對於代碼文件，默認類型為"plan"，對於變更計劃文件，默認類型為"apply"。

參數：

- draw-cycles：用彩色的邊高亮圖中的環，這可以幫助我們分析代碼中的環錯誤(Terraform禁止環狀依賴)
- type=plan：生成圖表的類型。可以是：plan、plan-destroy、apply、validate、input、refresh

## **創建圖片文件**

terraform graph命令輸出的是DOT格式的數據，可以輕鬆地使用GraphViz轉換為圖形文件：

```
$ terraform graph | dot -Tsvg > graph.svg

```

輸出的圖片大概是這樣的：

![https://raw.githubusercontent.com/lonegunmanb/introduction-to-terraform-pic/master/2020-11-25/1606272727693-image.png](https://raw.githubusercontent.com/lonegunmanb/introduction-to-terraform-pic/master/2020-11-25/1606272727693-image.png)

*圖1.6.10/1 - 生成的依賴圖*

## **如何安裝GraphViz**

安裝GraphViz也很簡單，對於Ubuntu：

```
$ sudo apt install graphviz
```

對於CentOS：

```
$ sudo yum install graphviz
```

對於Windows，也可以使用choco：

```
> choco install graphviz
```

對於Mac用戶：

```
$ brew install graphviz
```