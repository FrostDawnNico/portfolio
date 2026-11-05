---
title: "Neural Metameric Enhancement for Foveated Rendering"
category: "RESEARCH · PERCEPTUAL RENDERING"
period: "2023—2024"
order: 1
summary: "A perceptually guided neural approach to reconstructing peripheral detail for real-time rendering."
role: "Research contributor · Neural rendering"
focus: "Neural rendering / Perception / VR"
lead: "Making the periphery more convincing, without rendering every pixel at full fidelity."
cover: "images/foveated/cover.jpg"
coverAlt: "Comparison images from the foveated rendering research paper"
credits: "Research with Jiannan Ye, Xiaoxu Meng, and Xubo Yang. Zhenkai Zhong is a co-author."
draft: false
links: [{"label":"Read the paper","url":"https://link.springer.com/chapter/10.1007/978-3-031-82021-2_16"}]
---

## The challenge

Foveated rendering reduces shading work in peripheral vision, but aggressive undersampling can introduce blur and aliasing. This research investigates how perceptual modeling and a lightweight neural network can improve the visual result.

## My contribution

Designed a lightweight neural network guided by a metamer-based loss, and developed a shrunk log-polar sampling space to reduce rendering work and compact the network input.

## Approach

The method works as a post-rendering enhancement pass. It resamples the input in a compact coordinate space and uses a perceptually motivated objective to guide reconstruction of peripheral image content.

## Outcome

The research explores real-time neural enhancement for foveated rendering. The paper presents its evaluation and technical details; results should be read in the context of its experimental setup.
