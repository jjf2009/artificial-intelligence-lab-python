def objective_function(x):
    return -(x - 5) ** 2 + 20

def get_neighbors(state, step_size):
    return [state - step_size, state + step_size]

def simple_hill_climbing(initial_state, step_size=0.1, max_iterations=1000):
    current_state = initial_state
    current_value = objective_function(current_state)
    route = [current_state]

    for _ in range(max_iterations):
        neighbors = get_neighbors(current_state, step_size)
        improved = False
        for neighbor in neighbors:
            value = objective_function(neighbor)
            if value > current_value:
                current_state = neighbor
                current_value = value
                route.append(current_state)
                improved = True
                break
        if not improved: break
    return current_state, current_value, route

if __name__ == "__main__":
    start_node = 0.0
    step_size = 0.5
    peak_state, peak_value, transition_path = simple_hill_climbing(
        initial_state=start_node, 
        step_size=step_size
    )
    print("-" * 60)
    print(" Simple Hill Climbing Result")
    print("-" * 60)
    print(f" Initial State : {start_node}")
    print(f" Step Size     : {step_size}")
    print("-" * 60)
    print(" Status        : Success - Peak found!")
    print(f" Total Hops    : {len(transition_path) - 1}")
    print(f" Global Peak   : x = {peak_state:.4f} | f(x) = {peak_value:.4f}")
    print("\n State Transition Path (Rounded):")
    print("  " + " -> ".join([f"{state:.1f}" for state in transition_path]))
    print("-" * 60)
