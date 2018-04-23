for i = 0:9
    sss = sprintf('%06d/summary.txt', i);
    Z = load(sss);
    framenum = Z(:,1);
    x = Z(:,5);
    xx = x ./ (1-x);
    figure
    plot(framenum, xx, '.-');
    ttext = sprintf('%06d:  x / (1-x)', i);
    title(ttext);
    xlabel ('frame number');
end
Z = load('summary.txt');
framenum = Z(:,1);
x = Z(:,5);
xx = x ./ (1-x);
figure
plot(framenum, xx, '.-');
title('MEGA:  x / (1-x)');
xlabel ('frame number');
