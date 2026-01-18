+++
title = "Systems of Intelligence: From Humans to Computers to AI"
date = 2026-01-18
draft = false
tags = ["AI", "systems thinking", "computer history", "philosophy"]
+++

What does it take to build a civilization? What does it take to build an operating system? And what will it take to build a truly capable AI system?

These questions might seem disparate, but they share a common thread: the evolution from individual capability to collective intelligence through shared artifacts and communication protocols.

# The Individual Agent: Senses, Mind, Memory, and Hands

Let us begin with what makes an individual agent capable of interacting with the world.

## The Human

A human possesses:
- **Senses** (vision, hearing, touch) — interfaces for perceiving the environment
- **Mind** — reasoning capabilities for processing information and making decisions
- **Memory** — storage for experiences, knowledge, and learned patterns
- **Hands** — effectors for manipulating the physical world

These four components form a closed loop: we perceive, we think, we remember, we act. A single human with these capabilities can survive, solve problems, and create.

## The Computer

A computer, in its essence, mirrors this architecture:
- **Input devices** (cameras, keyboards, sensors) — interfaces for perceiving data
- **CPU** — processing capabilities for computation and logic
- **Memory/Storage** — RAM and disk for storing state and programs
- **Output devices** (displays, actuators, network) — effectors for changing the environment

The early computers were calculators — pure computation without rich sensing or acting. But as we added cameras, networks, and robotic arms, they became capable of the same perception-reasoning-action loop.

## The AI System

Modern AI systems follow the same pattern:
- **Perception models** (vision encoders, speech recognition) — transforming raw input into representations
- **Reasoning models** (LLMs, planners) — processing and decision-making
- **Context windows and memory systems** — storing conversation history, retrieved knowledge
- **Tool use and code execution** — effectors for taking actions in the world

A language model with tool use can read files, write code, browse the web, and execute commands. It perceives, reasons, remembers (within its context), and acts.

But here is the crucial insight: **individual capability is not enough to build complex systems**.

---

# From Individual to Collective: The Need for Artifacts

A single human can hunt, gather, and build shelter. But a single human cannot build a cathedral, run a hospital, or govern a nation. What changed?

## Human Civilization: The Power of Written Artifacts

The transition from individual to collective intelligence required something beyond ephemeral speech. It required **persistent, shared artifacts**:

- **Documents** — contracts, laws, treaties that bind behavior across time
- **Guides and manuals** — accumulated knowledge transferable to others
- **Bookkeeping** — ledgers that track resources across many hands
- **Maps** — shared spatial knowledge enabling coordination
- **Religious texts** — shared values and behavioral norms
- **Books of law** — codified rules that persist beyond any individual

These artifacts are not merely records. They are **coordination mechanisms**. Multiple people can read the same document, contribute to it, reference it in disputes, and build upon it. A legal code outlives its authors. A map can be updated by surveyors and used by navigators. A bookkeeping ledger allows trust between strangers.

Language enabled communication. But **written artifacts enabled civilization**.

---

# The Computer's Path: From Calculator to Operating System

Early computers were glorified calculators — single programs running single computations. The ENIAC computed ballistic tables. It was powerful, but isolated.

The transition to modern computing required the same evolution that human societies underwent: from individual execution to coordinated systems with shared artifacts.

## The Operating System as Coordination Layer

An operating system provides:
- **Process management** — multiple programs running concurrently
- **Inter-process communication** — pipes, sockets, shared memory for programs to coordinate
- **File systems** — persistent shared artifacts that multiple processes can read, write, and modify
- **Access control** — rules governing who can do what with which resources

The file system is the computer's equivalent of written documents. A configuration file, a database, a log file — these are artifacts that persist beyond any single process, can be read by many programs, and enable coordination across the system.

Without files, each program would be an island. With files, programs can build upon each other's work.

## Visionaries Who Saw This Clearly

### Doug Engelbart: Augmenting Human Intellect

In 1962, Doug Engelbart published "Augmenting Human Intellect: A Conceptual Framework"[^1]. He didn't see computers as mere calculators. He saw them as tools for **augmenting human capability** — and crucially, for enabling **collective intelligence**.

Engelbart's famous 1968 "Mother of All Demos" showed:
- Hypertext and linking between documents
- Collaborative real-time editing
- Video conferencing
- The mouse as an interface device

He understood that the power wasn't in any single feature. It was in enabling **humans to build shared artifacts together** — to collaborate on documents, to link knowledge, to coordinate across distance.

His oN-Line System (NLS) was not just a text editor. It was a system for augmented collective intelligence.

### Vannevar Bush: The Memex

Before Engelbart, Vannevar Bush described the "Memex" in his 1945 essay "As We May Think"[^2]. He imagined a device for storing and linking all of a person's books, records, and communications — a personal knowledge system with trails of association between ideas.

Bush saw that human memory was insufficient for the scale of modern knowledge. We needed **external memory systems** — artifacts that could be searched, linked, and shared.

### J.C.R. Licklider: Man-Computer Symbiosis

In 1960, J.C.R. Licklider wrote "Man-Computer Symbiosis"[^3], envisioning humans and computers as partners in thought. He later led ARPA's computing research, funding the work that led to the internet — the ultimate shared artifact system, connecting not just processes on one machine, but machines across the world.

### Alan Kay: The Dynabook and Object-Oriented Thinking

Alan Kay, working at Xerox PARC, pushed the vision further with the Dynabook concept and Smalltalk. He saw computers as **media for human expression and thought** — not just calculation engines, but environments where ideas could be represented, shared, and built upon.

