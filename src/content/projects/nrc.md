---
title: "Neural Radiance Caching in Falcor"
group: "research"
groupOrder: 3
category: "RESEARCH · PATH TRACING"
period: "2024"
order: 4
summary: "An implementation of neural radiance caching for a path-tracing renderer built on Falcor."
role: "Graphics research & implementation"
focus: "Falcor / Path tracing / Neural rendering"
lead: "Learning a radiance cache to support path tracing in real time."
cover: "images/nrc/cover.jpg"
coverAlt: "Rendered scene from the Falcor neural radiance caching project"
credits: "Developed as a remote engine graphics research project under the guidance of Guanrong Lian."
draft: false
links: []
---

## The challenge

Path tracing can produce rich global illumination, but tracing enough light paths is computationally expensive. Neural radiance caching explores learning radiance information during rendering.

## My contribution

Implemented neural radiance caching in the Falcor framework, building a neural network and an inference system to learn ray information and represent an implicit cache.

## Approach

The project combines path-tracing calculations with a learned representation. The system uses inference to estimate additional radiance information during rendering, targeting the graphics APIs supported by the implementation.

## Outcome

The project investigates the tradeoff between rendering cost and visual quality. The image shown is from the supplied project materials; detailed benchmarks are not included here.
