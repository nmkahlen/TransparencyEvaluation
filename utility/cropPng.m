
directory = '/Users/meyern2/Documents/Projects/2023_headphones/TransparencyEvaluation/model/colouration/Figures/';
s = dir(strcat(directory,'*.png')); % s is structure array

file_list = {s.name}'; % convert the name field into cell array of strings.


for iFile = 1:length(s)
    IMG = imread([directory, s(iFile).name]);

    IMG_BW = mean(IMG, 3);

    cols = mean(IMG_BW, 2);
    rows = mean(IMG_BW, 1);

    iStartCol = find(cols < 255, 1, 'first');
    cols(1:iStartCol) = 0;
    iEndCol = find(cols == 255, 1, 'first'); 


    iStartRow = find(rows < 255, 1, 'first');
    rows(1:iStartRow) = 0;
    iEndRow = find(rows == 255, 1, 'first'); 

    IMG_cropped = IMG(iStartCol:iEndCol, iStartRow:iEndRow, :);

    imwrite(IMG_cropped,  [directory, s(iFile).name])



end