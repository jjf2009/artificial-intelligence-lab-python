# Breadth-First Search

**AI Lab — Experiment 3: Breadth-First Search (BFS).**

`main.py` implements iterative BFS that works on **both** representations of a
graph — an adjacency list and an adjacency matrix — through a single
`graph_type` switch.

## Functions

| Function | Purpose |
|---|---|
| `neighbours(graph, vertex, graph_type)` | Yield neighbours for `"list"` or `"matrix"` graphs |
| `bfs(graph, start, graph_type)` | BFS traversal from `start` |
| `is_connected(graph, src, dst, graph_type)` | Whether a path exists `src → dst` |
| `count_connected_vertices(graph, src, graph_type)` | How many vertices are reachable from `src` |

BFS uses a `deque` as a FIFO queue: dequeue a vertex, then enqueue every
unvisited neighbour and mark it visited. Because vertices are visited in
increasing distance order, BFS also yields shortest-path (fewest-edge) reach.

## Run

```bash
python3 main.py
```

The script builds the same 5-vertex graph as both an adjacency list and an
adjacency matrix and runs each query on both, showing the results agree.

## Complexity

Adjacency list: `O(V + E)`. Adjacency matrix: `O(V²)` because every row is
scanned for neighbours. Space is `O(V)`.
