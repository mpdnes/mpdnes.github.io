---
layout: project
title: "otl"
description: "An absurdly over-produced terminal client for classic Outlook, with AI-native drafting and triage baked in—no MCP server required."
github: "https://github.com/mpdnes/otl"
tech: [Python, Textual, Win32 COM, Claude Code, Ollama]
featured: true
status: "Active"
date: 2026-08-18
---

## The Problem

I wanted to work email the way I work code: from a terminal, fast, with AI help for drafting and triage—without babysitting an MCP server or a Claude Code session just to check the inbox.

## What I Built

`otl` talks straight to Outlook over Win32 COM, so browsing mail needs nothing beyond the app itself. AI features—drafting, triage, tagging, a chat panel—shell out to the `claude` CLI or a local Ollama daemon on demand. It ships as both a full-screen Textual TUI and a scriptable CLI/REPL, and both sit on the same shared backend so they can't drift apart on what "reply" or "triage" actually does.

## The Safety Gate

The part I actually care about: anything that sends mail, deletes mail, or touches a calendar invite is withheld from the model at the process level—it can't call those tools no matter what the prompt says. Instead it proposes an action with a `CONFIRM: <tool> {json}` marker, the TUI shows me the proposal, and only my explicit confirmation triggers the real Outlook call. No second model round-trip that could reinterpret what I approved.

Nobody asked for any of this. It exists because it could.
