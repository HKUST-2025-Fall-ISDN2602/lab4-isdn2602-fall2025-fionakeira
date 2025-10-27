% Source Coding 
% Task 1
clear all; close all; clc;
addpath("library_p\");

% Load the input image
lorem_img = imread('lorem_img.png');
 
% display the raw image
figure(1); clf;
imshow(lorem_img);
title('Original image');

% run-length encode
run_length_code = runlength_encode(lorem_img);
% convert the binary array into an decimal array of run lengths
runs = bin2decArray(run_length_code);

size_raw_data = length(lorem_img(:))
size_run_length = length(run_length_code)

size_huffman = [];
dict = [1,0];
for i=1:length(dict)
    % Huffman encode
    % huffman_encode(runs,dict)
    % if dict = 1, same dictionary for both black and white runs
    % if dict = 0, separate dictionaries for black and white runs
    size_huffman = [ size_huffman length(huffman_encode(runs,dict(i)))];
end
size_huffman

% transpose
lorem_img_rotated = lorem_img.';

% display the rotated image
figure(2); clf;
imshow(lorem_img_rotated);
title('Rotated image');

% Run-length encode the rotated image
run_length_code_rotated = runlength_encode(lorem_img_rotated);
runs_rotated = bin2decArray(run_length_code_rotated);

% Bitstream lengths for rotated image
size_raw_data_rotated = length(lorem_img_rotated(:));
size_run_length_rotated = length(run_length_code_rotated);

size_huffman_rotated = [];
dict = [1, 0];
for i = 1:length(dict)
    size_huffman_rotated = [size_huffman_rotated length(huffman_encode(runs_rotated, dict(i)))];
end

% Display results
disp('--- Rotated Image Results ---');
disp(['Raw encoding: ', num2str(size_raw_data_rotated), ' bits']);
disp(['Run-length (8-bit): ', num2str(size_run_length_rotated), ' bits']);
disp(['Huffman (1 dict): ', num2str(size_huffman_rotated(1)), ' bits']);
disp(['Huffman (2 dicts): ', num2str(size_huffman_rotated(2)), ' bits']);

