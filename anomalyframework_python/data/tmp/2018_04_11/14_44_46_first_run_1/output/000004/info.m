global allie_numThreadsRun;
global allie_windowSize;
global allie_windowStride;
global allie_inputFile;
global allie_inputFile_base;
global allie_numLinesInInputFile;
global allie_numVarsPerLine;
global allie_featureIndicesAreZeroBased;
global allie_blockShuffleSize;
global allie_reverseInput;
global allie_numShuffles;
global allie_maxBufferSize;

allie_numThreadsRun = 8;
allie_windowSize = 100;
allie_windowStride = 50;
allie_inputFile = '/home/danny/Downloads/first_run.train';
allie_inputFile_base = 'first_run.train';
allie_numLinesInInputFile = 1044;
allie_numVarsPerLine = 105;
allie_featureIndicesAreZeroBased = 1;
allie_blockShuffleSize = 1;
allie_reverseInput = 0;
allie_numShuffles = 10;
allie_maxBufferSize = -1;
if (exist('allie_plot_results'))
  Z = load('summary.txt');
  framenum = Z(:,1);
  orig_linenum = Z(:,2);
  numPredicted = Z(:,3);
  sumPredicted = Z(:,4);
  x = Z(:,5);
  xx = x ./ (1-x);
  if (0)
    figure;
    plot(framenum, x, '.-');
    title 'x'
    xlabel 'frame number'
  end
  figure;
  plot(framenum, xx, '.-');
  title 'x / (1-x)'
  xlabel 'frame number'
end
