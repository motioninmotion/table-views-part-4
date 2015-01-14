class TodoViewController < UIViewController
  attr_accessor :todo

  def loadView
    super

    view.backgroundColor = UIColor.whiteColor

    label = UILabel.new
    label.text = todo.text
    label.textAlignment = NSTextAlignmentCenter
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    constraints = []
    constraints += NSLayoutConstraint.constraintsWithVisualFormat(
      "V:[top_layout_guide]-[label]-[bottom_layout_guide]",
      options: NSLayoutFormatDirectionLeadingToTrailing,
      metrics: {},
      views:   {
        "bottom_layout_guide" => bottomLayoutGuide,
        "top_layout_guide" => topLayoutGuide,
        "label" => label
      }
    )
    constraints += NSLayoutConstraint.constraintsWithVisualFormat(
      "H:|-[label]-|",
      options: NSLayoutFormatDirectionLeadingToTrailing,
      metrics: { "min_margin" => 20 },
      views:   { "label" => label }
    )
    view.addConstraints(constraints)


    self
  end
end
