---
layout: project
title: "agent-tool"
description: "A CLI agent-swarm orchestrator: Claude Code plans, Antigravity and Copilot CLI execute in parallel git worktrees, a Textual TUI watches live."
github: "https://github.com/mpdnes/agent-tool"
tech: [Python, Textual, Claude Code, git worktrees]
featured: true
status: "Active"
date: 2026-08-18
---

## The Problem

Claude Code turns are expensive to spend on writing code. I wanted a way to keep Claude focused on planning and review, while the bulk of the actual coding happened somewhere cheaper and ran in parallel instead of one turn at a time.

## What I Built

A small CLI orchestrator. Claude Code decomposes a task into an agent roster and writes a plan file; `agent-tool` then launches Antigravity CLI (`agy`) and GitHub Copilot CLI (`copilot`) as subprocesses, each in its own isolated git worktree, so they can work at the same time without stepping on each other. A separate Textual TUI tails the whole run live in another terminal, without touching Claude at all.

It also supports tiered, dependency-ordered plans—architects who set constraints, implementers who write the code, verification roles that audit another agent's actual work against a real `verify_command`. Everything after the plan file is written is decoupled through plain files under `.agent-tool/runs/<run_id>/`—no daemon, no extra API key beyond what the CLIs already cost.

## Why It Matters

Coding agents lying about their own success is a real, recurring failure mode—I've seen an LLM "verify" Kotlin that didn't compile by reading the diff instead of building it. Prompting harder doesn't fix that; a real subprocess with a real exit code does. That's the idea `agent-tool` is built around: let the model plan and review, but make anything claiming success actually prove it.
