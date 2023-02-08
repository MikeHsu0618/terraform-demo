代碼風格規範
Terraform推薦以下代碼規範：

使用兩個空格縮進
同一縮進層級的多個賦值語句以等號對齊：
```
ami           = "abc123"
instance_type = "t2.micro"
```
當塊體內同時有參數賦值以及內嵌塊時，請先編寫參數賦值，然後是內嵌塊。參數與內嵌塊之間空一行分隔
對於同時包含參數賦值以及元參數賦值的塊，請先編寫元參數賦值語句，然後是參數賦值語句，之間空一行分隔。元參數塊請置於塊體的最後，空一行分隔：
```
resource "aws_instance" "example" {
count = 2 # meta-argument first

ami           = "abc123"
instance_type = "t2.micro"

network_interface {
# ...
}

lifecycle { # meta-argument block last
create_before_destroy = true
}
}
```

頂層塊之間應空一行分隔。內嵌塊之間也應該空一行分隔，除非是相同類型的內嵌塊(比如resource塊內部多個provisioner塊)
同類型塊之間盡量避免插入其他類型塊，除非不同類型塊共同組成了一個有語義的家族(比方說，aws_instnace資源內的root_block_device、ebs_block_device、ephemeral_block_device內嵌塊共同構成了描述AWS塊存儲的塊家族，所以他們可以被混合編寫)。