Path = 'C:\Users\22935\Desktop\face_recg(1) (2)\train\';                   % 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.bmp'));  % 显示文件夹下所有符合后缀名为.bmp文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.bmp的所有文件的文件名，转换为n行1列
Length_Names = size(FileNames,1);    % 获取所提取数据文件的个数
for k = 1 : Length_Names
    % 连接路径和文件名得到完整的文件路径
    K_Trace = strcat(Path, FileNames(k));
    disp(K_Trace{1,1});
    pic=imread(K_Trace{1,1});
    pic=imresize(pic,[120 120],'bilinear');
    imwrite(pic,K_Trace{1,1});
end
