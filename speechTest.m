clc;
close all;
clear all
warning off
c=webcam;
load myNet1;
x=0;
y=0;
height=200;
width=200;
bboxes=[x y height width];
while true
    e=c.snapshot;
    IFaces = insertObjectAnnotation(e,'rectangle',bboxes,'Processing Area');   
es=imcrop(e,bboxes);
    es=imresize(es,[227 227]);
    label=classify(myNet1,es);
    imshow(IFaces);
    result = char(label);
    title(result);
    
    NET.addAssembly('System.Speech');
    obj = System.Speech.Synthesis.SpeechSynthesizer;
    obj.Volume = 100;
    Speak(obj, result);

    drawnow;
end

