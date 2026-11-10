---
title: Open-source Quadcopter Project 
layout: student_project
image: /img/student_project/Lab_TestBench2.jpeg
hero_height: is-small
hero_image: /img/connect_globe.jpeg  
price: 1 # for sorting 
abstract: Build an open, maintainable quadcopter platform for teaching flight estimation and feedback control.
skills:
  - Control theory and MATLAB/Simulink
  - Embedded C++ or ArduPilot
  - Mechanical design, CAD, or interface design
duration: One or two semesters
supervisor: Ruslan Archipov and Prof. Daniel Zelazo
contact_email: sarchi@technion.ac.il
---

The Advanced Control Lab was built around Parrot minidrones and their Simulink support package. Because that hardware is no longer available, the course needs a replacement that students can understand, repair, and program at a low level.

## The platform

An ArduPilot-to-Simulink toolchain and a proof-of-concept vehicle are already under development. The goal is a reproducible open platform that exposes the estimation and control loops needed by the course while remaining safe and practical for repeated laboratory use.

## What the project can include

- Integrate sensors, flight hardware, and protective structure into the frame.
- Extend and test the Simulink/ArduPilot interface.
- Design a clear student-facing workflow for experiments.
- Validate the platform against the course syllabus and prepare it for production.
