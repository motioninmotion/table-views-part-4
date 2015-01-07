class TodoListViewController < UITableViewController
  def loadView
    super

    self.title = "Todos"
    tableView.registerClass(TodoCell, forCellReuseIdentifier: TodoCell::ID)
  end

  def tableView(tableView, numberOfRowsInSection: section)
    Todo.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(TodoCell::ID, forIndexPath: indexPath)
    cell.textLabel.text = Todo.all[indexPath.row].text
    cell
  end
end
