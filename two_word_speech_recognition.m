%% TWO-WORD SPEECH RECOGNITION SYSTEM (YES / NO)
% Signals and Systems Project
% Energy-based Speech Classification using MATLAB

clc;
clear;
close all;

%% System Configuration
Fs = 8000;          % Sampling frequency (Hz)
duration = 1;       % Recording duration (seconds)
bits = 16;          % Bit resolution
channels = 1;       % Mono channel

fprintf('=== TWO-WORD SPEECH RECOGNITION SYSTEM ===\n');
fprintf('Signals and Systems Project\n\n');

recorder = audiorecorder(Fs, bits, channels);

%% ---------------- TRAINING PHASE ----------------
fprintf('--- TRAINING PHASE ---\n');

% Record "YES"
fprintf('\nRecording reference for "YES"\n');
for i = 3:-1:1
    fprintf('%d...\n', i);
    pause(1);
end
fprintf('Speak NOW!\n');

recordblocking(recorder, duration);
yes_signal = getaudiodata(recorder);
yes_energy = mean(yes_signal.^2);

fprintf('"YES" Energy: %.6f\n', yes_energy);

% Record "NO"
fprintf('\nRecording reference for "NO"\n');
for i = 3:-1:1
    fprintf('%d...\n', i);
    pause(1);
end
fprintf('Speak NOW!\n');

recordblocking(recorder, duration);
no_signal = getaudiodata(recorder);
no_energy = mean(no_signal.^2);

fprintf('"NO" Energy: %.6f\n', no_energy);

%% ---------------- TESTING PHASE ----------------
fprintf('\n--- TESTING PHASE ---\n');
test_count = 0;
correct_count = 0;

while true
    test_count = test_count + 1;
    fprintf('\nTest #%d\n', test_count);
    fprintf('Say either "YES" or "NO"\n');

    for i = 3:-1:1
        fprintf('%d...\n', i);
        pause(1);
    end
    fprintf('Recording...\n');

    recordblocking(recorder, duration);
    test_signal = getaudiodata(recorder);
    test_energy = mean(test_signal.^2);

    % Distance calculation
    d_yes = abs(test_energy - yes_energy);
    d_no  = abs(test_energy - no_energy);

    % Classification
    if d_yes < d_no
        recognized = "YES";
        confidence = (1 - d_yes / (d_yes + d_no)) * 100;
    else
        recognized = "NO";
        confidence = (1 - d_no / (d_yes + d_no)) * 100;
    end

    % Display result
    fprintf('\n--- RESULT ---\n');
    fprintf('Recognized Word : %s\n', recognized);
    fprintf('Confidence      : %.2f %%n', confidence);
    fprintf('Test Energy     : %.6f\n', test_energy);

    % User verification
    actual = input('Was it correct? (1 = YES, 0 = NO): ');
    if actual == 1
        correct_count = correct_count + 1;
    end

    % Playback
    sound(test_signal, Fs);
    pause(1);

    % Plot
    figure(1); clf;

    t = (0:length(test_signal)-1)/Fs;
    subplot(2,1,1);
    plot(t, test_signal);
    title(['Recorded Speech Signal - ', char(recognized)]);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;

    subplot(2,1,2);
    bar([yes_energy, no_energy, test_energy]);
    set(gca, 'XTickLabel', {'YES Ref', 'NO Ref', 'Test'});
    ylabel('Energy');
    title('Energy Comparison');
    grid on;

    % Continue?
    cont = input('Continue testing? (1 = YES, 0 = NO): ');
    if cont == 0
        break;
    end
end

%% ---------------- PERFORMANCE SUMMARY ----------------
accuracy = (correct_count / test_count) * 100;
fprintf('\n=== PERFORMANCE SUMMARY ===\n');
fprintf('Total Tests   : %d\n', test_count);
fprintf('Correct Tests : %d\n', correct_count);
fprintf('Accuracy      : %.2f %%n', accuracy);
fprintf('=================================\n');

fprintf('System Terminated.\n');


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":32.7}
%---
