addpath('../neural/examples/houses');
addpath('../neural/examples/horses');
houseImages = dir('../neural/examples/houses/*.jpg');
horseImages = dir('../neural/examples/horses/*.jpg');
unix(pwd);

nfiles = length(houseImages);    % Number of files found
houses = {};
for i=1:nfiles
   house = imresize(rgb2gray(imread(houseImages(i).name)), [20 20]);
   houses{end+1} = house;
end


nfiles = length(horseImages);    % Number of files found
horses = {};
for i=1:nfiles
   horse = imresize(rgb2gray(imread(horseImages(i).name)), [20 20]);
   horses{end+1} = horse;
end

