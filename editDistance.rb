def edit_distance(a, b, start_a = 0, start_b = 0, changing_cost = 1, adding_cost = 1, removing_cost = 1)
  # Calculates the edit distance from a at position start_a to b at position start_b, with the specified costs.
  # Params:
  # +a+:: the word to change (could be an array as well; it won't be changed!)
  # +b+:: the word a should be changed to (could be an array as well; it won't be changed!)
  # +start_a+:: the start for a, used for rekursiv calls so that a is unchanged
  # +start_b+:: the start for b, used for rekursiv calls so that b is unchanged
  # +changing_cost+:: the cost of changing a letter (or arrayelement, if an array is passed) in a
  # +adding_cost+:: the cost of adding a letter (or arrayelement, if an array is passed) to a
  # +removing_cost+:: the cost of removing a letter (or arrayelement, if an array is passed) from a
  if a.length == start_a  # end of string a reached
    return b.length - start_b
  elsif b.length == start_b  # end of string b reached
    return a.length - start_a
  elsif a[start_a] == b[start_b]  # basic case if the first latters are the same
    return edit_distance(a, b, start_a + 1, start_b + 1, changing_cost, adding_cost, removing_cost)
  else  # case of deleting a letter
    #  remove a letter from a (equals adding the letter to b):
    cut_a = removing_cost + edit_distance(a, b, start_a + 1, start_b, changing_cost, adding_cost, removing_cost)
    #  adds a letter to a (equals removing a letter from b)
    cut_b = adding_cost + edit_distance(a, b, start_a, start_b + 1, changing_cost, adding_cost, removing_cost)
    # remove a letter from both (equals changing a letter to an other)
    cut_both = changing_cost + edit_distance(a, b, start_a + 1, start_b + 1, changing_cost, adding_cost, removing_cost)
    return [cut_a, cut_b, cut_both].min
  end
end

if ARGV.length > 1
  puts edit_distance(ARGV[0], ARGV[1])
end
