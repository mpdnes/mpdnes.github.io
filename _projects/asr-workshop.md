---
layout: project
title: "ASR-Workshop-Demo"
description: "An experiment in bridging automatic speech recognition with manual transcription correction."
github: "https://github.com/mpdnes/asr-workshop"
tech: [Python, PyQt6, Deepgram, Audio Processing]
featured: true
status: "Experiment"
date: 2025-01-06
---

## The Problem

In real-time captioning, transcripts need to be correct the first time. ASR gets you speed but not accuracy. Manual transcription gets you accuracy but not speed. I wanted to find a way to mesh both—use ASR as a foundation while allowing for real-time manual correction.

## What I Built

A PyQt6 desktop app with live audio capture, streaming transcription via Deepgram's API, and real-time waveform visualization. The idea was to create an interface where ASR and human input could coexist.

## What I Learned

This approach didn't solve the problem I was after. The fundamental tension between speed and accuracy needs a different solution than what I landed on here. But it was a good learning experiment—I got comfortable with async audio streaming, WebSocket APIs, and Qt's signal-based architecture.

Sometimes you build something to find out it's the wrong direction. That's still useful.
