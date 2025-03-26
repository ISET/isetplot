function rootPath=iplotRootPath()
% Return the path to the root isetplot directory
%
% This function must reside in the directory at the base of the
% ISETPLOT directory structure.  It is used to determine the location
% of various sub-directories.
%
% Example:
%   fullfile(iplotRootPath,'data')

rootPath=which('iplotRootPath');

rootPath = fileparts(rootPath);

end
