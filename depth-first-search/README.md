# Depth-First Search

**AI Lab — Experiment 2: Depth-First Search (DFS).**

`main.py` implements iterative DFS over a graph stored as an adjacency list
(`dict` of vertex → neighbour list), plus three graph queries built on it.

## Functions

| Function | Purpose |
|---|---|
| `dfs(adj, start)` | Iterative DFS using an explicit stack; returns visit order |
| `distance(adj, src, dst)` | Fewest edges between two vertices (BFS layer count) |
| `has_path(adj, src, dst)` | Whether `dst` is reachable from `src` |
| `count(adj)` | For every vertex, how many others it can reach |

DFS pushes the start on a stack; on each pop it records the vertex, marks it
visited, and pushes unvisited neighbours in reverse order so the smallest-indexed
neighbour is explored first (mimicking recursive DFS order).

## Run

```bash
python3 main.py
```

The script demonstrates DFS on a connected graph and a disjoint (two-component)
graph, then prompts for two vertices to test connectivity and prints reachability
and distance results.

## Complexity

`O(V + E)` time — every vertex and edge is examined once. Space is `O(V)` for the
`visited` set and the stack.
