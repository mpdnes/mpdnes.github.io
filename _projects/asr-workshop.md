---
layout: project
title: "ASR-Workshop-Demo"
description: "Real-time speech recognition application built with PyQt6 and Deepgram SDK, featuring live transcription, audio visualization, and service-oriented architecture."
github: "https://github.com/mpdnes/asr-workshop"
tech: [Python, PyQt6, Deepgram, Audio Processing]
featured: true
status: "Demo"
date: 2025-01-06
---

## Overview

A real-time Automatic Speech Recognition (ASR) demonstration application built during an accessibility technology workshop. Features live audio capture, streaming transcription via Deepgram's API, and an intuitive Qt-based interface with real-time audio visualization.

## Features

### Real-Time Transcription
- **Live Speech-to-Text**: Streaming transcription using Deepgram's API
- **Audio Visualization**: Real-time waveform display with configurable sensitivity
- **Session Management**: Start/stop controls with automatic resource cleanup
- **Status Monitoring**: Visual feedback for recording state and connection status

### Technical Implementation
- **Service Architecture**: Modular design separating UI, audio capture, and transcription
- **Async Processing**: Non-blocking audio streaming with asyncio
- **Error Handling**: Comprehensive exception handling and graceful degradation
- **Configuration**: Environment-based API key management with python-dotenv
- **Cross-Platform**: Compatible with Windows, macOS, and Linux

## Architecture

### Service-Oriented Design
The application follows a clean service-based architecture with clear separation of concerns:

- **AudioService**: Handles microphone input and real-time audio streaming
- **TranscriptionService**: Manages Deepgram WebSocket connection and transcription events
- **MainWindow**: Qt-based UI coordinating services and displaying results

### Key Components

**Audio Pipeline**
```python
Microphone → AudioService → numpy arrays → TranscriptionService → Deepgram API
```

**Event Flow**
```
User clicks Start → AudioService starts capture →
TranscriptionService opens WebSocket →
Audio chunks stream to Deepgram →
Transcription results emit to UI
```

## Technical Stack

- **UI Framework**: PyQt6 for cross-platform desktop interface
- **Speech Recognition**: Deepgram SDK with WebSocket streaming
- **Audio Processing**: sounddevice + numpy for real-time capture
- **Async Runtime**: asyncio for non-blocking I/O operations
- **Configuration**: python-dotenv for environment management

## Code Quality

- Clean separation between UI and business logic
- Proper resource management with context managers
- Type hints for better code maintainability
- Comprehensive error handling and logging
- Signal-based communication between components

## Repository

[View on GitHub](https://github.com/mpdnes/asr-workshop)

Complete with installation instructions, requirements.txt, and detailed README documentation.
