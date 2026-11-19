# Game Development & AI Evaluation Portfolio

Welcome to my portfolio. This repository contains code samples and technical documentation demonstrating my expertise in game engine scripting, asset pipelines, and AI model evaluation. 

These samples are designed to highlight my proficiency in **Panda3D**, **Solar2D**, and **Defold**, as well as my ability to create structured, complex tasks to evaluate AI code generation capabilities.

---

## 🛠️ Technical Stack
- **Engines/Frameworks:** Panda3D, Solar2D (Corona SDK), Defold
- **Languages:** Python, Lua, C++, C#
- **Focus Areas:** Gameplay programming, physics simulation, rendering pipelines, asset integration, and AI prompt engineering for code generation.

---

## 📂 Project Samples

### 1. Solar2D (Lua): 2D Physics & AI Behavior Tree Evaluation
- **Description:** A modular Lua script demonstrating complex 2D collision detection and a custom state-machine behavior tree for NPC pathfinding. 
- **AI Evaluation Context:** This script is intentionally structured with edge cases (e.g., overlapping collision masks, asynchronous state transitions) that are commonly hallucinated or mishandled by current LLMs when asked to "write a Solar2D enemy AI."
- **File:** `solar2d_ai_behavior.lua` *(You can create this file and paste a basic Lua state machine script here)*

### 2. Panda3D (Python): Procedural Asset Pipeline & Rendering
- **Description:** A Python utility script for Panda3D that automates the ingestion of 3D assets, applies PBR materials, and optimizes mesh collision bounds.
- **AI Evaluation Context:** Used as a benchmark task to test if an AI model can correctly chain Panda3D's `Loader`, `GeomNode`, and material assignment APIs without introducing memory leaks or deprecated syntax.
- **File:** `panda3d_asset_pipeline.py`

### 3. Defold: Build Deployment & Rendering Optimization
- **Description:** Documentation and Lua snippets showing how to optimize render scripts in Defold for mobile deployment, including batch rendering setup and texture atlas management.
- **AI Evaluation Context:** Highlights the gap between generic AI advice and engine-specific, production-ready Defold optimization techniques.
- **File:** `defold_render_optimization.md`

---

## 📝 Notes on AI Model Evaluation
In my recent work, I have focused on designing "adversarial" or highly specific game development prompts that expose the limitations of current AI models. This includes:
- Testing AI understanding of engine-specific lifecycle methods (e.g., Solar2D's `enterFrame` vs. Defold's `update`).
- Evaluating AI-generated code for proper memory management in long-running game loops.
- Providing structured, rubric-based feedback on AI outputs to improve RLHF (Reinforcement Learning from Human Feedback) datasets.

---
*For a full view of my professional background, please refer to my attached CV.*
