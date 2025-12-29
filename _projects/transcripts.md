---
layout: project
title: transcripts
description: ML training pipeline for fine-tuning Llama 3.1 8B on academic transcripts
date: 2024-01-15
status: production
categories: [production, ml]
tech: [Python, PyTorch, Transformers, LoRA, Llama 3.1]
github: https://github.com/yourusername/transcripts
metrics:
  - value: "8,647"
    label: "Training Transcripts"
  - value: "27.4M"
    label: "Words Processed"
  - value: "478"
    label: "Unique Courses"
  - value: "$10-20"
    label: "Cost Per Training Run"
---

## Overview

Complete machine learning training pipeline for fine-tuning Llama 3.1 8B on a curated corpus of 8,647 academic transcripts spanning 126 domains. Designed for cost-optimized GPU training with professional results achievable at $10-20 per run using cloud GPU services.

## Key Features

- **Curated Dataset**: 27.4M words across 478 unique courses with 100% high-quality transcripts
- **Domain Coverage**: 126 academic domains from Mathematics to Social Sciences
- **Stratified Splits**: Domain-stratified train/validation/test splits preserving distribution
- **Cost-Optimized**: RTX 4090 training at $10-20 per run via Vast.ai
- **Production-Ready**: Complete pipeline from data prep to model deployment

## Architecture

### Data Pipeline

```python
# Key stages in the pipeline
1. Transcript Collection & Validation
   - Filter for quality markers
   - Extract metadata (course, domain, term)
   - Normalize formatting

2. Q&A Generation
   - Extract meaningful question-answer pairs
   - Context-aware chunking
   - Domain-specific formatting

3. Dataset Preparation
   - Domain stratification
   - Train/val/test splits (80/10/10)
   - Hugging Face Dataset format

4. Training Configuration
   - LoRA adapter setup
   - 4-bit quantization
   - Optimized hyperparameters
```

### Training Stack

- **Base Model**: Llama 3.1 8B
- **Fine-tuning Method**: LoRA (Low-Rank Adaptation)
- **Framework**: Unsloth for 2x speedup
- **Optimization**: 4-bit quantization, gradient checkpointing
- **Hardware**: RTX 4090 (24GB VRAM)

## Performance

### Training Metrics

- Training Time: 10-12 hours on RTX 4090
- Memory Usage: <20GB VRAM with 4-bit quantization
- Throughput: ~2-3 tokens/sec during training
- Final Loss: Converges to <0.5 validation loss

### Cost Efficiency

Traditional cloud training costs for LLM fine-tuning can exceed $500-1000 per run. This pipeline achieves comparable results at **95-98% cost reduction** through:

1. Efficient GPU selection (RTX 4090 spot instances)
2. Optimized batch sizes and gradient accumulation
3. LoRA adapters instead of full fine-tuning
4. 4-bit quantization reducing memory requirements

## Technical Implementation

### Key Files

- `prepare_training_data.py`: Corpus analysis and Q&A extraction
- `train_model.py`: RTX 4090 optimized training script  
- `vast_ai_setup.sh`: Cloud GPU environment configuration
- `inference.py`: Model loading and inference utilities

### Training Configuration

```python
# Core training parameters
lora_config = {
    "r": 16,
    "lora_alpha": 32,
    "target_modules": ["q_proj", "k_proj", "v_proj", "o_proj"],
    "lora_dropout": 0.05,
    "bias": "none",
    "task_type": "CAUSAL_LM"
}

training_args = {
    "num_train_epochs": 3,
    "per_device_train_batch_size": 4,
    "gradient_accumulation_steps": 4,
    "learning_rate": 2e-4,
    "fp16": True,
    "warmup_steps": 100
}
```

## Domain Distribution

The training corpus covers:

- **Academic (69%)**: STEM courses, humanities, social sciences
- **Technical (12%)**: Computer science, engineering
- **Business (7%)**: Economics, management, marketing
- **Legal (5%)**: Law, policy, governance
- **Medical (3%)**: Healthcare, biology, nursing
- **General (4%)**: Cross-disciplinary content

## Use Cases

### Academic TA System

Fine-tuned model serves as virtual teaching assistant capable of:
- Answering domain-specific questions
- Explaining complex concepts in academic terminology
- Providing context-aware responses based on course content

### Transcript Enhancement

- Automated transcript annotation
- Key concept extraction
- Summary generation
- Question generation for study materials

### Research Applications

- Domain-specific language modeling
- Academic discourse analysis
- Curriculum development insights

## Future Development

- **Expanded Corpus**: Target 15,000+ transcripts
- **Multi-Modal**: Integration with slide content and audio
- **Real-Time**: Streaming inference for live captioning enhancement
- **Specialized Models**: Domain-specific fine-tunes (STEM, humanities, etc.)

## Getting Started

```bash
# Clone repository
git clone https://github.com/yourusername/transcripts

# Install dependencies
pip install -r requirements.txt --break-system-packages

# Prepare training data
python prepare_training_data.py

# Start training (local or cloud GPU)
python train_model.py
```

See [GitHub repository]({{ page.github }}) for complete documentation.
