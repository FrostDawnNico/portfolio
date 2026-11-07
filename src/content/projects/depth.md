---
title: "Depth of Field Through Multi-Sample Ray Tracing"
group: "research"
groupOrder: 2
previewCover: "images/depth/preview-cover.jpg"
previewCoverAlt: "Frame from the depth of field rendering demonstration"
previewVideo: "images/depth/preview.mp4"
paperUrl: "https://doi.org/10.1088/1742-6596/2711/1/012017"
category: "RESEARCH · RAY TRACING"
period: "2023—2024"
order: 5
summary: "A WebGL rendering experiment exploring focus, refraction and depth of field."
role: "Researcher & developer"
focus: "WebGL / Ray tracing / Optics"
lead: "Reproducing the way a lens gathers light, one sample at a time."
cover: "images/depth/cover.jpg"
coverAlt: "Depth of field ray tracing comparisons from the published paper"
credits: "Sole-authored publication by Zhenkai Zhong, developed with guidance from Prof. James O’Brien."
draft: false
links:
  - label: "Try the interactive demo"
    url: "https://www.shadertoy.com/view/dssBWs"
  - label: "Read the paper"
    url: "https://doi.org/10.1088/1742-6596/2711/1/012017"
---

## The challenge

Depth of field is challenging to reproduce when light passes through refraction or reflection and objects lie on different focal planes. This project investigates a multi-sample ray-tracing approach.

## My contribution

Designed a multi-camera rendering pipeline and calibrated camera positions and directions to approximate lens light capture. Implemented randomized multi-sample rendering in WebGL.

## Approach

Multiple camera samples approximate light rays entering a lens. Their contributions are combined to simulate focus and defocus in a scene, including optical effects explored in the paper.

## Outcome

The interactive ShaderToy demonstration makes the rendering technique directly explorable. The published paper describes the setup, implementation and evaluation.
