# arity = number of arguments expected by a function

# Mix commands
# https://elixir-examples.github.io/examples/mix-list-all-tasks
# mix docs

# Elixir maps
# Like C# dictionaries or JS Objects

# Creating a map
colors = %{primary:"red", secondary:"blue"}

#Getting map values by key
colors.primary
colors.secondary
%{secondary: secondary_color} = colors

# Updating map - returns new lists
# Add or updates KeyValuePair
Map.put(colors, :primary, "green")
Map.put(colors, :other, "yellow")
# Only updates
%{colors | secondary:"black"}

# Elixir keyword lists
# Like JS Object list
colors = [{:primary:"red"}, {:secondary:"blue"}]
# Getting value
colors[:primary]
