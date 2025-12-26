# Speech Recognition System for Two-Word Classification (YES / NO)

## Overview
This project implements a simple yet effective **two-word speech recognition system** that
classifies spoken commands **"YES"** and **"NO"** using fundamental **Signals and Systems**
and **Digital Signal Processing (DSP)** concepts.

The system is developed in **MATLAB** and uses **time-domain energy-based feature extraction**
combined with a **minimum-distance classifier** for word recognition.

## Objectives
- Apply Signals and Systems concepts to real-world audio processing  
- Implement time-domain analysis for speech recognition  
- Develop a basic speech classification system  
- Demonstrate the complete signal processing pipeline from acquisition to classification  

## System Description
The speech recognition system consists of three main modules:
1. **Input Module** – Audio acquisition using a microphone  
2. **Processing Module** – Feature extraction and energy computation  
3. **Output Module** – Word classification and result display  

## Signal Processing Pipeline
1. Record reference samples for **YES** and **NO**  
2. Compute time-domain signal energy  
3. Record a test speech sample  
4. Calculate distance from reference energies  
5. Classify using minimum-distance criterion  

## Technologies Used
- MATLAB  
- Audio Processing Toolbox  
- Digital Signal Processing  
- Speech Signal Analysis  

## Results
The system achieved **100% accuracy** during controlled, speaker-dependent testing.
Performance may vary with background noise and different speakers.

## Limitations
- Limited to two-word vocabulary  
- Sensitive to background noise and recording volume  
- Speaker-dependent performance  
- Uses only energy-based features  

## Future Enhancements
- Frequency-domain feature extraction (FFT, MFCC)  
- Noise reduction preprocessing  
- Larger vocabulary support  
- Speaker-independent recognition  

## How to Run
1. Open MATLAB  
2. Run the file `two_word_speech_recognition.m`  
3. Follow on-screen instructions to train and test the system  

## Author
Yashita Mouli  
MPSTME
