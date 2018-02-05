%abs(-1220_->wb  ->send 1
%7500>abs>2320   whale  ->send 2
%700~1300   dolphin  ->send 3
%8000>-->ship  ->send 4

clc;
clear;
close all;

cd 'D:\fishackthon\whitebackground\search5973478-20180203T110517Z-001\search5973478'
list=dir('*.mp3');

for k=1:length(list) 

[y, fs] = audioread(list(k).name); 
%[y, fs] = audioread('D:\fishackthon\search5973468\JASCOAMARHYDROPHONE2402_20161007T235505.528Z-audio.mp3');%MATLAB �Ӫ���Ū������
y=y(:,1);
%sound(y, fs);	% ���񦹭��T
time=(1:length(y))/fs;	% �ɶ��b���V�q
plot(time, y);	% �e�X�ɶ��b�W���i��



X = fft(y);
magX=abs(X);
angX=angle(X);
K = fft(X);
L = fft(K);
%M = fft(L);
%N = fft(M);


%subplot(221); %subplot(nnk(�ϧε���n*n������k�i��));
%plot(y);title('��l�i��');
%fprintf('��l�i�έ� = %s\n', y);

%subplot(222);
%plot(X); title('��l�W��');
%fprintf('��l�i�έ� = %s\n', X);

%subplot(223);
%plot(K);title('FFT�W��');
%fprintf('��l�i�έ� = %s\n', magX);

%subplot(224);
%plot(L);title('FFT2�W��');
%fprintf('��l�i�έ� = %s\n', angX);

%subplot(335);
%plot(M);title('FFT3�W��');
%subplot(336);
%plot(N);title('FFT4�W��');
%subplot(337);
%plot(O);title('FFT5�W��');
%subplot(338);
%plot(P);title('FFT6�W��');
%subplot(339);
%plot(Q);title('FFT7�W��');



%fprintf('�����I�ѪR�� = %g �줸/�����I\n', info.BitsPerSample);

%%h=figure(1);
%gcf=get current figure;
%print -dpng 'FIG1.jpg';
%saveas(gcf,[plot_ouput.png'], 'png');

filename = sprintf('%s.txt', list(k).name);

fid = fopen(filename, 'w'); % �H�g�J�Ҧ��}�Ҧ�� c:\ �U �� txt �ɮ�(�Y�ɮפw�s�b�h�л\;�Ϥ�,�إ߷s��) 
fprintf(fid, '%f\n', K ); % �H�B�I�Ʈ榡�g�J K ��ƨô���
fclose(fid); % ���� 
end


clc;
clear;
close all;

cd 'D:\fishackthon\whitebackground\search5973478-20180203T110517Z-001\search5973478'
list=dir('*.txt');

for k=1:length(list) 

[y] = importdata(list(k).name, '%d'); 

y = sum(y(:))/1000000;
%z = num2str(y);

finaldata = 0;
  if abs(y) >= 1220
        finaldata = 1;
  elseif 7500 >= abs(y) & 2300 <= abs(y)
        finaldata = 2;
  elseif 1300 >= abs(y) & 700 <= abs(y)
        finaldata = 3;
  elseif abs(y) >= 8000
        finaldata = 4;
  end

cd 'C:\ProgramData\chocolatey\bin'
command = sprintf('curl -X GET -H "Content-Type: text" http://384ebc1b.ngrok.io/gmaps/api/update/1/23/122/%d', finaldata);
status = system(command)

cd 'D:\fishackthon\whitebackground\search5973478-20180203T110517Z-001\search5973478'
filename = sprintf('2%s.txt', list(k).name);

fid = fopen(filename, 'w'); % �H�g�J�Ҧ��}�Ҧ�� d:\ �U �� txt �ɮ�(�Y�ɮפw�s�b�h�л\;�Ϥ�,�إ߷s��) 
fprintf(fid, '%f\n', y ); % �H�B�I�Ʈ榡�g�J K ��ƨô���
fclose(fid); % ���� 
end

