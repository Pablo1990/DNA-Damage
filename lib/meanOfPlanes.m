function [ centroids ] = meanOfPlanes( cellsInfo )
%MEANOFPLANES Summary of this function goes here
%   Detailed explanation goes here
    centroids = zeros(length(cellsInfo), 3);
    for numCellFound = 1:length(cellsInfo)
        cellFound = cellsInfo{numCellFound};
        cellPlanes = unique(cellFound(:, 3));
        actualCentroid = zeros(length(cellPlanes), 2);
        for cellPlane = 1:length(cellPlanes)
            cellFoundInPlane = cellFound(cellFound(:, 3) == cellPlanes(cellPlane), 1:2);
            if ~isempty(cellFoundInPlane)
                actualCentroid(cellPlane, :) = mean(cellFoundInPlane);
            end
        end
        
        centroids(numCellFound, :) = [mean(actualCentroid), mean(cellFound(:, 3))];
    end
end
