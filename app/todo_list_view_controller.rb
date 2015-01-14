class TodoListViewController < UITableViewController
  def loadView
    super

    self.title = "Todos"
    tableView.registerClass(TodoCell, forCellReuseIdentifier: TodoCell::ID)
    tableView.estimatedRowHeight = 80
  end

  def tableView(tableView, numberOfRowsInSection: section)
    Todo.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(TodoCell::ID, forIndexPath: indexPath)
    cell.text_label.text = Todo.all[indexPath.row].text
    cell.notes_label.text = Todo.all[indexPath.row].notes
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    todo_vc = TodoViewController.new
    todo_vc.todo = Todo.all[indexPath.row]
    navigationController.pushViewController(todo_vc, animated: true)
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath: indexPath)
    todo_vc = TodoViewController.new
    todo_vc.todo = Todo.all[indexPath.row]
    navigationController.pushViewController(todo_vc, animated: true)
  end
end
