# MineState

MineState is a state machine builder and interpreter datapack library for Java Minecraft

# How to use

## Building a State Machine

All state machines must first be defined, before they can be used. It is strongly advised to use the built in state machine builder (`minestate:builder/`), especially when building for the first time. However, since you only need to build a state machine once, directly affecting the nbt data is advisable for performance sake.

### Running the builder

<hr>
<details>
  <summary><strong>Builders</strong></summary>

A builder is the overall data structure used to define a new state machine via function calls

<details>
  <summary><strong>New</strong></summary>

Start the builder like so, giving it a name via macro. Note that any builder in progress will be permanently overwritten when starting a new builder.

```mcfunction
function minestate:builder/new {name:"<MachineName>"}
```

</details>
<details>
  <summary><strong>Finalize</strong></summary>

Finalize the builder like so. The builder will then be verified for validity, guards and actions will be linked, and the builder will be simplified into a definition. The definition will then be saved to the definition registry, ready for the interpreter

```mcfunction
function minestate:builder/finalize
```

</details>

<hr>
</details>

<details>
  <summary><strong>Graphs</strong></summary>

MineState state machines can run multiple state machines in parallel. Each of these sub-machines is called a "graph". Graphs are independant of each other's state, but all recieve the same events during interpretation.

<details>
  <summary><strong>New</strong></summary>

Create a new graph like so, giving it a name via macro. Note that any graph in progress will be permanently overwritten when creating a new graph.

```mcfunction
function minestate:builder/graph/new {name:"<GraphName>"}
```

</details>
<details>
  <summary><strong>Set Initial</strong></summary>

Set the target initial state for this graph via macro. This will overwrite any initial state already set.

An initial state **_must_** be set for the graph to be valid.

```mcfunction
function minestate:builder/graph/set_initial {target:"<StateName>"}
```

</details>
<details>
  <summary><strong>Finalize</strong></summary>

Finalize the graph like so. The graph will then be verified for validity, and the graph will be traversed, eliminating unused states. The graph will then be saved as part of the current builder.

```mcfunction
function minestate:builder/graph/finalize
```

</details>

<hr>
</details>

<details>
  <summary><strong>States</strong></summary>

Every graph can be represented be a current state, and a finite number of states in which it can become. States are one of the critical components of a state machine.

<details>
  <summary><strong>New</strong></summary>

Create a new state like so, giving it a name via macro. Note that any state in progress will be permanently overwritten when creating a new state.

```mcfunction
function minestate:builder/graph/states/new {name:"<StateName>"}
```

</details>
<details>
  <summary><strong>Finalize</strong></summary>

Finalize the state like so. The state will be saved in the current graph.

```mcfunction
function minestate:builder/graph/states/finalize
```

</details>

<hr>
</details>

<details>
  <summary><strong>Transitions</strong></summary>

All states are connected by transitions, which define how, and when states will change. Transitions are one of the critical components of a state machine.

  <details>
  <summary><strong>New</strong></summary>

Create a new transition like so, giving it a name via macro. **The name of the transition should be the name of the event intended to trigger this transition**. Note that any transition in progress will be permanently overwritten when creating a new transition.

```mcfunction
function minestate:builder/graph/states/transitions/new {name:"<TransitionName>"}
```

</details>
<details>
  <summary><strong>Add Target</strong></summary>

Add a new target to this transition like so. Targets **require** a target state to transition to, an array of guards to check, and an array of actions to call. Leave an array empty if you do not wish for this to occur.

Targets will interpreted sequentially, in the order of creation, until either a valid route can be found, or no route is found.

```mcfunction
function minestate:builder/graph/states/transitions/add_target {target:"<StateName>",actions:["<ActionName>"],guards:["<GuardName>"]}
```

</details>
<details>
  <summary><strong>Finalize</strong></summary>

Finalize the transition like so. The transition will then be saved to the state.

```mcfunction
function minestate:builder/finalize
```

</details>

<hr>
</details>

<details>
<summary><strong>Guards</strong></summary>
  
A guard function is used to validate if a transition should occur. All guards should return a value, or fail. While interpreting a transition, if any guard fails, or does not exist, the transition will proceed to the next target, ignoring the current one.

