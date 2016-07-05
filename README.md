# Extand-TableView
使用的Mvc模式，主要是一个类似于QQ列表的展开和缩进。使用的是`[self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade]`和`[self.tableView deleteRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade]`这个方法。
当然你在其它时候，比如说tableView添加数据的时候，也可以用这个方法哦。
