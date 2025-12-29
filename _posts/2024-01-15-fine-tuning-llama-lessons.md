---
layout: post
title: "Fine-Tuning Llama 3.1 for Academic Transcripts: Lessons Learned"
date: 2024-01-15
categories: [machine-learning, nlp]
tags: [llama, fine-tuning, lora, pytorch, transcripts]
author: Michael Donovan
reading_time: 8
---

After processing 8,647 academic transcripts totaling 27.4M words, I've learned some hard lessons about cost-effective LLM fine-tuning. Here's what worked, what didn't, and how I got professional results for under $20 per training run.

## The Challenge

Academic transcripts present unique challenges for language models:
- **Domain diversity**: 126 academic domains from quantum physics to social policy
- **Technical terminology**: Field-specific jargon changes meaning across contexts
- **Lecture structure**: Different from written text or conversational data
- **Quality variance**: Real-world classroom data with occasional inaudible markers

Standard approaches would cost $500-1000 per training run on cloud GPUs. I needed something better.

## Architecture Decisions

### Why Llama 3.1 8B?

After testing several base models, Llama 3.1 8B offered the best balance:
- Strong baseline performance on technical content
- 8B parameters: Large enough for quality, small enough for fast iteration
- Excellent LoRA fine-tuning results
- Active community and tooling support

### LoRA Configuration

The key to cost efficiency was aggressive LoRA configuration:

```python
lora_config = {
    "r": 16,  # Rank - sweet spot for academic content
    "lora_alpha": 32,  # Scaling factor
    "target_modules": ["q_proj", "k_proj", "v_proj", "o_proj"],
    "lora_dropout": 0.05,
    "bias": "none",
    "task_type": "CAUSAL_LM"
}
```

**Why these values?**
- `r=16`: Higher ranks (32, 64) didn't improve results but doubled training time
- `target_modules`: Focusing on attention layers captured domain-specific patterns
- `lora_dropout=0.05`: Prevented overfitting on technical terminology

## Data Pipeline

### Quality Filtering

Not all transcripts are created equal. Strict filtering:

```python
def is_high_quality(transcript):
    # Minimum word count
    if len(transcript.split()) < 500:
        return False
    
    # Inaudible marker threshold
    inaudible_ratio = transcript.count('[inaudible]') / len(transcript.split())
    if inaudible_ratio > 0.01:  # Max 1% inaudible
        return False
    
    # Check for actual content
    if transcript.count('...') > 10:  # Too fragmented
        return False
    
    return True
```

This reduced the corpus from 9,973 to 8,647 transcripts but dramatically improved model performance.

### Domain Stratification

Critical learning: Random train/test splits failed spectacularly. The model memorized common domains and struggled with rare ones.

Solution:
```python
from sklearn.model_selection import StratifiedShuffleSplit

# Ensure each domain is represented in train/val/test
splitter = StratifiedShuffleSplit(n_splits=1, test_size=0.2)
train_idx, test_idx = next(splitter.split(transcripts, domain_labels))
```

Results:
- Validation loss: 0.68 → 0.42
- Cross-domain generalization: Significantly improved
- Rare domain performance: 3x better

## Cost Optimization

### Hardware Selection

**RTX 4090 via Vast.ai**:
- 24GB VRAM: Perfect for 8B model with 4-bit quantization
- $0.50-0.80/hour: 95% cheaper than A100
- Training time: 10-12 hours per run
- Total cost: $10-20

### Memory Optimization

```python
# 4-bit quantization
bnb_config = BitsAndBytesConfig(
    load_in_4bit=True,
    bnb_4bit_quant_type="nf4",
    bnb_4bit_compute_dtype=torch.bfloat16,
    bnb_4bit_use_double_quant=True
)

# Gradient checkpointing
model.gradient_checkpointing_enable()

# Mixed precision training
training_args = TrainingArguments(
    fp16=True,
    gradient_accumulation_steps=4,
    per_device_train_batch_size=4
)
```

Result: Training fits in 20GB VRAM with room to spare.

## What Didn't Work

### Failed Experiment 1: Full Fine-Tuning

Attempted full parameter fine-tuning:
- Cost: $400+ per run
- Memory: Required A100 (80GB)
- Results: Only marginally better than LoRA
- **Verdict**: Not worth 20x cost increase

### Failed Experiment 2: Aggressive Quantization

Tried 3-bit quantization to save more memory:
- Training unstable (loss spikes)
- Final model quality degraded
- Saved $5 per run, lost 10% performance
- **Verdict**: 4-bit is the sweet spot

### Failed Experiment 3: Synthetic Data Augmentation

Generated synthetic Q&A pairs using GPT-4:
- Time-consuming to generate
- Model learned GPT-4's patterns, not domain knowledge
- Decreased performance on real academic content
- **Verdict**: Real transcripts >>> synthetic data

## Performance Metrics

After optimization:

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Validation Loss | 0.82 | 0.42 | 49% ↓ |
| Domain Coverage | 45% | 98% | 118% ↑ |
| Training Cost | $500+ | $15 | 97% ↓ |
| Training Time | 40h | 11h | 72% ↓ |

## Key Takeaways

1. **Quality > Quantity**: 8,647 high-quality transcripts beat 15,000 mixed-quality
2. **LoRA is Magic**: 98% of full fine-tuning performance at 5% of the cost
3. **Domain Stratification**: Critical for generalization across diverse content
4. **Hardware Matters**: RTX 4090 is the cost/performance king for 8B models
5. **Real Data Wins**: Synthetic augmentation hurt more than it helped

## What's Next

Current directions:
- **Larger corpus**: Targeting 15,000+ transcripts
- **Multi-modal**: Integrating slide content and visual context
- **Streaming inference**: Real-time enhancement for live captioning
- **Domain-specific models**: Separate fine-tunes for STEM vs humanities

The full training pipeline and scripts are available on [GitHub](https://github.com/yourusername/transcripts).

## Resources

- [Training notebooks](https://github.com/yourusername/transcripts/notebooks)
- [Dataset preparation scripts](https://github.com/yourusername/transcripts/scripts)
- [Vast.ai setup guide](https://github.com/yourusername/transcripts/docs/vast-setup.md)

---

Have questions about fine-tuning LLMs on domain-specific data? Reach out on [GitHub](https://github.com/yourusername) or [email](mailto:m.donovan28@gmail.com).