If a transition has no valid targets, the state will remain the same.

<details>
  <summary><strong>New</strong></summary>

Register a new guard like so, giving it a name and a target function. Note that any guard with the same name will be permanently overwritten when creating a new guard.

**Note: `<GuardName>` represents the name used when defining a transition. `<Function>` represents the namespaced name of the guard function to call.** (For example, `<Function>` could be `"mydatapack:example_function"`)

```mcfunction
function minestate:builder/guards/new {name:"<GuardName>", target:"<Function>"}
```

</details>

<hr>
</details>

<details>
<summary><strong>Actions</strong></summary>
  
An action function is used to create side effects from the state machine. This is the recommended method to recieve an output from the state machine

All actions that are called will be called with the following macros:

- `interpreter`
  - The name of the interpreter being run
- `machine`
  - The name of the state machine from the definition registry
- `graph`
  - The name of the graph that is transitioning
- `event`
  - The name of the event that is triggering (the name of the transition)
- `from`
  - The name of the state which the state machine is transitioning _from_
- `to`
  - The name of the state which the state machine is transitioning _to_
- `final`
  - A binary value (`0b` or `1b`) stating whether the state the machine is transitioning to has any transitions. Will be `1b` if there are **no** transitions on the state (a.k.a. the state is a "final" variant).

<details>
  <summary><strong>New</strong></summary>

Register a new action like so, giving it a name and a target function. Note that any action with the same name will be permanently overwritten when creating a new action.

**Note: `<ActionName>` represents the name used when defining a transition. `<Function>` represents the namespaced name of the guard function to call.** (For example, `<Function>` could be `"mydatapack:example_function"`)

```mcfunction
function minestate:builder/actions/new {name:"<ActionsName>", target:"<Function>"}
```

</details>

<hr>
</details>

<br>

**NOTE: All state machines definitions are wiped on reload.** Make sure to reinitialize them after any reload.

## Interpreting a State Machine

<details>
  <summary><strong>Interpreters</strong></summary>

An interpreter takes a state machine definition, and traverses all graphs in response to events, starting from the initial state on each graph.

<details>
  <summary><strong>Start</strong></summary>

Start a new interpreter like so, giving it a name, and a target state machine to run. Note that any interpreter with the same name will be permanently overwritten when creating a new interpreter.

Each graph in the state machine will start at its respective initial state.

You may start multiple interpreters off of one definition, and they will run independantly of one another.

```mcfunction
function minestate:interpreter/start {name:"<InterpreterName>", target:"<MachineName>"}
```

</details>
<details>
  <summary><strong>Transition</strong></summary>

Transition **all** graphs inside a state machine by triggering a sequence of events, which are triggered sequentially, possibly resulting in state transitions.

If there are no targets for this event, or all targets fail to pass their guards, then a graph will remain in the same state, triggering no actions. However, this is intended behaviour, and will not trigger an erroring fail.

Any transition that occurs that has linked actions will trigger all actions, passing the relevant macros.

```mcfunction
function minestate:interpreter/transition {target:"<InterpreterName>", events: ["<EventName>"]}
```

</details>
<details>
  <summary><strong>Stop</strong></summary>

Stop an interpreter, deleting it permanently. (Note that this does **not** delete the state machine definition, simply the state machine interpreter)

```mcfunction
function minestate:interpreter/stop {target:"<InterpreterName>"}
```

</details>

<hr>
</details>

<br>

**NOTE: All active interpreters are wiped on reload.** Make sure to reinitialize them after any reload.

# Private Folders & NBT Data

You are highly advised not to access or run any function under a folder called `private`. Any bugs or problems arising from improper use of this datapack will not be resolved, unless it also affects standard use cases.

You are also advised not to access or modify any internal NBT data under the namespace `minestate` or `minestate._temp_`. However, if required, the builder can be bypassed by directly injecting a state machine definition into the definition table at `minestate:internal definitions`. Once again, problems arising from improper use of this datapack will not be resolved, unless it also affects standard use cases.

# Contributing

Feel free to contribute to this datapack if you so wish. However, I provide no guarantees that I will address issues or pull requests.
