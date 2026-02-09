---
layout: post
title: "When Everyone Is a Dev"
date: 2026-02-09
categories: [ai, organizations, security]
tags: [artificial-intelligence, shadow-it, governance, democratization]
reading_time: 10
---

There's a conversation happening right now that goes something like this: AI can generate code, but if it breaks, you're stuck. You don't understand what it wrote, you can't debug it, and you're worse off than when you started.

That's a real concern. But it's not the one I think about.

The one I think about is what happens when the people who were never supposed to be writing code start writing code—and they're not doing it as a hobby project. They're doing it inside organizations, with real data, solving real problems, faster than IT can keep up with.

I'm one of those people. And there are a lot more of us than most organizations realize.

## The App Script Inflection Point

My team lived in Google Docs and Sheets for years. We had a workflow that was clunky but functional: someone fills out a form, someone else copies data into a spreadsheet, a third person emails a summary. Manual, slow, everyone complained about it.

Then I discovered that AI can write Google Apps Script.

Within an afternoon, I had a script that auto-processed form submissions, wrote to the sheet, and fired off formatted emails. It worked. The team was thrilled. A process that used to eat hours every week just ran itself.

Did I submit a ticket to IT first? No. It didn't even occur to me. I had a problem, I solved it, and the solve felt so small and self-contained that the formal process would've taken longer than writing the script. The barrier to automating a workflow had just dropped from "submit a ticket and wait three months" to "ask Claude during lunch."

And this is the part that matters: that wasn't reckless. That was efficient. The script does exactly what it's supposed to do. But it exists entirely outside any system that IT knows about, and that's true of an increasing amount of tooling being built across every organization right now.

## The Shadow Stack

We've always had shadow IT. People have been spinning up unauthorized Trello boards and Slack workspaces for years. But there's a qualitative difference between adopting a SaaS tool and writing custom code that processes organizational data.

When someone signs up for a project management tool, the blast radius is limited. The data stays in that tool's ecosystem, and the tool has its own security team, compliance certifications, and incident response.

When someone writes an Apps Script that pulls data from a spreadsheet, transforms it, and pushes it somewhere—that infrastructure doesn't exist. There's no security team behind it. There's no compliance certification. There's a script that works, and a person who built it because the official alternative was waiting in a queue.

And that's the mild version. What happens when somebody decides the spreadsheet isn't enough? When they want a proper web app? AI can build that too. A full-stack application with a database, authentication, and a public URL. Hosted on a free tier somewhere, outside the organization's network, outside their security perimeter.

People aren't doing this to cause problems. They're doing it because the tools are available, the problems are real, and the official channels are slow. That combination has always produced shadow IT. The difference now is that the shadow IT isn't a SaaS subscription—it's custom software.

## The Competence Gradient

Here's what makes this genuinely interesting: the people doing this aren't fumbling around. They're often the most motivated, resourceful people on their teams. They identified a problem, found a tool, and shipped a solution. That's exactly the kind of initiative organizations say they want.

But there's a real gap between "I can get AI to produce working code" and "I understand the full implications of what I've deployed." I've felt that gap myself. I've gotten better at reading what AI generates—checking for obvious issues, thinking about edge cases, asking questions before I ship something. But that instinct came from experience, not from day one, and it's the kind of thing that takes time to develop.

The challenge is that AI removes most of the friction that used to force that learning. The code comes out fast, it looks polished, and it usually works. When you've been writing software for years, you've built an instinct to be skeptical of code that works on the first try. When you're newer to this, working code is the finish line. The concept of "it works but there's a problem you can't see" is hard to internalize until you've lived it.

This isn't a reason to gatekeep who gets to build things. It's a reason to think seriously about how organizations support the people who are building them.

## The Millennial Help Desk

There's a social layer to this that doesn't get enough attention.

In a lot of organizations, there are informal support networks—group chats, channels, even Discord servers—where the more technically inclined help out everyone else. Shadow tech support. It's been around forever.

Now drop AI-generated code into that ecosystem.

