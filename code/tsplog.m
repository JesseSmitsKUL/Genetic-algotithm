function tsplog(data, dir, name)

path = fullfile(dir, name);

% Create empty file
fclose(fopen(path, 'w'));

fileID = fopen(path,'a');

% print lines
for entry = data
    line = sprintf("%d,%f,%f,%f", entry.gen, entry.min_trip, entry.mean_trip, entry.max_trip);
    fprintf(fileID, "%s\n", line);
end

fclose(fileID);

end