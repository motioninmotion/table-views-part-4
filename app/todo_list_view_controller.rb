class TodoListViewController < UITableViewController
  def loadView
    super

    self.title = "Todos"
    tableView.registerClass(TodoCell, forCellReuseIdentifier: TodoCell::ID)
    tableView.estimatedRowHeight = 80
  end

  def tableView(_, numberOfRowsInSection: _)
    Todo.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(TodoCell::ID, forIndexPath: indexPath)
    cell.text_label.text = Todo.all[indexPath.row].text
    cell.notes_label.text = Todo.all[indexPath.row].notes
    cell
  end

  def tableView(_, didSelectRowAtIndexPath: indexPath)
    todo_vc = TodoViewController.new
    todo_vc.todo = Todo.all[indexPath.row]
    navigationController.pushViewController(todo_vc, animated: true)
  end

  def tableView(_, accessoryButtonTappedForRowWithIndexPath: indexPath)
    todo_vc = TodoViewController.new
    todo_vc.todo = Todo.all[indexPath.row]
    navigationController.pushViewController(todo_vc, animated: true)
  end
end