You get a channel where someone posts a script they got from ChatGPT, someone else modifies it with Claude, a third person asks how to make it work with their specific setup, and the advice they get is a patchwork of AI-generated suggestions from people who are all learning in real time. It's collaborative. It's fast. And the quality control is basically vibes.

You ever get a bunch of millennials on a shadow tech support server and have a boomer ask them how to do something? It's an absolute mess. Everyone's helpful. Everyone's confident. Nobody actually knows if what they're suggesting is going to silently break something three weeks from now. And the person asking the question has no way to tell the difference between solid advice and fluent guessing.

This isn't a dysfunction. It's what happens when people are resourceful and the formal support structures are too slow to help them. The energy is right. The infrastructure around it is missing.

## The Spite Cycle

Here's where it gets ugly.

You see a problem. You solve it. You automate something that was eating your team's time, and for a few weeks, everything is better. Then IT finds out. The script gets flagged, the app gets shut down, and you're told to submit a request through the proper channels.

Now you're back where you started. The same broken process, the same manual work, the same frustration—except now it's worse, because you've seen the alternative. You know it can be better. You built the better version. And someone took it away, not because it didn't work, but because it didn't go through the right doors.

That doesn't produce compliance. That produces spite.

Spite-driven shadow IT is a completely different animal than ignorance-driven shadow IT. When someone doesn't know the rules, you can educate them. When someone knows the rules, followed them, got nowhere, solved the problem themselves, and then got punished for it—they're not coming back to the help desk. They're going deeper underground. The next thing they build, they're not going to mention to anyone. They'll make sure IT doesn't find it.

And now you've got people who are actively trying to stay off the radar, building things that are harder to discover, harder to govern, and motivated by the exact kind of frustration that makes people cut corners. That's a worse outcome than whatever the original governance concern was.

## How Does IT Keep Up?

This is the real question, and I don't think most organizations are asking it yet.

The traditional IT governance model assumes a bottleneck: all technology flows through a central team that can evaluate, approve, and monitor it. That bottleneck was always a source of frustration, but it was also a control surface. It's where security reviews happened, where data classification was enforced, where somebody asked "does this comply with our retention policy?"

AI-assisted development doesn't just route around that bottleneck. It makes it irrelevant. When anyone can build a functional application in an afternoon, the central IT team can't possibly keep up. They don't even know what's being built, let alone where it's running or what data it's touching.

The standard response will be policy: "Don't build unauthorized applications." And that will work about as well as "don't use personal devices for work" worked a decade ago. The tools are too good and the official channels are too slow. People aren't going to stop.

And here's the thing: they shouldn't have to. Not using AI to build solutions doesn't make you more careful or more professional. It just makes you slower. People across every department are catching up to capabilities that used to be locked behind years of technical training. That's not a threat to manage. That's a shift to adapt to.

The question isn't how to prevent people from building things. It's how IT evolves from a gatekeeping function to something more like an enablement function—providing guardrails, templates, safe defaults, and review processes that work at the speed people are actually moving. Because if the choice is between "do it the right way in three months" and "do it my way this afternoon," people are going to pick the afternoon. Every time.

## Where This Leaves Us

I think this is mostly good. People being able to build tools that solve their own problems is genuinely powerful. The spreadsheet was revolutionary for the same reason—it put analytical capability in the hands of people who weren't programmers.

But spreadsheets didn't have network access. They didn't authenticate against external services. They didn't store data on third-party servers. They didn't have the attack surface of a web application.

The gap between what people can build and what they fully understand about what they've built is real, and it's wider than most people think. I include myself in that. But the answer isn't to close the gap by taking the tools away. It's to close it with better support, better defaults, and governance models that actually account for the fact that the person building your next internal tool might be someone in operations who had a good idea and an AI subscription.

That's the "everyone is a dev" future. Not the inspirational conference talk version. The Tuesday afternoon version, where someone automates their workflow because the official process was going to take a quarter. The tools are incredible. The organizations around them haven't caught up yet. And that's where the interesting problems are.
