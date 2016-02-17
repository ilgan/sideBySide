% Autors: SamuelNLP and iGanelin 07/2015
% Notes: Both videos should have the same parameters: fps, size.
close all
clc
clear all

vid1 = VideoReader('Balloons_o4_i35_ext_raw.avi');
vid2 = VideoReader('balloons4ext.avi');
frames = vid1.CurrentTime * vid1.FrameRate;

% start video player
%videoPlayer = vision.VideoPlayer;
% new video
outputVideo = VideoWriter('newvideo.avi');
outputVideo.FrameRate = vid1.FrameRate;
open(outputVideo);

while hasFrame(vid1) && hasFrame(vid2)
    img1 = readFrame(vid1);
    img2 = readFrame(vid2);

    imgt = horzcat(img1, img2);
    frames = frames - 1
    % play video
    %step(videoPlayer, imgt);
    % record new video
    writeVideo(outputVideo, imgt);
end
%release(videoPlayer);
close(outputVideo);