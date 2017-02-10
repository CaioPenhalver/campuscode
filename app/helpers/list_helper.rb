module ListHelper
  def print_list(text, list_type = :ordered)
    if list_type == :ordered
      ordered_list(split_text(text))
    elsif list_type = :unordered
      unordered_list(split_text(text))
    end
  end

  private

  def ordered_list(array)
    li_tags = array.map do |i|
      "<li>#{i}</li>"
    end
    raw("<ol>#{li_tags.join}</ol>")
  end

  def unordered_list(array)
    li_tags = array.map do |i|
      "<li>#{i}</li>"
    end
    raw("<ul>#{li_tags.join}</ul>")
  end

  def split_text(text)
    text
    .split(/\-\.[\d || \w]/)
    .delete_if do |i|
      !/[\d || \w]/.match(i)
    end
  end
end