His object-oriented paradigm was itself about creating reusable, composable artifacts of code.

---

# The AI Transition: From Single Model to Coordinated Systems

We are now witnessing AI undergo the same transition.

## Stage 1: The Calculator Phase

Early neural networks were like early computers — single-purpose tools. A classifier for images. A translator for text. Powerful for their specific task, but isolated.

## Stage 2: The General-Purpose Agent

Large language models represent a leap: general-purpose reasoning engines that can handle diverse tasks. Add tool use, and they can perceive (read files, fetch web pages), reason (process information, make plans), and act (execute code, call APIs).

But a single LLM session is still like a single human or a single process. It can accomplish tasks, but it struggles with:
- Long-running projects that exceed context length
- Tasks requiring multiple specialized capabilities
- Work that benefits from parallel exploration
- Knowledge that must persist across sessions

## Stage 3: Multi-Agent Systems and Shared Artifacts

The next evolution — already underway — is the development of **AI systems** with:

### Persistent Memory
Just as humans developed writing and computers developed file systems, AI systems are developing persistent memory:
- Vector databases for semantic retrieval
- Structured knowledge bases
- Session histories and summaries
- External memory systems that outlive any single context

### Multi-Agent Coordination
Multiple AI agents working together, like multiple processes or multiple humans:
- Specialized agents for different subtasks (coding, research, testing)
- Orchestration layers that coordinate agent activities
- Communication protocols between agents
- Division of labor based on capability

### Shared Artifacts
The critical piece: artifacts that multiple AI agents (and humans) can work with:
- Codebases that agents can read, modify, and commit to
- Documents that accumulate knowledge across sessions
- Plans and task lists that persist and evolve
- Structured data that multiple agents can query and update

Consider how modern AI coding assistants work: they read files (perceive), reason about changes (think), maintain conversation context (memory), and write code (act). But crucially, the code itself is a **shared artifact**. The human developer can read it. Other tools can analyze it. CI/CD systems can test it. Future AI sessions can build upon it.

This is why systems like Claude Code matter: not just because of what a single model can do, but because they integrate AI into the ecosystem of shared artifacts (files, git repositories, terminal environments) that enable coordination.

---

# A Unified View: The Architecture of Collective Intelligence

| Layer | Human Society | Computer System | AI System |
|-------|---------------|-----------------|-----------|
| **Perception** | Senses | Input devices | Encoders, tool outputs |
| **Reasoning** | Mind | CPU | Language models |
| **Memory** | Brain, writing | RAM, files | Context, vector DBs |
| **Action** | Hands, speech | Output devices | Tool use, code execution |
| **Communication** | Language | IPC, protocols | Prompts, structured data |
| **Shared Artifacts** | Documents, laws, maps | Files, databases | Code, docs, knowledge bases |
| **Coordination** | Institutions, norms | OS, schedulers | Orchestrators, workflows |

Each column represents the same fundamental architecture at different scales and substrates. The evolution in each case follows the same pattern:

1. **Individual capability** — a single agent that can perceive, think, remember, and act
2. **Communication** — protocols for agents to exchange information
3. **Persistent artifacts** — shared objects that outlive individual sessions and enable cumulative progress
4. **Coordination mechanisms** — rules and systems for managing multi-agent interaction

---

# What This Means for AI Development

Understanding this parallel suggests where AI development must focus:

## Better Memory Systems
Human civilization took off with writing. Computing took off with file systems. AI needs robust persistent memory that:
- Survives beyond context windows
- Can be queried semantically
- Supports incremental updates
- Enables knowledge accumulation across sessions

## Standardized Artifact Formats
Humans standardized on written language and document formats. Computers standardized on file formats and protocols. AI systems need:
- Standard ways to represent plans, knowledge, and state
- Formats that both humans and AI can read and modify
- Versioning and history for AI-generated artifacts

## Coordination Protocols
Human societies developed laws and institutions. Operating systems developed scheduling and IPC. AI systems need:
- Clear protocols for multi-agent communication
- Resource management across agents
- Conflict resolution mechanisms
- Trust and verification systems

## Human-AI Shared Artifacts
Perhaps most importantly: the artifacts should be shared between humans and AI. Code, documents, plans — these should be readable and modifiable by both. This is Engelbart's vision extended: not just human-computer symbiosis, but human-AI-computer symbiosis.

---

# Conclusion

The development of complex systems follows a universal pattern: individual agents gain capability, then develop communication, then create persistent shared artifacts, then build coordination mechanisms around those artifacts.

Humans did this with language and writing. Computers did this with processes and files. AI is doing this with agents and memory systems.

The visionaries of early computing — Engelbart, Bush, Licklider, Kay — saw computers not as isolated calculators but as tools for augmenting human collective intelligence. They understood that the power lay in enabling shared artifacts and coordination.

We should apply the same lens to AI. The question isn't just "how capable is a single model?" but "how well can AI systems participate in the creation and use of shared artifacts?"

The future belongs to systems that enable humans, computers, and AI to collaborate through persistent, shared representations of knowledge and intent. The file system was revolutionary not because it stored data, but because it enabled coordination. AI memory and multi-agent systems will be revolutionary for the same reason.

We are not building smarter calculators. We are building new participants in the ancient project of collective intelligence.

---

[^1]: Engelbart, D.C. (1962). "Augmenting Human Intellect: A Conceptual Framework." Stanford Research Institute.

[^2]: Bush, V. (1945). "As We May Think." The Atlantic Monthly.

[^3]: Licklider, J.C.R. (1960). "Man-Computer Symbiosis." IRE Transactions on Human Factors in Electronics.
